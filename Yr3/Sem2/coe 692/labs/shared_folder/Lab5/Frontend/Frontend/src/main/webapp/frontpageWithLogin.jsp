<%-- 
    Document   : frontpageWithLogin
    Created on : Mar 15, 2021, 2:00:13 AM
    Author     : student
--%>

<%@page import="Helper.Product"%>
<%@page import="Helper.SearchXML"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Page once loged in and searching w view profile</title>
        <!-- Include Bootstrap CSS (or your preferred CSS framework) -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Custom Styles */

            body {
                margin: 0;
                font-family: 'caveat', sans-serif;
                background-color: #daf9ff;
                color: #333;
            }

            header {
                background-color: #70cfe3;
                color: #e8e8ec;
                padding: 10px;
                text-align: center;
            }

            footer {
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


            h4 {
                padding: 10px;
            }

            .topnav {
                overflow: hidden;
                background-color: #70cfe3;
                color: #e8e8ec;
                padding: 10px;
                text-align: center;
                font-size: 18px;
                display: flex;
                justify-content: space-around;
                align-items: center;
            }

            .topnav a {
                color: grey;
                text-decoration: none;
                margin-right: 2px;
            }

            .topnav a:hover {
                color: #333;
            }

            .topnav a.active {
                background-color: #2196F3;
                color: white;
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
                padding: 5px;
                border-radius: 5px;
                border: 1px solid #70cfe3;
            }

            .banner button[type="submit"] {
                background-color: #70cfe3;
                color: #ffffff;
                border: none;
                padding: 5px 10px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
            }

            .content-section {
                margin: 20px;
                padding: 0;
                width: 90%;
                height: 100vh;
            }

            .content-section input[type="submit"] {
                background-color: #70cfe3;
                color: #ffffff;
                border: none;
                padding: 8px;
                font-size: 16px;
                border-radius: 5px;

            }

            .inner-content {
                padding: 16px;
            }

            .login-banner {
                font-size: 16px;
                color: grey;
                padding: 10px;
                text-align: center;
            }

            /* Profile Button */

            .profile-button {
                background-color: #70cfe3;
                color: #ffffff;
                border: none;
                padding: 5px 10px;
                font-size: 16px;
                border-radius: 5px;
                float: right;
                /* Align to the right */
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
            <a href="">|| Home||</a>
            <a href="">|| Pharmacy  ||</a>
            <a href="">|| Groceries ||</a>
            <form action="FrontEnd" method="post">
                <input type="hidden" name="pageName" value="logout" />
                <button class="logout-button" type="submit">|| Log Out ||</button>
            </form>
        </nav>

                <!-- Login Banner -->
        <div class="login-banner">
            Hello <%=request.getAttribute("username")%>
     
            <!-- Profile Button -->
            <form action="FrontEnd" method="post">
                <input type="hidden" name="query" value="<%=request.getAttribute("username")%>">
                <button type="submit" name="pageName" value="profile"> View Profile</button> 
            </form>
        </div>
        

    <!-- content Section -->
    <section class="content-section">
        <div style="padding-left:16px">
            <h2>Search Products</h2>
            <form action="FrontEnd" method="post">
                <input type="hidden" name="pageName" value="search" /> Please type in the product you would like to find:
                <input type="text" name="query">
                <input type="submit">
            </form>
        </div>

        <div style="padding-left:16px">
            <form action="FrontEnd" method="post">
 <input type="hidden" name="pageName" value="hold" />
            <div class="product-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Barcode</th>
                            <th>Product</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  try {
                                SearchXML products = (SearchXML) request.getAttribute("productResults");
                                if (products != null && products.getProducts() != null) {
                                    int i = 0;
                                    for (Product product : products.getProducts()) {
                                        i++;%>
                        <tr>
                            <td><%= product.getBarcode() %></td>
                            <td><%= product.getName() %></td>
                            <td><%= product.getPrice() %></td>
                    <form action ="Frontend" method="post">
                            <input type ="hidden" name="barcode" value="<%= product.getBarcode() %>"/>
                            <input type ="hidden" name="name" value="<%= product.getName() %>"/>
                            <input type ="hidden" name="price" value="<%= product.getPrice() %>"/>
                            <td><button type="submit" class="btn-success" value = "addtocart">Add To cart</button></td>
                    </form>
                    </tr>
                        <%      }
                                }
                            } catch (Exception e) {
                                System.out.println("Error caught: " + e.getMessage());
                            }
                        %>
                    </tbody>
                </table>
            </div>
            </div>

    </section>

    <!-- Footer -->
    <footer>
        &copy; Sarah & Nini. All rights reserved.
    </footer>
</body>

</html>