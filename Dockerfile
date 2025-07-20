# Stage 1: Node for Vite build
FROM node:18.19.1-slim AS vite-builder

WORKDIR /app

# Install all dependencies (including devDependencies like vite)
COPY package.json package-lock.json* ./
RUN npm ci && npm cache clean --force

COPY . .
RUN npm run build

# Stage 2: PHP + Laravel (Apache)
FROM php:8.2.10-apache-bullseye

RUN a2enmod rewrite headers && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    libzip-dev unzip git curl libpng-dev libjpeg-dev libfreetype6-dev && \
    rm -rf /var/lib/apt/lists/* && apt-get clean

RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql zip opcache && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd

COPY docker/php.ini "$PHP_INI_DIR/php.ini"
RUN sed -i \
    -e 's/expose_php = On/expose_php = Off/' \
    -e 's/memory_limit = 128M/memory_limit = 256M/' \
    -e 's/upload_max_filesize = 2M/upload_max_filesize = 10M/' \
    -e 's/post_max_size = 8M/post_max_size = 10M/' \
    -e 's/max_execution_time = 30/max_execution_time = 60/' \
    "$PHP_INI_DIR/php.ini"

WORKDIR /var/www/html

COPY --from=composer:2.6.5 /usr/bin/composer /usr/bin/composer

RUN groupadd -g 1000 laravel && \
    useradd -u 1000 -g laravel -s /bin/bash -m laravel && \
    chown -R laravel:laravel /home/laravel

COPY --from=vite-builder --chown=laravel:laravel /app /var/www/html

# Only include this if .env.production actually exists
COPY --chown=laravel:laravel .env.production .env

RUN chown -R laravel:www-data /var/www/html && \
    chmod -R 750 /var/www/html && \
    chmod -R 770 /var/www/html/storage /var/www/html/bootstrap/cache && \
    find /var/www/html -type f -exec chmod 640 {} \;

USER laravel
RUN composer install --no-dev --optimize-autoloader --no-interaction
USER root

COPY docker/apache.conf /etc/apache2/sites-available/000-default.conf
RUN echo "ServerTokens Prod" >> /etc/apache2/apache2.conf && \
    echo "ServerSignature Off" >> /etc/apache2/apache2.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/health || exit 1
