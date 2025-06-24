<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f6d365, #fda085); /* peach to coral */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #2d3436;
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #2d3436;
        }

        input[type="email"],
        input[type="password"],
        input[type="text"].show-password {
            width: 100%;
            padding: 10px 12px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: #fff;
            font-size: 16px;
            font-family: inherit;
            box-sizing: border-box;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #00a8ff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #74b9ff;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .checkbox-container input[type="checkbox"] {
            margin-right: 8px;
            cursor: pointer;
        }

        .checkbox-container label {
            font-weight: normal;
            color: #636e72;
        }

        .message {
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .success {
            color: #00b894;
        }

        .error {
            color: #d63031;
        }

        @media (max-width: 480px) {
            .form-container {
                margin: 20px;
                padding: 30px 20px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Login</h2>

        <%-- Session messages --%>
        <%
            String successMsg = (String) session.getAttribute("registerSuccess");
            if (successMsg != null) {
        %>
            <p class="message success"><%= successMsg %></p>
        <%
                session.removeAttribute("registerSuccess");
            }

            String errorMsg = (String) session.getAttribute("loginError");
            if (errorMsg != null) {
        %>
            <p class="message error"><%= errorMsg %></p>
        <%
                session.removeAttribute("loginError");
            }
        %>

        <form action="<%= request.getContextPath() %>/login" method="post" autocomplete="off">
            <label for="email">Email:</label>
            <input type="email" name="email" id="email" required autocomplete="off" />

            <label for="password">Password:</label>
            <input type="password" name="password" id="password" required autocomplete="new-password" />

            <div class="checkbox-container">
                <input type="checkbox" id="showPass" onclick="togglePassword()" />
                <label for="showPass">Show Password</label>
            </div>

            <input type="submit" value="Login" />
        </form>
    </div>

    <script>
        function togglePassword() {
            const passField = document.getElementById("password");
            if (passField.type === "password") {
                passField.type = "text";
                passField.classList.add("show-password");
            } else {
                passField.type = "password";
                passField.classList.remove("show-password");
            }
        }
    </script>
</body>
</html>
