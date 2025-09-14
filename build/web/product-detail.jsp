<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Detail - E-Commerce Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; padding: 0;
            background: #f4f6f9;
        }
        .header {
            background: #333;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .nav {
            background: #555;
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
            padding: 25px;
            border-radius: 6px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        .product-detail {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }
        .product-detail img {
            width: 320px;
            height: 320px;
            object-fit: contain;
            border: 1px solid #ddd;
            border-radius: 6px;
            padding: 10px;
            background: #fafafa;
        }
        .info {
            flex: 1;
        }
        .info h2 {
            margin: 0 0 10px;
            color: #222;
        }
        .info p {
            line-height: 1.5;
            color: #555;
        }
        .price {
            font-size: 22px;
            font-weight: bold;
            color: #e74c3c;
            margin: 15px 0;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            color: white;
            margin-right: 10px;
            font-size: 14px;
        }
        .btn-cart {
            background: #28a745;
        }
        .btn-cart:hover {
            background: #218838;
        }
        .btn-back {
            background: #007bff;
        }
        .btn-back:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header"><h1>Product Detail</h1></div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>

    <div class="container">
        <%
            ResultSet product = (ResultSet) request.getAttribute("product");
            if(product != null) {
        %>
            <div class="product-detail">
                <div>
                    <img src="images/<%=product.getString("image")%>" alt="<%=product.getString("name")%>">
                </div>
                <div class="info">
                    <h2><%=product.getString("name")%></h2>
                    <p><%=product.getString("description")%></p>
                    <p class="price">₹<%=product.getDouble("price")%></p>
                    
                    <a href="CartController?action=add&productId=<%=product.getInt("id")%>" class="btn btn-cart">Add to Cart</a>
                    <a href="products.jsp" class="btn btn-back">Back to Products</a>
                </div>
            </div>
        <%
            } else {
        %>
            <p>⚠️ Product not found.</p>
        <%
            }
        %>
    </div>
</body>
</html>
