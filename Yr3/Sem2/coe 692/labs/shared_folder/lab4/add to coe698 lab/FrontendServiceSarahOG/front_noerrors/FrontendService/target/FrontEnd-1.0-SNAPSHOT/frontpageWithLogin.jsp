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
        <title>Search | SINI'S Convenience</title>
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
                width: 97%;
                height: 100vh;

            }

            .inner-content {
                padding: 16px;
            }

            .product-table {
                background-color: #fff;
                margin: 20px;
                padding: 0;
                width: 90%;
                height: 100vh;
            }

            .login-banner {
                font-size: 16px;
                color: grey;
                padding: 10px;
                text-align: center;
            }


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
            .logout-button{
                background-color: #ffd5c8;
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
            <form action="FrontEnd" method="post">
                <input type="hidden" name="pageName" value="logout" />
                <button class="logout-button" type="submit">|| Log Out ||</button>
            </form>
        </nav>

        <!-- Login Banner -->
        <div class="login-banner">
            <!-- Profile Button -->
            <form action="FrontEnd" method="post">
                <input type="hidden" name="pageName" value="profile" /> 
                <button class="profile-button">View Profile</button>
            </form>

        </div>
        <!-- content Section -->
        <section class="content-section">
        </div>

        <h4>Hello
            <%=request.getAttribute("username")%>!</h4>
        <p></p>
        <div style="padding-left:16px">
            <h2>Search Products</h2>
            <form action="FrontEnd" method="post">
                <input type="hidden" name="pageName" value="search" /> Please type in the product you would like to find:
                <input type="text" name="query">
                <input type="submit">
            </form>
        </div>

        <div style="padding-left:16px">
            <p></p>

            <form action="FrontEnd" method="post">
                <input type="hidden" name="pageName" value="hold" />
                <div style="product-table">
                    <table>
                        <tr>
                            <th></th>
                            <th>Barcode</th>
                            <th>Product</th>
                        </tr>
                        <%  try {
                                SearchXML products = (SearchXML) request.getAttribute("productResults");

                                if (products != null) {
                                    int i = 0;
                                    for (Product product : products.getProducts()) {
                                        i++;%>
                        <tr>
                            <td>
                                <%=i%>
                            </td>
                            <td>
                                <%=product.getBarcode()%>
                            </td>
                            <td>
                                <%=product.getName()%>
                            </td>
                            <%  }
                                    }
                                } catch (Exception e) {
                                    System.out.println("Error caught: " + e.getMessage());
                                }
                            %>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
</section>


<!-- Footer -->
<footer>
    &copy; Sarah & Nini. All rights reserved.
</footer>
</body>

</html>