# Ecommerceapp
basic functional Ecommerce app 

A Java-based E-commerce web application built using **JSP, Servlets, Apache Tomcat, and MySQL**.

## 🚀 Features
- User registration and login
- Product listing with categories
- Add to Cart and Update Cart Quantity
- Order placement
- Database connection with MySQL

## 🛠 Tech Stack
- **Frontend:** JSP, HTML, CSS
- **Backend:** Java Servlets, JDBC
- **Server:** Apache Tomcat
- **Database:** MySQL (Workbench)
- **IDE:** Apache NetBeans

## 📂 Project Structure
Ecommerceapp/
├── Web Pages/
│ ├── META-INF/
│ │ └── context.xml
│ ├── WEB-INF/
│ │ └── web.xml
│ ├── images/ # Images used in the frontend
│ ├── admin.jsp
│ ├── cart.jsp
│ ├── checkout.jsp
│ ├── index.jsp
│ ├── login.jsp
│ ├── manageProducts.jsp
│ ├── product-detail.jsp
│ ├── products.jsp
│ ├── profile.jsp
│ └── register.jsp
│
├── Source Packages/
│ └── com.ecommerce.controller/
│ ├── AdminController.java
│ ├── CartController.java
│ ├── CheckoutController.java
│ ├── ProductController.java
│ └── UserController.java
│
│ └── com.ecommerce.util/
│ └── DBConnection.java
│
├── Libraries/
│ ├── mysql-connector-j-9.4.0.jar
│ └── JDK 24 (Default)
│
├── Configuration Files/
│ ├── MANIFEST.MF
│ ├── context.xml
│ ├── web-fragment.xml
│ └── web.xml
