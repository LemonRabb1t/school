/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistence;

import Helper.UserInfo;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author sarahjawwad
 */
public class Customer_CRUD {

    private static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SCS", "root", "student");
            System.out.println("Connection established.");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }

    public static UserInfo read(String username, String password) {
        UserInfo bean = null;
        try {
            Connection con = getCon();

            String q = "SELECT * FROM Customer WHERE username = ? and password =?";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, username); // Set username as parameter
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Get user info
                Integer ID = rs.getInt("ID");
                String fname = rs.getString("firstname");
                String lname = rs.getString("lastname");
                String adr1 = rs.getString("addressL1");
                String adr2 = rs.getString("addressL2");
                String email = rs.getString("email");
                String pass = rs.getString("password");

                if (pass.equals(password)) {
                    bean = new UserInfo(ID, fname, lname, adr1, adr2, email, username, pass); // 
                }

            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return bean;
    }

    public static void write(String fn, String ln, String add, String email, String user, String password) {
        int rowsAdded = 0;
        Connection con = null;
        PreparedStatement ps= null;
        try {
            con = getCon();

            if (con != null) {

                String q = "INSERT INTO Customer (firstName, lastName, address, email, username, password) Values (?,?,?,?,?,?);";

                ps = con.prepareStatement(q);
                ps.setString(1, fn);
                ps.setString(2, ln);
                ps.setString(3, add);
                ps.setString(4, email);
                ps.setString(5, user);
                ps.setString(6, password);

                rowsAdded = ps.executeUpdate();
                
                if (rowsAdded > 0) {
                    System.out.println("Account created.");
                } else {
                    System.out.println("USER: Failed to save playlist information.");
                }
            } else {
                System.out.println("No connection");
            }
        } catch (Exception e) {
            System.out.println(e);
        } finally{
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

    public static boolean login(String username, String password) {
        try {
            Connection con = getCon();

            String q = "SELECT * FROM Customer WHERE username = ? and password =?";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, username); // Set username as parameter
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
        return false;
    }
}
