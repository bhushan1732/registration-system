<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f6fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
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
        .gender-group label {
            font-weight: normal;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #0984e3;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #74b9ff;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Register</h2>
    <form action="regForm" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name1" id="name" required />

        <label for="email">Email:</label>
        <input type="email" name="email1" id="email" autocomplete="off"  required />

        <label for="pass">Password:</label>
        <input type="password" name="pass1" id="pass" autocomplete="new-password" required />

        <label>Gender:</label>
        <div class="gender-group">
            <label><input type="radio" name="gender1" value="male" required /> Male</label>
            <label><input type="radio" name="gender1" value="female" /> Female</label>
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
        
        <p style="text-align:center; margin-top: 16px;">
           Already have an account?
        <a href="Login.jsp" style="color: #0984e3; text-decoration: none; font-weight: bold;">Login here</a>
</p>
    </form>
</div>

</body>
</html>
