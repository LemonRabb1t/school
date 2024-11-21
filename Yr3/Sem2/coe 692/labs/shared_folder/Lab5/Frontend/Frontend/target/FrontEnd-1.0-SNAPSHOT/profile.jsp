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
        <title>View profile page</title>
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

        </div>
        <!-- content Section -->
        <section class="content-section">
            <div class="container">
                <div class="account-box">
                    <h2>My Account</h2>
                    <form action="FrontEnd" method="post">  
                        Hello <%=request.getAttribute("username")%>
                        
                        <% 
                            CustomersXML customers = (CustomersXML) request.getAttribute("AccountResults");
                            if (customers != null) {
                                for(Customer customer: customers.getCustomers()){
                                //Customer customer = account.getCustomers().get(0); // Assuming there's only one customer
                        %>
                        <div class="form-row">
                            <div class="form-group1">
                                <label>Username</label>
                                <input type="text" name="username" value="<%= customer.getUsername() %>" readonly>
                            </div>
                            <div class="form-group1">
                                <label>Password</label>
                                <input type="text" name="password" value="<%= customer.getPassword() %>" readonly>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" name="name" value="<%= customer.getFname() + ' ' + customer.getLname() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="text" name="email" value="<%= customer.getEmail() %>" readonly>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <input type="text" name="address" value="<%= customer.getAdr() %>" readonly>
                        </div>
                        <% 
                            }} else{
                        %> No customer found. <%}%>
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