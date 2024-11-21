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
    <title>Featured Item Page| SINIS Convenience</title>
    <!-- Include Bootstrap CSS (or your preferred CSS framework) -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Custom Styles */
        body {
            font-family: 'caveat', sans-serif;
            background-color: #daf9ff; /* Background */
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #70cfe3; /* Header */
            color: #e8e8ec;
            padding: 10px;
            text-align: center;
        }

        nav {
            background-color: #ffd5c8; /* Navigation Bar */
            color: #ffffff;
            padding: 10px;
            text-align: center;
            font-size: 18px; /* Adjust font size as needed */
        }

        nav a {
            color: grey; 
            text-decoration: none; 
            margin-right: 50px; /* Add space between links */
        }
        
        section {
            padding: 20px;
        }

        footer {
            background-color: #ffd5c8; /* Footer */
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        
         p {
            color: grey; /* Set text color to grey */
        }
        
        h1 {
         font-family: 'Noteworthy', sans-serif;
        }
        
         /* CSS for View Cart box */
    .view-cart-box {
            justify-content: center; /* Center horizontally */
            text-align: center;
            display: inline-block;
            padding: 10px 20px; /* Adjust padding as needed */
            border: 1px solid #ccc; /* Add border */
            border-radius: 5px; /* Add border radius */
            background-color: #f2f2f2; /* Light grey background */

        }

    .view-cart-link {
            font-weight: bold; /* Bold font */
        }
        
     /* CSS for Product Tiles */
    .product-tile {
        display: inline-block;
        width: 200px; /* Set the width of each tile */
        padding: 10px;
        margin: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #ffd5c8;
        text-align: center;
    }

    .product-image {
        width: 150px; /* Set the width of the product image */
        height: 150px; /* Set the height of the product image */
        margin-bottom: 10px;
    }

    .product-title {
        font-weight: bold;
        margin-bottom: 5px;
    }

    .product-price {
        color: #514f4f; /* Set the color of the price */
        font-size: 14px;
    }
    
    .center-container {
        text-align: center;
    }
        
    </style>
</head>
<body>

<!-- Header -->
<header>
    <img src="resources/header.png" alt="SINIS Convenience Logo" style="width: 100%;">
</header>

<!-- Navigation Bar -->
<nav>
    || <a href="groceries.jsp">Groceries</a>||
    <a href="personal_care.jsp">Personal Care</a>||
    <a href="pharmacy.jsp">Pharmacy</a>||
    <a href="home.jsp">Home</a>
    
    <!-- View Cart Box -->
    <div class="view-cart-box">
        <a href="view_cart.jsp" class="view-cart-link">View Cart</a> <!-- Added View Cart link -->
    </div>

</nav>


<!-- Main Content Section -->
<section>
    <div class="center-container">
    <h1>Featured Products</h1>

    <!-- Sample Product Cards (Add more as needed) -->
        <div class="product-tile">
           <img src="resources/donut.png" alt="Donut" class="product-image">
           <div class="product-title">Bakery Donuts</div>
           <div class="product-price">Price: $4.99</div>
           <a href="view_cart.jsp" class="btn btn-secondary">Add to Cart</a>
       </div>

       <div class="product-tile">
           <img src="resources/pasta.png" alt="Pasta" class="product-image">
           <div class="product-title">Pasta</div>
           <div class="product-price">Price: $0.99</div>
           <a href="#" class="btn btn-secondary">Add to Cart</a>
       </div>

       <div class="product-tile">
           <img src="resources/wash.jpeg" alt="Face Wash" class="product-image">
           <div class="product-title">Face Wash</div>
           <div class="product-price">Price: $14.99</div>
           <a href="#" class="btn btn-secondary">Add to Cart</a>
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
