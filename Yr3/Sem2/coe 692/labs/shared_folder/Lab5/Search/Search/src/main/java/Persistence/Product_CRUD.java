package Persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Set;
import java.util.HashSet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Helper.Product;
import java.sql.*;

/**
 *
 * @author sarahjawwad
 */
public class Product_CRUD {

    private static Connection getCon() throws ClassNotFoundException, SQLException {
        Connection con = null;

        //String connection="localhost:3306";
        String connection = System.getenv("DB_URL");
        System.out.println(connection);

        Class.forName("com.mysql.cj.jdbc.Driver");

        con = DriverManager.getConnection("jdbc:mysql://" + connection + "/hold_LBS?allowPublicKeyRetrieval=true&useSSL=false", "root", "student");
        System.out.println("Connection established.");
        return con;
    }

    public static Set<Product> readProducts() throws ClassNotFoundException {
        Set<Product> productsList = new HashSet<>();
        try {
            Connection con = getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM SEARCH_SNC.Product");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int barcode = rs.getInt("barcode");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                Product product = new Product(barcode, name, price);
                productsList.add(product);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productsList;
    }

    public static Set<Product> searchForProducts(String query) throws ClassNotFoundException {
        Set<Product> products = new HashSet<>();
        try {
            Connection con = getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM SEARCH_SNC.Product WHERE name LIKE ?");
            ps.setString(1, "%" + query + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int barcode = rs.getInt("barcode");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                Product product = new Product(barcode, name, price);
                products.add(product);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>" + products.size());
        return products;
    }
    
  

}
