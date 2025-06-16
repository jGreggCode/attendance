# 📘 SACLI RFID Attendance System – Installation Guide

Welcome to the SACLI RFID Attendance Management System. This guide will walk you through setting up the project on your local machine. Perfect for developers or IT admins maintaining the system.

## 🧱 Project Structure Overview

```
attendance/
├── includes/
│   └── database/
│       └── constant.php        ← 🔧 Configure your DB credentials here
│   └── saclitms.sql            ← 📂 SQL file to import (initial database)
├── public/
│   └── index.php               ← 🔑 Login
│   └── gate.html               ← 🚀 Main entry point of the system
```

## ⚙️ System Requirements

Before you begin, make sure your local environment includes the following:

- ✅ PHP 8.1 or higher
- ✅ MySQL
- ✅ Apache or any local server platform (e.g. XAMPP, Laragon, WAMP)

## 🚀 Step-by-Step Installation

📥 1. Clone or Download the Repository
Using Git (recommended):

```
git clone https://github.com/jGreggCode/attendance.git

```

Or download the ZIP from GitHub and extract it.

## 🗃️ 2. Import the Database

1. Open phpMyAdmin or your preferred MySQL tool.
2. Create a new database (e.g., saclitms).
3. Import the file saclitms.sql located in:

```
includes/database/saclitms.sql

```

## ⚙️ 3. Configure the Database Connection

Edit the database configuration file:

```
includes/database/constant.php
```

Update the following constants with your database credentials:

```
define('DB_HOST', 'localhost');
define('DB_NAME', 'saclitms');
define('DB_USER', 'your_username');
define('DB_PASS', 'your_password');
```

💡 Tip: If you're using XAMPP or Laragon, the default user is usually root with no password.

## 🌐 Access the Website

Navigate to Login

```
http://localhost/attendance/public/
```

Navigate to Attendance

```
http://localhost/attendance/public/gate.html
```

Make sure your local server is running.

## 🛠 Troubleshooting

- ❌ Database connection error?
  Double-check your constant.php values.
- ❌ Blank page or 500 error?
  Turn on PHP error reporting or check Apache logs.
- ❓ Still stuck?
  Reach out or open an issue on GitHub if you're using my the repository.

## 📄 License

This project is protected by a custom license.
© 2025 John Gregg Felicisimo (jgdev). All rights reserved.
Unauthorized reproduction, modification, or distribution is strictly prohibited.

📩 For questions:
jgreggfel@gmail.com
