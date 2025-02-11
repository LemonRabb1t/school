<%-- 
    Document   : user
    Created on : Feb 4, 2024, 3:23:14 p.m.
    Author     : sarahjawwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Helper.Product" %>
<%@ page import="Business.ProductTile" %>

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
            background-color: #ffd5c8;
            color: #ffffff;
            padding: 10px;
            text-align: center;
            font-size: 18px;
            display: flex; /* Set display to flex */
            justify-content: space-around; /* Distribute items evenly */
            align-items: center; /* Center items vertically */
        }

        nav a {
            color: grey; 
            text-decoration: none; 
            margin-right: 2px; 
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
        
    /* View Cart button */
    .view-cart-button {
        padding: 10px 16px;
        border-radius: 5px;
        border: 1px solid #007bff;
        background-color: #007bff;
        color: #fff;
        text-decoration: none;
        transition: background-color 0.3s ease;
    }

    .view-cart-button:hover {
        background-color: #0056b3;
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
    
    /* Search bar */
    .search-container {
        margin-bottom: 20px;
        position: relative; /* Change position to relative */
        display: inline-block; /* Display as inline-block */
        align-items: center; /* Center items vertically */

        
    }

    .search-container form {
        display: flex;
        align-items: center;
    }

    .search-container input[type="text"] {
        padding: 10px;
        margin-right: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 200px; /* Set the width of the input field */
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
    <a href="groceries.jsp">|| Groceries ||</a>
    <a href="personal_care.jsp">Personal Care ||</a>
    <a href="pharmacy.jsp">Pharmacy ||</a>
    <a href="home.jsp">Home ||</a>
    
    <!-- View Cart Button -->
    <form action="ViewCart.jsp">
        <button type="submit" class="btn btn-info">View Cart</button>
    </form>
    
    <div class="search-container">
        <form action="Search_Product" method="GET">
            <input type="text" name="word" placeholder="Product Name">
            <button type="submit" class="btn btn-info">Search</button>
        </form>
    </div>
</nav>



<!-- Main Content Section -->
<section>
    <div class="center-container">
    <h1>Featured Products</h1>

    <!-- Iterate over the list of products from the database -->
<%
    // Retrieve products using the displayProducts method from the ProductTile class
    ArrayList<Product> products = ProductTile.readAllProducts();
    for(Product product : products) {
%>
    <div class="product-tile">
        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>" class="product-image">
        <div class="product-title"><%= product.getName() %></div>
        <div class="product-price">Price: $<%= product.getPrice() %></div>
        <button class="btn btn-secondary">Add to Cart</button>
    </div>
<% } %>

    
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
