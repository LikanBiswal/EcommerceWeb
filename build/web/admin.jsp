<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - E-Commerce</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6f9;
            color: #333;
        }
        .layout {
            display: flex;
            min-height: 100vh;
        }
        .sidebar {
            width: 240px;
            background: #1f2937;
            color: white;
            padding: 20px;
        }
        .sidebar h2 {
            margin-top: 0;
            margin-bottom: 30px;
            font-size: 22px;
            text-align: center;
        }
        .sidebar a {
            display: block;
            padding: 12px 15px;
            color: #cbd5e1;
            text-decoration: none;
            border-radius: 6px;
            margin-bottom: 8px;
            transition: background 0.3s;
        }
        .sidebar a:hover {
            background: #374151;
            color: white;
        }
        .main {
            flex: 1;
            padding: 30px;
        }
        .header {
            background: white;
            padding: 15px 25px;
            border-radius: 10px;
            margin-bottom: 30px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .header h1 {
            margin: 0;
            font-size: 26px;
        }
        .card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 25px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .card h3 {
            margin-top: 0;
            margin-bottom: 20px;
            font-size: 20px;
            color: #111827;
        }
        .form-group {
            margin-bottom: 18px;
        }
        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #374151;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 15px;
            box-sizing: border-box;
        }
        .form-group input:focus {
            border-color: #2563eb;
            outline: none;
            box-shadow: 0 0 4px rgba(37,99,235,0.4);
        }
        .btn {
            background: #2563eb;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 15px;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #1d4ed8;
        }
        .error {
            background: #fee2e2;
            border: 1px solid #ef4444;
            color: #b91c1c;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 6px;
            font-weight: 500;
        }
    </style>
</head>
<body>
<div class="layout">
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="index.jsp">🏬 Back to Store</a>
        <a href="AdminController?action=logout">🚪 Logout</a>
    </div>

    <!-- Main Content -->
    <div class="main">
        <div class="header">
            <h1>E-Commerce Admin Dashboard</h1>
        </div>

        <div class="card">
            <%
                String adminUser = (String) session.getAttribute("adminUser");
                if (adminUser == null) {
            %>
            <h3>Admin Login</h3>
            <% if (request.getParameter("error") != null) { %>
                <div class="error">❌ Invalid username or password!</div>
            <% } %>
            <form action="AdminController" method="post">
                <input type="hidden" name="action" value="login">
                <div class="form-group">
                    <label>Username:</label>
                    <input type="text" name="username" required>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <input type="password" name="password" required>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
            <% } else { %>
            <h3>👋 Welcome, <%= adminUser %></h3>
        </div>

        <div class="card">
            <h3>Add Product</h3>
            <form action="AdminController" method="post">
                <input type="hidden" name="action" value="addProduct">
                <div class="form-group">
                    <label>Product Name:</label>
                    <input type="text" name="name" required>
                </div>
                <div class="form-group">
                    <label>Price:</label>
                    <input type="text" name="price" required>
                </div>
                <div class="form-group">
                    <label>Description:</label>
                    <input type="text" name="description" required>
                </div>
                <div class="form-group">
                    <label>Stock:</label>
                    <input type="text" name="stock" required>
                </div>
                <button type="submit" class="btn">Add Product</button>
            </form>
        </div>

        <div class="card">
            <h3>Edit Product</h3>
            <form action="AdminController" method="post">
                <input type="hidden" name="action" value="updateProduct">
                <div class="form-group">
                    <label>Product ID:</label>
                    <input type="text" name="productId" required>
                </div>
                <div class="form-group">
                    <label>New Name:</label>
                    <input type="text" name="name" required>
                </div>
                <div class="form-group">
                    <label>New Price:</label>
                    <input type="text" name="price" required>
                </div>
                <div class="form-group">
                    <label>New Description:</label>
                    <input type="text" name="description" required>
                </div>
                <div class="form-group">
                    <label>New Stock:</label>
                    <input type="text" name="stock" required>
                </div>
                <button type="submit" class="btn">Update Product</button>
            </form>
        </div>

        <div class="card">
            <h3>Delete Product</h3>
            <form action="AdminController" method="post">
                <input type="hidden" name="action" value="deleteProduct">
                <div class="form-group">
                    <label>Product ID:</label>
                    <input type="text" name="productId" required>
                </div>
                <button type="submit" class="btn">Delete Product</button>
            </form>
        </div>

        <% } %>
    </div>
</div>
</body>
</html>
