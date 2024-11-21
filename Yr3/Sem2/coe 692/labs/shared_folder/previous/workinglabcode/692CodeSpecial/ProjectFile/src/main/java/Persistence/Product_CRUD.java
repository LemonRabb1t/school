/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistence;

import Helper.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Product_CRUD {

    private static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SCS", "root", "student123");
            System.out.println("Connection established.");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }


    // Method to read all products from the database
    public static ArrayList<Product> readAllProducts() {
        ArrayList<Product> products = new ArrayList<>();
        try (Connection con = getCon()) {
            if (con != null) {
                String query = "SELECT * FROM Product";
                try (PreparedStatement pstmt = con.prepareStatement(query);
                     ResultSet rs = pstmt.executeQuery()) {
                    while (rs.next()) {
                        int barcode = rs.getInt("barcode");
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        String imageUrl = rs.getString("imageURL");
                        int amount = rs.getInt("amount");
                        products.add(new Product(barcode, name, imageUrl, price, amount));
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately
        }
        return products;
    }
}

