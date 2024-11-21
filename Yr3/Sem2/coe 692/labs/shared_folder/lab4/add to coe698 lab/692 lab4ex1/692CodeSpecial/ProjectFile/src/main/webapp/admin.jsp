<%-- 
    Document   : admin
    Created on : Feb 4, 2024, 3:23:48 p.m.
    Author     : sarahjawwad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin page| SINIS Convenience</title>
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

        
        section {
            padding: 20px;
        }

        footer {
            background-color: #ffd5c8; /* Footer */
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        
        h1 {
         font-family: 'Noteworthy', sans-serif;
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
    <img src="resources/admin.png" alt="SINIS Convenience Logo" style="width: 100%;">
</header>

<!-- Main Content Section -->
<section>
    <div class="center-container">
    <h1>Customer and Product Information</h1>
    
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

