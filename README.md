# 🛍️ Laravel eCommerce with Admin Panel

A fully functional **Laravel-based eCommerce platform** with Admin Dashboard, Product Management, Category Management, Order Tracking, User Roles, and more — built from scratch using modern web development best practices.

![Laravel eCommerce Screenshot](https://via.placeholder.com/1000x500?text=Project+Screenshot)

---

## 🚀 Features

### 🧑‍💼 Admin Dashboard

- View user stats, product counts, top-selling products
- Manage categories, products, and orders

### 🛒 Product & Category Management

- CRUD operations with image upload support
- Category-wise filtering and dynamic display

### 📦 Order Management

- Track order status: pending, completed
- View individual order details and order items

### 👥 User Authentication

- Login/register
- Admin vs customer role-based access

### 📊 Analytics & Reporting (coming soon)

- Daily/weekly sales insights
- Best-selling products

---

## 🛠️ Tech Stack

| Tech               | Purpose                          |
|--------------------|----------------------------------|
| **Laravel 11**     | Backend framework                |
| **MySQL**          | Database                         |
| **Blade**          | Templating engine                |
| **Tailwind CSS**   | UI styling                       |
| **Laravel Auth**   | Secure authentication            |
| **Eloquent ORM**   | Elegant database relationships   |
| **Factories/Seeders** | Dummy data for testing         |

---

## 📁 Project Structure

```

📦 ecommerce
┣ 📂 app
┣ 📂 database
┃ ┣ 📂 seeders
┃ ┗ 📂 factories
┣ 📂 resources
┃ ┗ 📂 views
┣ 📂 routes
┃ ┗ 📜 web.php
┣ 📂 public
┗ 📜 README.md

````

---

## ⚙️ Setup Instructions

### 1. Clone the repo

```bash
git clone https://github.com/anand-mukul/Laravel-eCommerce.git
cd ecommerce-admin-panel
````

### 2. Install dependencies

```bash
composer install
npm install && npm run dev
```

### 3. Environment setup

```bash
cp .env.example .env
php artisan key:generate
```

Set your DB credentials in `.env`.

### 4. Run migrations and seeders

```bash
php artisan migrate --seed
```

### 5. Start local server

```bash
php artisan serve
```

Visit [http://localhost:8000](http://localhost:8000)

---

## 👤 Admin Credentials

```text
Email: admin@example.com
Password: password
```

*(Generated via seeder)*

---

## 🔒 Roles & Access

| Role  | Access                                     |
| ----- | ------------------------------------------ |
| Admin | Full access to dashboard and management    |
| User  | Limited to frontend features (coming soon) |

---

## 📷 Screenshots

| Dashboard                                                | Product Management                                      | Order View                                            |
| -------------------------------------------------------- | ------------------------------------------------------- | ----------------------------------------------------- |
| ![1](https://via.placeholder.com/400x200?text=Dashboard) | ![2](https://via.placeholder.com/400x200?text=Products) | ![3](https://via.placeholder.com/400x200?text=Orders) |

---

## 💡 Learning Highlights

- Built complete CRUD operations using Laravel resource controllers
- Utilized Eloquent relationships effectively (`hasMany`, `belongsTo`)
- Created complex seeders and factories to generate test data
- Implemented authentication and role-based access control
- Hands-on experience with Laravel migrations and database design

---

## 🎯 Why This Project?

✅ Demonstrates **backend proficiency** with Laravel

✅ Uses **real-world eCommerce structure** (Products, Orders, Users)

✅ Follows **MVC architecture** and Laravel best practices

✅ Ready to be extended into a full-fledged shopping platform

---

## 📩 Hire Me / Internship Ready

I'm actively seeking **web development internship opportunities** where I can apply my Laravel, PHP, and backend skills to build real-world applications and grow as a developer.

> 🔗 [LinkedIn](https://linkedin.com/in/dev-anand)
> 📧 [mukulanand.dev@gmail.com](mailto:mukulanand.dev@gmail.com)

---

## 📝 License

This project is open-sourced under the [MIT license](LICENSE).
