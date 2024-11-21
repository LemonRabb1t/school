package Persistence;

import Helper.ProductAdd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductADD_CRUD {

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

    public static boolean addToCart(int productId, String userId) throws ClassNotFoundException, SQLException {
        Connection con = getCon();
        String query = "INSERT INTO CartItem (user_id, product_id, quantity) VALUES (?, ?,?)";
        PreparedStatement preparedStatement = con.prepareStatement(query);
        preparedStatement.setString(1, userId);
        preparedStatement.setInt(2, productId);
        preparedStatement.setInt(3, 1);
        int rowsAffected = preparedStatement.executeUpdate();
        return rowsAffected > 0;

    }

    public static ProductAdd getCart(String userId) {
        ProductAdd cart = null;
        try {
            Connection con = getCon();
            String query = "select * from Cart " + " WHERE " + "user_id = '" + userId + "';";
            System.out.println(query);

            PreparedStatement preparedStatement = con.prepareStatement(query);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                int prod_id = Integer.valueOf(rs.getString("product_id"));
                //int prod_num = Integer.valueOf(rs.getString("quantity"));

                cart = new ProductAdd(prod_id, userId);

            }
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }

        return cart;

    }

}
