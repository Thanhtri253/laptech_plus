#  LAPTECH+ — Computer Shop Management Software

> Final Project — Software Engineering | Ton Duc Thang University | 2025

**Advisor:** Ph.D. Nguyen Ngoc Phien

---

##  Overview
LAPTECH+ is a web-based Computer Shop Management System built with 
PHP MVC architecture. It supports two main user groups:
- **Customers** — Browse products, add to cart, checkout, track orders
- **Admin/Staff** — Manage inventory, orders, promotions, and sales reports

## Tech Stack
- **Backend:** PHP 8.1 (OOP, MVC pattern)
- **Frontend:** HTML5, Bootstrap 5, AdminLTE, jQuery, Ajax
- **Database:** MySQL 8.0
- **Server:** Apache via XAMPP
- **Tools:** VS Code, phpMyAdmin, Postman, Git

## ⚙️ Installation

### Requirements
- XAMPP (PHP 8.1+, MySQL 8.0+)
- Git

### Steps
```bash
# 1. Clone the repository
git clone https://github.com/your-username/php-ocls.git

# 2. Copy to XAMPP's htdocs
cp -r php-ocls/ /xampp/htdocs/

# 3. Setup environment
cp .env.example .env
# Edit .env with your DB credentials

# 4. Import database
# Open phpMyAdmin → Create DB "ocl_db"
# Import: database/database_setup.sql

# 5. Run
# Start Apache + MySQL in XAMPP
# Visit: http://localhost/php-ocls/public
```

## Default Login
| Role | Username | Password |
|------|----------|----------|
| Super Admin | admin | admin123 |

## Project Structure
(see docs/final_report.pdf for full architecture)
