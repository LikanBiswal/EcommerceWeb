<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Products - E-Commerce Store</title>
    <style>
        /* Reset & Body */
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f1f2f6; color: #333; }

        /* Header */
        .header {
            background: #1e272e;
            color: #fff;
            padding: 20px 0;
            text-align: center;
            font-size: 28px;
            letter-spacing: 1px;
        }

        /* Navigation */
        .nav {
            display: flex;
            justify-content: center;
            background: #485460;
            padding: 12px 0;
        }
        .nav a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            transition: 0.3s;
        }
        .nav a:hover {
            color: #ffda79;
        }

        /* Container */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 15px;
        }

        /* Section title */
        h2 {
            text-align: center;
            font-size: 26px;
            margin-bottom: 25px;
            color: #1e272e;
        }

        /* Product Grid */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }

        /* Product Card */
        .product-card {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: 0.3s;
            display: flex;
            flex-direction: column;
        }
        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        /* Product Image */
        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .product-card:hover img {
            transform: scale(1.05);
        }

        /* Product Info */
        .product-info {
            padding: 15px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .product-info h3 {
            font-size: 18px;
            margin-bottom: 8px;
            color: #1e272e;
        }
        .product-info p {
            font-size: 14px;
            color: #57606f;
            flex-grow: 1;
        }
        .price {
            font-size: 18px;
            font-weight: bold;
            color: #ff3f34;
            margin: 10px 0;
        }

        /* Buttons */
        .btn {
            display: inline-block;
            padding: 8px 14px;
            margin-top: 8px;
            border-radius: 5px;
            font-size: 14px;
            text-decoration: none;
            text-align: center;
            transition: 0.3s;
        }
        .btn-view {
            background: #0fbcf9;
            color: #fff;
        }
        .btn-view:hover { background: #0a84d0; }
        .btn-cart {
            background: #2ed573;
            color: #fff;
            margin-left: 5px;
        }
        .btn-cart:hover { background: #1eae60; }

        /* Responsive */
        @media(max-width:768px) {
            .nav { flex-wrap: wrap; }
            .nav a { margin: 8px; }
        }
    </style>
</head>
<body>
    <div class="header">Our Online Store</div>

    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>

    <div class="container">
        <h2>All Products</h2>
        <div class="product-grid">
            <%
                Connection conn = null;
                try {
                    conn = DBConnection.getConnection();
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM products");

                    while(rs.next()) {
            %>
            <div class="product-card">
                <img src="images/<%=rs.getString("image")%>" alt="<%=rs.getString("name")%>">
                <div class="product-info">
                    <h3><%=rs.getString("name")%></h3>
                    <p><%=rs.getString("description").length() > 80 ? rs.getString("description").substring(0, 77) + "..." : rs.getString("description") %></p>
                    <div class="price">₹<%=rs.getDouble("price")%></div>
                    <div>
                        <a href="ProductController?action=view&id=<%=rs.getInt("id")%>" class="btn btn-view">View Details</a>
                        <a href="CartController?action=add&productId=<%=rs.getInt("id")%>" class="btn btn-cart">Add to Cart</a>
                    </div>
                </div>
            </div>
            <%
                    }
                    rs.close();
                    stmt.close();
                } catch(Exception e) {
                    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    DBConnection.closeConnection(conn);
                }
            %>
        </div>
    </div>
</body>
</html>
