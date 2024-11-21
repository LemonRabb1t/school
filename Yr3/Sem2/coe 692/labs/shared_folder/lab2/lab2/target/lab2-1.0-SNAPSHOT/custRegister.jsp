<%-- 
    Document   : custRegister
    Created on : Feb 4, 2024, 10:45:05 PM
    Author     : nini
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>

<String name = request.getParameter("username"); %>
<html> 
        <title>Create Account | SINIS Convenience</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* Custom CSS */
            body {
                background-color: #7389a6; /* Light grey Background */
                color: #222831; /* Dark Grey Text Color */
                font-family: 'Arial', sans-serif; /* Change the font-family as needed */
            }

            .custom-form {
                display: flex;
                flex-direction: column;
                align-items: center;
                padding: 25px;
                border-radius: 10px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-top: 30px;
            }

            .custom-form .form-group {
                width: 100%;
            }

            .custom-form .form-control {
                background-color: #f2f2f2; /* Ligh Grey Background for Input Boxes */
                border: 1px solid #ccc; /* Border Color */
            }

            th, td {
                text-align: left;
                border:  3px solid white;
            }

            .page-top{
                font-family: 'caveat';
                align-items: center;
                text-align: center
            }

        </style>
    </head>
    <body>

     <h1>Thank you for creating an account with us, <%=session.getAttribute("username")%>!</h1>
    </body>
</html>
