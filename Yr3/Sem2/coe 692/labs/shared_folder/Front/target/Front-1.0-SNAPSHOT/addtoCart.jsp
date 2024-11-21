<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add to Cart | SINI'S Convenience</title>
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
            min-height: calc(100vh - 100px);
        }

        .add-to-cart {
            background-color: #ffffff;
            color: #000000;
            padding: 20px;
            text-align: left;
            font-size: 18px;
            margin-top: 20px;
            width: 100%;
            border-radius: 5px;
            display: flex;
            flex-direction: column;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .buttons {
            margin-top: 20px;
            margin-bottom: 20px;
            display: flex;
            justify-content: flex-end;
        }

        .buttons button {
            margin-right: 10px;
        }

        .return-button {
            margin-top: 20px;
            text-align: left;
            font-size: 18px;
            margin-left: 20px;
        }

        .return-button a {
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            background-color: #70cfe3;
        }

        .footer {
            background-color: #ffd5c8;
            color: #fff;
            padding: 10px;
            text-align: center;
            margin-top: 20px;
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

    <!-- Return Button -->
    <div class="return-button">
        <a href="/FrontEnd?pageName=Search">Return</a>
    </div>

    <!-- Center Container -->
    <div class="center-container">
        <div class="add-to-cart">
            <h2>Add to Cart</h2>
            <p>Add an item to a user's cart by inputting the Product ID, user's username, and quantity of product specified.</p>
            <form action="FrontEnd" method="post" value="cart"> 
                <div class="form-group">
                    <label for="productID">Product ID:</label>
                    <input type="text" class="form-control" id="productID" name="productID" required>
                </div>
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" class="form-control" id="quantity" name="quantity" required>
                </div>
            </form>
            <div class="buttons">
                <button type="button" class="btn btn-primary">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
            &copy; Sarah & Nini. All rights reserved.
    </footer>

    <!-- Include Bootstrap JS (or your preferred JS framework) -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>