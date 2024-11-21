<%-- 
    Document   : user
    Created on : Feb 4, 2024, 3:23:14 p.m.
    Author     : sarahjawwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SINIS Convenience</title>
    <!-- Include Bootstrap CSS (or your preferred CSS framework) -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom Styles */
        body {
            font-family: 'caveat', sans-serif;
            background-color: #dddedf; /* Background */
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #0f2448; /* Header */
            color: #e8e8ec;
            padding: 10px;
            text-align: center;
        }

        nav {
            background-color: #201e1e; /* Navigation Bar */
            color: #ffffff;
            padding: 10px;
            text-align: center;
        }

        section {
            padding: 20px;
        }

        footer {
            background-color: #1f2021; /* Footer */
            color: #fff;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Header -->
<header>
    <h1>Welcome to SINIS Convenience</h1>
</header>

<!-- Navigation Bar -->
<nav>
    <a href="#">Groceries</a> |
    <a href="#">Personal Care</a> |
    <a href="#">Pharmacy</a> |
    <a href="#">Home</a>
</nav>

<!-- Main Content Section -->
<section>
    <h2>*Sales of the week*</h2>

    <!-- Sample Product Cards (Add more as needed) -->
    <div class="card-deck">
        <div class="card">
            <img src="resources/donut.png" width="200" height="200" style="padding:10px" alt="donut">            <div class="card-body">
                <h5 class="card-title">Bakery Donuts</h5>
                <p class="card-text">Price: $4.99</p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>

        <div class="card">
            <img src="resources/pasta.png" width="200" height="200" style="padding: 10px;" alt="pasta">
                <div class="card-body">
                <h5 class="card-title">Pasta</h5>
                <p class="card-text">Price: $0.99</p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>

        <div class="card">
            <img src="resources/wash.jpeg" width="200" height="300" style="padding:10px" alt="wash">            <div class="card-body">
                <div class="card-body">
                <h5 class="card-title">Face Wash</h5>
                <p class="card-text">Price: $14.99</p>
                <a href="#" class="btn btn-primary">Add to Cart</a>
            </div>
        </div>

    </div>
</section>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Sarah&Nini. All rights reserved.</p>
</footer>

<!-- Include JavaScript Libraries -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
