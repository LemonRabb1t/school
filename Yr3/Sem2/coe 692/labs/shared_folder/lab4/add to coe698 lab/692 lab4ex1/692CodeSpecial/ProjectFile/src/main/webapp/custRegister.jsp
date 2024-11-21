<%-- 
    Document   : custRegister
    Created on : Feb 4, 2024, 10:45:05 PM
    Author     : nini
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Register page| SINIS Convenience</title>
        <!-- Include Bootstrap CSS -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            /* Custom CSS */
        /* Custom CSS */
        body {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url("resources/register.png");
            background-size: contain; /* Adjust the background size */
            background-position: center;
        }

        .custom-form {
            padding: 20px;
            border-radius: 20px;
            background-color: #fbdada;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 0 10px; /* Adjust margins for spacing */
            max-width: 550px; /* width of box */
        }

        /* Form styles */
        .custom-form .form-group {
                width: 100%;
                max-width: 900px; /* Adjust the maximum width as needed */
                margin: 30px; /* Adjust top margin as needed and set auto margins for centering */
            }


        th, td {
            text-align: center;
            font-family: Noteworthy; /* Change the font family here */
            font-weight: bold; /* Add this line to make the text bold */
        }

        .page-top {
            font-family: 'Noteworthy';
            align-items: center;
            text-align: center;
        }

        .button-circ{
            display: flex;
            justify-content: flex-end; /* Align items to the end of the container (to the right in this case) */
            margin-top: 450px; /* Adjust the margin as needed */
        }
        
        .button-box {
            display: flex;
            justify-content: center;
            margin-top: 0px; /* Add margin to separate from other elements */
        }

        .button-box input[type="submit"],
        .button-box input[type="reset"] {
            margin: 5px; /* Adjust margin to add space between buttons */
        }

        </style>
    </head>
    <body>

        <!-- Header -->
        <div class="button-circ">
            <a href="/lab2/index.html" target="_self" class="btn btn-secondary">Return to log in</a>
        </div>

        <body>
            <p style="font-family: Noteworthy; color: white; font-weight: bold; font-size: x-large;">
                Thank you for creating an account with us, <%=session.getAttribute("username")%>!
            </p>
        </body>
    </html>
