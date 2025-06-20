<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f1f2f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            width: 350px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #0984e3;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #74b9ff;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Login</h2>
        <form action="login" method="post">
            <label>Email:</label>
            <input type="email" name="email" required autocomplete="off" />
            <label>Password:</label>
            <input type="password" name="password" required autocomplete="off" />
            <input type="submit" value="Login" />
        </form>
    </div>
</body>
</html>
