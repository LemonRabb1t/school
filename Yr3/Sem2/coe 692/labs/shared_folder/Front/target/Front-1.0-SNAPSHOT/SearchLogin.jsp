<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Featured Item Page | SINI'S Convenience</title>
        <!-- Include Bootstrap CSS (or your preferred CSS framework) -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Custom Styles */

            body {
                font-family: 'caveat', sans-serif;
                background-color: #daf9ff;
                color: #333;
                margin: 0;
                padding: 0;
            }

            header {
                background-color: #70cfe3;
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
                display: flex;
                justify-content: space-around;
                align-items: center;
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
                background-color: #ffd5c8;
                color: #fff;
                padding: 10px;
                text-align: center;
            }

            p {
                color: grey;
            }

            h1 {
                font-family: 'Noteworthy', sans-serif;
            }

            .view-cart-button {
                padding: 10px 16px;
                border-radius: 5px;
                background-color: #daf9ff;
                color: #fff;
                text-decoration: none;
                transition: background-color 0.3s ease;
                align-items: right;
            }

            .center-container {
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                padding: 20px;
            }

            .search-container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 20px;
                margin-top: 20px;
            }

            .search-container form {
                display: flex;
                align-items: center;
            }

            .search-container input[type="text"] {
                width: 400px;
                margin-right: 10px;
                text-align: center;
                font-size: 20px;
                padding: 10px;
            }

            .search-container button[type="submit"] {
                background-color: #70cfe3;
                color: #ffffff;
                border: none;
                padding: 10px 20px;
                font-size: 20px;
            }

            .header-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 10px;
                margin-bottom: 20px;
            }

            .banner {
                background-color: #c7e7ff;
                color: #a6a6a6;
                padding: 10px;
                text-align: left;
                font-size: 18px;
                margin-top: 20px;
                width: 100%;
            }

            .banner input[type="text"],
            .banner input[type="password"] {
                margin-right: 10px;
            }

            .banner button[type="submit"] {
                background-color: #70cfe3;
                color: #ffffff;
                border: none;
                padding: 5px 10px;
            }
        </style>

    </head>

    <body>
        <!-- Header -->
        <header>
            SINI'S Convenience
        </header>
    <!-- Navigation Bar -->
    <nav>
        <a href="">|| Home ||</a>
        <a href="">|| Find an Item ||</a>
        <a href="">|| Add to Cart ||</a>
        <a href="">|| Profile ||</a>
    </nav>

        <!-- View profile Button -->
        <div style="text-align: right">
            <form action="FrontEnd" method="post">
                <input type="hidden" name="pageName" value="ViewProfile">
                <button type="submit" class="btn btn-info">View Profile</button>
            </form>
        </div>

        <!-- Center Container -->
        <div class="center-container">
            <div class="search-title">
                <h1>Search for a product here:</h1>
            </div>
            <div class="search-container">
                <form action="FrontEnd" method="post">
                    <input type="hidden" name="pageName" value="search">
                    
                    <input type="text" placeholder="Search by product name" name="query">
                    <button type="submit" class="btn btn-primary">Search</button>
                </form>
            </div>


        </div>

        <!-- Deals Banner -->
        <div class="banner">
            <h2>Check out our latest deals!</h2>
            <form action="Deals.jsp">
                <input type="text" placeholder="Enter your email" name="email">
                <button type="submit" class="btn btn-primary">Subscribe</button>
            </form>
        </div>

        <!-- Footer -->
        <footer>
            &copy; Sarah & Nini. All rights reserved.
        </footer>

        <!-- Include Bootstrap JS (or your preferred JS framework) -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>

</html>