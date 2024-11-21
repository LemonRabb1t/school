/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Persistence;

import Helper.CatalogueList;
import Helper.Product;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author sarahjawwad
 */
public class Inventory_CRUD {
    private static Connection getCon() { // connection to db
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
    
    // gather all 
    public static CatalogueList read(int ProdBarcode) {

        CatalogueList list = new CatalogueList();
        try {
            Connection con = getCon();

            String q = "SELECT * FROM Product WHERE barcode = ?";

            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, ProdBarcode); // Set username as parameter
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Get product info
                Integer prodBar = rs.getInt("barcode");
                String name = rs.getString("Name");
                int price = rs.getInt("Price");
                    
                // add product to the list
                Product p = new Product(prodBar, name, price);
                list.addProduct(p);

            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    
}
