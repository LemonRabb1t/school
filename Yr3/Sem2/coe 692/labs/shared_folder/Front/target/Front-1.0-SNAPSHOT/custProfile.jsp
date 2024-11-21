<%@page import="java.util.List"%>
<%@page import="Helper.Customer"%>
<%@page import="Helper.CustomersXML"%>
<%@page contentType="text/html" pageEncoding ="UTF-8"%>



<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Profile | SINI'S Convenience</title>
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

            .user-profile {
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

            .table-container {
                flex-grow: 1; 
            }

            .user-profile table {
                width: 100%;
                margin-top: 10px;
                table-layout: fixed; 
            }

            .user-profile table th,
            .user-profile table td {
                padding: 10px;
                text-align: left;
                width: 50%;
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
            <div class="user-profile">
                <h2>User Profile</h2>

                <div class="table-container">
                    <table>
                        <tr>
                            <th></th>
                            <th>User Name:</th>
                            <th>Address: </th>
                            <th>Email:</th>
                        </tr>
                        <%  CustomersXML customers = (CustomersXML) request.getAttribute("customer");
                            if (customers != null) {
                                int i = 0;
                                for (Customer c : customers.getCustomers()) {
                                    i++;%>
                        <tr>
                            <td><%=c.getUsername()%></td>
                            <td>
                                <%=c.getAdr()%>
                            </td><td><%=c.getEmail()%></td>

                        </tr>
                    </table>
                </div>
                <div class="buttons">
                    <button type="button" class="btn btn-primary">Edit</button>
                    <button type="button" class="btn btn-danger">Delete Account</button>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            &copy; 2024 Sarah & Nini. All rights reserved.
        </footer>

        <!-- Include Bootstrap JS (or your preferred JS framework) -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>

</html>