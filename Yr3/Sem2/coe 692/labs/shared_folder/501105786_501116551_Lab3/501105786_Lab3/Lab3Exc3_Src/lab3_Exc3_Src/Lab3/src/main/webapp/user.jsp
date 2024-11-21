<%-- 
    Document   : user
    Created on : Feb 5, 2024, 1:46:38 PM
    Author     : student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <style>
        body {
            font-family: 'sans-serif';
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #333;
        }

        main {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        form {
            display: inline-block;
        }

        .form-group {
            margin-right: 10px;
        }

        input[type="submit"] {
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <header>
        <h1 style="font-family:caveat"><center>Music Browser</center></h1>
    </header>
<main>
    <form action="Songs" method="POST">
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Songs">
        </div>
    </form>
    <form action="Search" method="POST">
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Search">
        </div>
    </form>
    <form action="Playlist" method="POST">
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Playlists">
        </div>
    </form>
    <form action="Logout" method="POST">
        <div class="form-group">
            <input type="submit" class="btn btn-primary" value="Logout">
        </div>
    </form>
</main>

</body>
</html>


