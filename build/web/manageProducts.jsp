<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Products - E-Commerce Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; padding: 0;
            background: #f4f6f8;
        }
        .header {
            background: #dc3545;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .nav {
            background: #c82333;
            padding: 10px;
            text-align: center;
        }
        .nav a {
            color: white;
            text-decoration: none;
            margin: 0 12px;
            font-size: 14px;
        }
        .nav a:hover { text-decoration: underline; }

        .container {
            max-width: 900px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            font-size: 14px;
            text-align: left;
        }
        th {
            background: #f8f9fa;
            font-weight: 600;
        }
        tr:nth-child(even) { background: #fdfdfd; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Manage Products</h1>
    </div>
    <div class="nav">
        <a href="admin.jsp">Back to Dashboard</a>
        <a href="AdminController?action=logout">Logout</a>
    </div>

    <div class="container">
        <h2>Product List</h2>
        <%
            HttpSession session = request.getSession();
            String adminUser = (String) session.getAttribute("adminUser");
            if (adminUser == null) {
                response.sendRedirect("admin.jsp");
            } else {
                Connection conn = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;
                try {
                    conn = DBConnection.getConnection();
                    String sql = "SELECT id, name, price, description, stock, image FROM products";
                    stmt = conn.prepareStatement(sql);
                    rs = stmt.executeQuery();
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price (₹)</th>
                    <th>Description</th>
                    <th>Stock</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("name") %></td>
                    <td>₹<%= rs.getDouble("price") %></td>
                    <td><%= rs.getString("description") %></td>
                    <td><%= rs.getInt("stock") %></td>
                    <td><%= rs.getString("image") %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <%
                } catch (Exception e) {
                    out.println("<p style='color:red;'>Error: "+ e.getMessage() +"</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    DBConnection.closeConnection(conn);
                }
            }
        %>
    </div>
</body>
</html>
