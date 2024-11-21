/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistence;

import Helper.UserInfo;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author sarahjawwad
 */
public class Customer_CRUD {

    private static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/siniDB", "root", "student");
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

            if (con != null) {
                // Scs.Customer -> Customer
                String q = "SELECT * FROM Customer WHERE username = ? AND password = ? ";
                PreparedStatement ps = con.prepareStatement(q);
                ps.setString(1, username);
                ps.setString(2, password);

                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    // User found, extract information
                    System.out.println("User found");
                    String fname = rs.getString("firstname");
                    String lname = rs.getString("lastname");
                    String adr = rs.getString("address");
                    String email = rs.getString("email");
                    String pass = rs.getString("password");

                    if (pass.equals(password)) {
                        // Password matches, create UserInfo object
                        System.out.println("Password match");
                        bean = new UserInfo(fname, lname, adr, email, username, password);
                    } else {
                        System.out.println("Password mismatch");
                    }
                } else {
                    System.out.println("No user found for the given username and password");
                }
                con.close();
            } else {
                System.out.println("Connection failed");
            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return bean;
    }

    //when customer registers
    public static UserInfo create(String fname, String lname, String email, String adr, String username, String password) {
        UserInfo bean = null;
        Connection con = null;
        PreparedStatement ps = null;
        
        try {
            con = getCon();
            if (con != null) {
                ps = con.prepareStatement("INSERT INTO Customer (firstName, lastName, address, email, username, password) VALUES (?, ?, ?, ?, ?,?)");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, adr);
                ps.setString(5, username);
                ps.setString(6, password);

                int count = ps.executeUpdate();

                if (count > 0) { // succesfully inserted into sql table
                    bean = new UserInfo(fname, lname, email, adr, username, password);
                }

                con.close();
            } else {
                System.out.println("Connection failed");
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return bean;
    }

}
