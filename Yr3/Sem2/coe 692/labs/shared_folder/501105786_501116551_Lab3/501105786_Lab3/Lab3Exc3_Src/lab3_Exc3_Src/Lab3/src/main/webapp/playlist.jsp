<%@page import="java.sql.*,java.util.*" %>
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

        table {
            width: 100%;
            border: 2px solid #ddd; /* Outline the table with a border */
            border-collapse: collapse;
            margin-top: 20px;
            text-align: center; /* Center-align the content within table cells */
        }

        th, td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #f5f5f5;
        }
    </style>
</head>
<body>
<header>
    <h1 style="font-family:caveat"><center>Music Browser</center></h1>
</header>
<main>
    <form action="Create" method="POST">
        <label for="playlistName">Playlist Name:</label>
        <input type="text" id="playlistName" name="playlistName" required>
        <br><br>
        <label for="description">Description</label>
        <textarea id="description" name="description" rows="4" cols="50"></textarea>
        <br><br>
        <input type="submit" class="btn btn-primary" value="Create">
    </form>

    <table>
        <tr>
            <th>Playlist Name</th>
            <th>Description</th>
        </tr>

        <% 
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MusicBrowser", "root", "student");
                String query = "SELECT playlist_name, description FROM playlist";
                pstmt = con.prepareStatement(query);
                rs = pstmt.executeQuery();
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("playlist_name") %></td>
                        <td><%= rs.getString("description") %></td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            }
        %>
    </table>
</main>
</body>
</html>
