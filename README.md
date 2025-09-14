🛒 EcommerceApp

A Java-based E-commerce web application built with JSP, Servlets, Apache Tomcat, and MySQL. This app provides a complete online shopping experience including user registration, product management, cart functionality, and order processing.

✨ Features

User Management: Register, login, and view profile.

Product Catalog: Browse products by categories and view detailed information.

Shopping Cart: Add products to cart, update quantities, and remove items.

Order Processing: Place orders and manage checkout.

Database Integration: Persistent storage using MySQL.

🛠 Tech Stack
Layer	        Technology
--------      -----------
Frontend	    JSP, HTML, CSS
Backend	      Java Servlets, JDBC
Server	      Apache Tomcat
Database	    MySQL (Workbench)
IDE	Apache    NetBeans
📂 Project Structure
Ecommerceapp/
├── Web Pages/
│   ├── META-INF/
│   │   └── context.xml
│   ├── WEB-INF/
│   │   └── web.xml
│   ├── images/                  # Frontend images
│   ├── admin.jsp
│   ├── cart.jsp
│   ├── checkout.jsp
│   ├── index.jsp
│   ├── login.jsp
│   ├── manageProducts.jsp
│   ├── product-detail.jsp
│   ├── products.jsp
│   ├── profile.jsp
│   └── register.jsp
│
├── Source Packages/
│   └── com.ecommerce.controller/
│       ├── AdminController.java
│       ├── CartController.java
│       ├── CheckoutController.java
│       ├── ProductController.java
│       └── UserController.java
│
│   └── com.ecommerce.util/
│       └── DBConnection.java
│
├── Libraries/
│   ├── mysql-connector-j-9.4.0.jar
│   └── JDK 24 (Default)
│
├── Configuration Files/
│   ├── MANIFEST.MF
│   ├── context.xml
│   ├── web-fragment.xml
│   └── web.xml
