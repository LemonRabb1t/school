package lab3.Persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Playlist {
    private String name;
    private String description;

    public Playlist(String name, String description) {
        this.name = name;
        this.description = description;
    }

    // Establish database connection
    private static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MusicBrowser", "root", "student");
            System.out.println("USER: Connected to database");
        } catch (Exception e) {
            System.out.println("USER: " + e);
        }
        return con;
    }

    // Method to insert playlist information into the database
    public void savePlaylist() {
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = getCon();
            if (con != null) {
                String query = "INSERT INTO playlist (playlist_name, description, creator_id) VALUES (?, ?, 1)";
                ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, description);
                int rowsAffected = ps.executeUpdate();
                if (rowsAffected > 0) {
                    System.out.println("USER: Playlist information saved successfully.");
                } else {
                    System.out.println("USER: Failed to save playlist information.");
                }
            } else {
                System.out.println("USER: Failed to establish database connection.");
            }
        } catch (SQLException e) {
            System.out.println("USER: Error while saving playlist: " + e.getMessage());
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                System.out.println("USER: Error closing resources: " + e.getMessage());
            }
        }
    }
}
