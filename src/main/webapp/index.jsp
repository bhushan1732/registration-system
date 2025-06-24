<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Farmer Expense Manager</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #d4fc79, #ffb199);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: #2c3e50;
        }

        /* Navbar */
        header {
            background-color: #1e272e;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            flex-wrap: wrap;
        }

        header h1 {
            font-size: 20px;
            color: white;
        }

        nav {
            display: flex;
            flex-wrap: wrap;
            margin-top: 10px;
        }

        nav a {
            margin: 6px 10px;
            text-decoration: none;
            color: white;
            font-weight: 500;
            padding: 8px 14px;
            border-radius: 6px;
            transition: background-color 0.3s;
        }

        nav a:hover {
            background-color: #485460;
        }

        .btn-login {
            background-color: #dcdde1;
            color: #1e272e;
        }

        .btn-signup {
            background-color: #0652DD;
            color: #1e272e;
        }

        /* Hero Section */
        .hero {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 60px 40px;
            flex-wrap: wrap;
            flex: 1;
        }

        .hero-text {
            flex: 1;
            min-width: 300px;
            margin-bottom: 30px;
        }

        .hero-text h2 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #006266;
        }

        .hero-text p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .hero-buttons a {
            display: inline-block;
            padding: 12px 24px;
            margin: 10px 10px 0 0;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            font-size: 16px;
            border: 2px solid #0652DD;
            transition: 0.3s;
        }

        .btn-primary {
            background-color: #0652DD;
            color: white;
        }

        .btn-primary:hover {
            background-color: #1e90ff;
        }

        .btn-outline {
            background-color: transparent;
            color: #0652DD;
        }

        .btn-outline:hover {
            background-color: #c8d6e5;
        }

        .hero-image {
            flex: 1;
            min-width: 250px;
            text-align: center;
        }

        .hero-image img {
            max-width: 90%;
            height: auto;
            animation: float 6s ease-in-out infinite;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        /* Footer */
        footer {
            background-color: #1e272e;
            color: white;
            padding: 15px 20px;
            text-align: center;
            font-size: 14px;
            border-top: 2px solid #34495e;
        }

        footer a {
            color: #74b9ff;
            text-decoration: none;
            font-weight: bold;
        }

        footer a:hover {
            text-decoration: underline;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .hero {
                flex-direction: column;
                padding: 30px 20px;
                text-align: center;
            }

            .hero-text h2 {
                font-size: 28px;
            }

            .hero-text p {
                font-size: 15px;
            }

            nav {
                justify-content: center;
                width: 100%;
            }

            header {
                flex-direction: column;
                align-items: flex-start;
            }

            header h1 {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<%
    String path = request.getContextPath();
%>

<header>
    <h1>Farmer Expense Management System</h1>
    <nav>
        <a href="<%= path %>/index.jsp">Home</a>
        <a href="<%= path %>/registration/Login.jsp" class="btn-login">Login</a>
        <a href="<%= path %>/registration/register.jsp" class="btn-signup">Sign Up</a>
    </nav>
</header>

<section class="hero">
    <div class="hero-text">
        <h2>Welcome to Farmer Expense Management System</h2>
        <p>
            This application is designed to help farmers efficiently track and manage their farming expenses.
            You can easily record daily spending on seeds, fertilizers, labor, equipment, and other agricultural activities. The system allows you to update, delete, and analyze your expenses through categorized reports and summaries.
            With this tool, farmers can make informed financial decisions and plan their budgets more effectively.
        </p>

        <div class="hero-buttons">
            <a href="<%= path %>/registration/register.jsp" class="btn-primary">Join Now</a>
            <a href="<%= path %>/registration/Login.jsp" class="btn-outline">Learn More</a>
        </div>
    </div>
    <div class="hero-image">
        <img src="<%= path %>/assets/images/8400.jpg" alt="Farm Illustration">
    </div>
</section>

<footer>
    &copy; 2025 Farmer Expense Manager | Built by Bhushan Shewale | 
    <a href="mailto:support@example.com">Contact Support</a>
</footer>

</body>
</html>
