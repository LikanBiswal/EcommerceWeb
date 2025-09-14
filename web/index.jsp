<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>E-Commerce Store</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: #f4f6f9;
            color: #333;
        }
        .header {
            background: #1f2937;
            color: white;
            padding: 18px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 26px;
        }

        .nav {
            background: #374151;
            padding: 10px;
            text-align: center;
        }
        .nav a {
            color: #d1d5db;
            text-decoration: none;
            margin: 0 12px;
            font-size: 15px;
            padding: 6px 10px;
            border-radius: 4px;
            transition: background 0.3s;
        }
        .nav a:hover {
            background: #4b5563;
            color: #fff;
        }

        .container {
            max-width: 1100px;
            margin: 25px auto;
            padding: 15px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #111827;
            font-size: 22px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 18px;
        }
        .product-card {
            background: white;
            border-radius: 8px;
            padding: 15px;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
        }
        .product-card img {
            width: 100%;
            height: 180px;
            object-fit: contain;
            margin-bottom: 12px;
            background: #f9fafb;
            border-radius: 6px;
        }
        .product-card h3 {
            margin: 8px 0;
            font-size: 18px;
            color: #1f2937;
        }
        .price {
            font-size: 16px;
            font-weight: bold;
            color: #2563eb;
            margin: 6px 0 12px;
        }
        .btn {
            display: inline-block;
            background: #2563eb;
            color: white;
            padding: 8px 16px;
            text-decoration: none;
            border-radius: 6px;
            font-size: 14px;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #1d4ed8;
        }

        .view-all {
            text-align: center;
            margin-top: 30px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h1>Our Online Store</h1>
    </div>

    <!-- Navigation Bar -->
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>

    <!-- Main Content -->
    <div class="container">
        <h2>Featured Products</h2>
        
        <div class="product-grid">
            <!-- Product 1 -->
            <div class="product-card">
                <img src="images/phone.jpeg" alt="Smartphone">
                <h3>Sample Product 1</h3>
                <p class="price">₹15999</p>
                <a href="ProductController?action=view&id=2" class="btn">View Details</a>
            </div>

            <!-- Product 2 -->
            <div class="product-card">
                <img src="images/laptop.jpeg" alt="Laptop">
                <h3>Sample Product 2</h3>
                <p class="price">₹45999</p>
                <a href="ProductController?action=view&id=1" class="btn">View Details</a>
            </div>

            <!-- Product 3 -->
            <div class="product-card">
                <img src="images/headphones.jpeg" alt="Headphones">
                <h3>Sample Product 3</h3>
                <p class="price">₹2799</p>
                <a href="ProductController?action=view&id=3" class="btn">View Details</a>
            </div>
        </div>

        <!-- View All Products -->
        <div class="view-all">
            <a href="products.jsp" class="btn">View All Products</a>
        </div>
    </div>

</body>
</html>
