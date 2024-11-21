<%-- 
    Document   : frontpageWithLogin
    Created on : Mar 15, 2021, 2:00:13 AM
    Author     : student
--%>

<%@page import="Helper.CustomersXML"%>
<%@page import="Helper.Customer"%>
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
                font-size :16px;
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

            .profile-info {
                background-color: #fff;
                margin: 20px;
                padding: 20px;
                border-radius: 10px;
            }
            .edit-button {
                background-color: #70cfe3;
                color: white;
                padding: 10px 20px;
                border: none;
                margin-right: 10px;
            }

            .delete-button {
                background-color: #ff0000;
                color: white;
                padding: 10px 20px;
                border: none;
            }
            .logout-button{
                background-color: #ffd5c8;
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
            <input type="hidden" name="pageName" value="profile"/>
            <!-- Profile Button -->
            <button class="profile-button">View Profile</button>

        </div>
        <!--         content Section -->
        <section class="content-section">
            <h2>View Profile</h2>
            <div class="profile-info">

                <h4>Hello
                    <%=request.getAttribute("username")%>
                </h4>

                <table>
                    <%  try {
                            CustomersXML products = (CustomersXML) request.getAttribute("productResults");

                            if (products != null) {
                                int i = 0;
                                for (Customer product : products.getCustomers()) {
                                    i++;%>
                    <tr>
                        <th>First name: </th>
                        <td> <%=product.getFname()%></td>
                    </tr>

                    <tr>
                        <th>Last name: </th>
                        <td> <%=product.getLname()%></td>
                    </tr>

                    <tr>
                        <th>Address: </th>
                        <td> <%=product.getAdr()%></td>
                    </tr>

                    <tr>
                        <th>Email: </th>
                        <td> <%=product.getEmail()%></td>
                    </tr>

                    <tr>
                        <th>Password: </th>
                        <td> <%=product.getPassword()%></td>
                    </tr>

                    <%  }
                            }
                        } catch (Exception e) {
                            System.out.println("Error caught: " + e.getMessage());
                        }
                    %>
                    </tr>
                </table>
                <!-- Login Banner -->
                <div class="login-banner">
                    <!-- edit Button -->
                    <button class="edit-button">Edit</button>
                    <!-- del Button -->
                    <button class="delete-button">Delete Account</button>

                </div>

            </div>
        </section>


        <!-- Footer -->
        <footer>
            &copy; Sarah & Nini. All rights reserved.
        </footer>
    </body>

</html>