/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Set;
import java.util.HashSet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Helper.Product;

/**
 *
 * @author sarahjawwad
 */
public class Product_CRUD {
    
    private static Connection getCon() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/SEARCH_SNC", "root", "student123");
            System.out.println("Connection established.");
        } catch (Exception e) {
            System.out.println(e);
        }
        return con;
    }
    
    public static Set<Product> searchForProducts(String query) {
    Set<Product> products = new HashSet<>();
    try {
        Connection con = getCon();
        
        String q = "SELECT * FROM Product WHERE name LIKE '%" + query + "%';";
        System.out.println(q);
        PreparedStatement ps = con.prepareStatement(q);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            int productId = rs.getInt("product_id");
            String name = rs.getString("name");
            double price = rs.getDouble("price");
            
            // Creating a Product object for each result
            Product product = new Product(productId, name, price);
            products.add(product);
        }
        con.close();
    } catch (Exception e) {
        System.out.println(e);
    }
    System.out.println("Total products found: " + products.size());
    return products;
}


}