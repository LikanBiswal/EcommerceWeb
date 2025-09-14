<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.ecommerce.util.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body { 
            font-family: 'Segoe UI', Arial, sans-serif; 
            margin: 0; 
            padding: 0; 
            background: #f4f6f9; 
        }
        .header { 
            background: #1f2937; 
            color: white; 
            padding: 20px; 
            text-align: center; 
            font-size: 24px;
        }
        .nav { 
            background: #374151; 
            padding: 12px; 
            text-align: center; 
        }
        .nav a { 
            color: #d1d5db; 
            margin: 0 15px; 
            text-decoration: none; 
            font-weight: 500;
        }
        .nav a:hover { color: white; }
        .container { 
            display: flex; 
            flex-wrap: wrap;
            max-width: 1200px; 
            margin: 30px auto; 
            gap: 30px;
        }
        .cart-items {
            flex: 2; 
            background: white; 
            border-radius: 10px; 
            padding: 20px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .cart-item { 
            display: grid; 
            grid-template-columns: 100px 1fr 120px 160px 120px; 
            align-items: center; 
            gap: 15px;
            padding: 15px; 
            border-bottom: 1px solid #eee;
        }
        .cart-item img { 
            width: 100px; height: 100px; 
            border-radius: 8px; 
            object-fit: cover; 
        }
        .cart-item h4 { margin: 0; font-size: 16px; }
        .price { font-weight: bold; color: #2563eb; }
        .quantity-controls { display: flex; align-items: center; gap: 10px; }
        .quantity-controls button { 
            background: #2563eb; 
            color: white; 
            border: none; 
            padding: 6px 12px; 
            cursor: pointer; 
            border-radius: 5px;
            font-size: 16px;
        }
        .quantity-controls button:hover { background: #1d4ed8; }
        .remove-btn { 
            background: #dc2626; 
            color: white; 
            border: none; 
            padding: 8px 14px; 
            cursor: pointer; 
            border-radius: 6px; 
            font-weight: 500;
        }
        .remove-btn:hover { background: #b91c1c; }
        .cart-summary {
            flex: 1;
            background: white; 
            border-radius: 10px; 
            padding: 20px; 
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            height: fit-content;
            position: sticky;
            top: 30px;
        }
        .cart-summary h3 { margin-top: 0; margin-bottom: 15px; font-size: 20px; }
        .total-price { font-size: 22px; font-weight: bold; color: #e11d48; margin-bottom: 20px; }
        .checkout-btn { 
            display: block; 
            text-align: center; 
            background: #16a34a; 
            color: white; 
            text-decoration: none; 
            padding: 12px; 
            border-radius: 6px; 
            font-weight: bold; 
            transition: background 0.3s;
        }
        .checkout-btn:hover { background: #15803d; }
        @media (max-width: 900px) {
            .container { flex-direction: column; }
            .cart-item { grid-template-columns: 80px 1fr; grid-template-rows: auto auto auto; }
        }
    </style>
</head>
<body>
    <div class="header">🛒 Shopping Cart</div>
    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
    </div>

    <div class="container">
        <!-- Cart Items -->
        <div class="cart-items">
            <%
                Connection conn = null;
                double subtotal = 0;
                try {
                    conn = DBConnection.getConnection();
                    String sql = "SELECT c.product_id, c.quantity, p.name, p.price, p.image " +
                                 "FROM cart c JOIN products p ON c.product_id = p.id";
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);

                    while(rs.next()) {
                        int pid = rs.getInt("product_id");
                        int qty = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        double total = qty * price;
                        subtotal += total;
            %>
                <div class="cart-item">
                    <img src="images/<%=rs.getString("image")%>" alt="">
                    <h4><%=rs.getString("name")%></h4>
                    <div class="price">₹<%=price%></div>
                    <div class="quantity-controls">
                        <form action="CartController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="updateQuantity">
                            <input type="hidden" name="productId" value="<%=pid%>">
                            <input type="hidden" name="change" value="-1">
                            <button type="submit">-</button>
                        </form>
                        <span><%=qty%></span>
                        <form action="CartController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="updateQuantity">
                            <input type="hidden" name="productId" value="<%=pid%>">
                            <input type="hidden" name="change" value="1">
                            <button type="submit">+</button>
                        </form>
                    </div>
                    <div class="price">₹<%=total%></div>
                    <form action="CartController" method="post">
                        <input type="hidden" name="action" value="remove">
                        <input type="hidden" name="productId" value="<%=pid%>">
                        <button type="submit" class="remove-btn">Remove</button>
                    </form>
                </div>
            <%
                    }
                    rs.close();
                    stmt.close();
                } catch(Exception e) {
                    e.printStackTrace();
                } finally {
                    DBConnection.closeConnection(conn);
                }
            %>
        </div>

        <!-- Cart Summary -->
        <div class="cart-summary">
            <h3>Cart Summary</h3>
            <p class="total-price">Total: ₹<%=subtotal%></p>
            <a href="checkout.jsp" class="checkout-btn">Proceed to Checkout</a>
        </div>
    </div>
</body>
</html>
