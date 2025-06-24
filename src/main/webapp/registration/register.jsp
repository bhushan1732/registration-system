<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f6d365, #fda085); /* Match login background */
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .form-container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #2f3640;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #2d3436;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .gender-group {
            display: flex;
            gap: 10px;
            margin-bottom: 16px;
        }

        .gender-group input[type="radio"] {
            margin-right: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #00a8ff;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #74b9ff;
        }

        .login-link {
            text-align: center;
            margin-top: 16px;
        }

        .login-link a {
            color: #0984e3;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-bottom: 16px;
            font-weight: bold;
        }

        @media (max-width: 480px) {
            .form-container {
                margin: 20px;
                padding: 25px;
            }

            h2 {
                font-size: 22px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Register</h2>

    <%-- Optional: Display session message --%>
    <%
        String msg = (String) session.getAttribute("registerError");
        if (msg != null) {
    %>
        <div class="error-message"><%= msg %></div>
    <%
            session.removeAttribute("registerError");
        }
    %>

    <form action="<%= request.getContextPath() %>/regForm" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name1" id="name" required />

        <label for="email">Email:</label>
        <input type="email" name="email1" id="email" autocomplete="off" required />

        <label for="pass">Password:</label>
        <input type="password" name="pass1" id="pass" autocomplete="new-password" required />

        <label>Gender:</label>
        <div class="gender-group">
            <input type="radio" id="male" name="gender1" value="male" required />
            <label for="male">Male</label>

            <input type="radio" id="female" name="gender1" value="female" />
            <label for="female">Female</label>
        </div>

        <label for="city">City:</label>
        <select name="city1" id="city" required>
            <option value="" disabled selected>Select City</option>
            <option>Mumbai</option>
            <option>Pune</option>
            <option>Bangalore</option>
            <option>Hyderabad</option>
        </select>

        <input type="submit" value="Register" />

        <div class="login-link">
            Already have an account?
            <a href="<%= request.getContextPath() %>/registration/Login.jsp">Login here</a>
        </div>
    </form>
</div>

</body>
</html>
