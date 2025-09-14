<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="com.ecommerce.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - E-Commerce Store</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background: #f4f6f9;
            color: #333;
        }
        .container {
            max-width: 850px;
            margin: 40px auto;
            background: #fff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            margin-bottom: 25px;
            font-size: 24px;
            color: #1f2937;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 25px;
        }
        table, th, td {
            border: 1px solid #e5e7eb;
        }
        th {
            background: #2563eb;
            color: white;
            padding: 12px;
            text-align: center;
        }
        td {
            padding: 12px;
            text-align: center;
        }
        .total td {
            font-weight: bold;
            background: #f9fafb;
        }
        .form-box {
            background: #f9fafb;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 18px;
        }
        .form-box h3 {
            margin-top: 0;
            margin-bottom: 12px;
            font-size: 18px;
            color: #111827;
        }
        .form-row {
            margin-bottom: 12px;
        }
        .form-row label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            font-size: 14px;
            color: #374151;
        }
        .form-row input,
        .form-row select,
        .form-row textarea {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            box-sizing: border-box;
        }
        .form-row textarea {
            resize: vertical;
        }
        .form-row-flex {
            display: flex;
            gap: 12px;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .btn:hover {
            background: #1d4ed8;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
        .empty-cart {
            text-align: center;
            padding: 20px;
            color: #6b7280;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Checkout Summary</h1>

        <%
            HttpSession session1 = request.getSession(false);
            Integer userId = (session1 != null) ? (Integer) session1.getAttribute("userId") : null;
            if (userId == null) {
        %>
            <p class="error">⚠️ You must be logged in to checkout.</p>
            <div style="text-align:center;">
                <a href="login.jsp" class="btn" style="width:auto;padding:8px 16px;">Go to Login</a>
            </div>
        <%
            } else {
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                double subtotal = 0.0;
                try {
                    conn = DBConnection.getConnection();
                    String sql = "SELECT p.id, p.name, p.price, c.quantity FROM cart c JOIN products p ON c.product_id = p.id WHERE c.user_id=?";
                    ps = conn.prepareStatement(sql);
                    ps.setInt(1, userId);
                    rs = ps.executeQuery();
        %>
                    <table>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Subtotal</th>
                        </tr>
                        <%
                            boolean hasItems = false;
                            while (rs.next()) {
                                hasItems = true;
                                String pname = rs.getString("name");
                                double price = rs.getDouble("price");
                                int qty = rs.getInt("quantity");
                                double itemTotal = price * qty;
                                subtotal += itemTotal;
                        %>
                            <tr>
                                <td><%= pname %></td>
                                <td>₹<%= String.format("%.2f", price) %></td>
                                <td><%= qty %></td>
                                <td>₹<%= String.format("%.2f", itemTotal) %></td>
                            </tr>
                        <%
                            }

                            if (!hasItems) {
                        %>
                            <tr>
                                <td colspan="4" class="empty-cart">Your cart is empty.</td>
                            </tr>
                        <%
                            }

                            double shipping = (subtotal > 0) ? 50.0 : 0.0;
                            double tax = subtotal * 0.18;
                            double total = subtotal + shipping + tax;
                        %>
                        <tr class="total"><td colspan="3">Subtotal</td><td>₹<%= String.format("%.2f", subtotal) %></td></tr>
                        <tr class="total"><td colspan="3">Shipping</td><td>₹<%= String.format("%.2f", shipping) %></td></tr>
                        <tr class="total"><td colspan="3">Tax (18%)</td><td>₹<%= String.format("%.2f", tax) %></td></tr>
                        <tr class="total"><td colspan="3">Grand Total</td><td>₹<%= String.format("%.2f", total) %></td></tr>
                    </table>

                    <!-- Checkout form -->
                    <form action="CheckoutController" method="post">
                        <input type="hidden" name="action" value="placeOrder">

                        <div class="form-box">
                            <h3>Billing & Shipping</h3>

                            <div class="form-row">
                                <label for="fullName">Full name</label>
                                <input type="text" id="fullName" name="fullName" required>
                            </div>

                            <div class="form-row">
                                <label for="address">Address</label>
                                <textarea id="address" name="address" rows="2" required></textarea>
                            </div>

                            <div class="form-row-flex">
                                <div class="form-row" style="flex:2;">
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" required>
                                </div>
                                <div class="form-row" style="flex:1;">
                                    <label for="pincode">Pincode</label>
                                    <input type="text" id="pincode" name="pincode" required>
                                </div>
                            </div>

                            <div class="form-row">
                                <label for="phone">Phone</label>
                                <input type="text" id="phone" name="phone" required>
                            </div>

                            <div class="form-row">
                                <label for="paymentMethod">Payment method</label>
                                <select id="paymentMethod" name="paymentMethod" required>
                                    <option value="COD">Cash on Delivery</option>
                                    <option value="UPI">UPI</option>
                                    <option value="CARD">Credit/Debit Card</option>
                                </select>
                            </div>
                        </div>

                        <button type="submit" class="btn">Place Order</button>
                    </form>

        <%
                } catch(Exception e) {
                    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch(Exception ignored) {}
                    if (ps != null) try { ps.close(); } catch(Exception ignored) {}
                    if (conn != null) DBConnection.closeConnection(conn);
                }
            }
        %>
    </div>
</body>
</html>
