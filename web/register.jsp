<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - E-Commerce Store</title>
    <style>
        /* Reset & Body */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f1f2f6; color: #333; }

        /* Header */
        .header {
            background: #1e272e;
            color: white;
            padding: 25px 0;
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
        .nav a:hover { color: #ffda79; }

        /* Container */
        .register-container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
            color: #1e272e;
        }

        /* Form */
        .form-group { margin-bottom: 18px; }
        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: 600;
            color: #2f3542;
        }
        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #d1d8e0;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }
        .form-group input:focus {
            border-color: #0fbcf9;
            outline: none;
            box-shadow: 0 0 6px rgba(15,188,249,0.3);
        }

        /* Button */
        .btn {
            width: 100%;
            padding: 14px;
            background: #0fbcf9;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn:hover { background: #0a84d0; }

        /* Error & Link */
        .error { color: #ff3f34; text-align: center; margin-bottom: 15px; font-weight: 600; }
        .link { text-align: center; margin-top: 20px; }
        .link a { color: #0fbcf9; text-decoration: none; transition: 0.3s; }
        .link a:hover { text-decoration: underline; }

        /* Responsive */
        @media(max-width: 600px) {
            .nav { flex-wrap: wrap; }
            .nav a { margin: 8px; }
        }
    </style>
</head>
<body>
    <div class="header">Create Your Account</div>

    <div class="nav">
        <a href="index.jsp">Home</a>
        <a href="products.jsp">Products</a>
        <a href="cart.jsp">Cart</a>
        <a href="login.jsp">Login</a>
        <a href="register.jsp">Register</a>
        <a href="admin.jsp">Admin</a>
    </div>

    <div class="register-container">
        <h2>Register</h2>

        <% if(request.getParameter("error") != null) { %>
            <div class="error">Registration failed! Email might already exist.</div>
        <% } %>

        <form action="UserController" method="post">
            <input type="hidden" name="action" value="register">

            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email"  required>
            </div>

            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" id="phone" name="phone"  required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter password" required>
            </div>

            <div class="form-group">
                <label for="confirmPassword">Confirm Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter password" required>
            </div>

            <button type="submit" class="btn">Register</button>
        </form>

        <div class="link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>

    <script>
        document.querySelector('form').addEventListener('submit', function(e) {
            var password = document.getElementById('password').value;
            var confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
            }
        });
    </script>
</body>
</html>
