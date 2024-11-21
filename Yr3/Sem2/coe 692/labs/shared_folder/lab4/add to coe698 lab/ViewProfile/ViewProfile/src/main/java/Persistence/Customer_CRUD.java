
package Persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Set;
import java.util.HashSet;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Helper.Customer;
import java.sql.*;

/**
 *
 * @author sarahjawwad
 */
public class Customer_CRUD {
    
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

       
       //getting user data from the database
        public static Set<Customer> getCustomerByUsername(String username) throws ClassNotFoundException, SQLException {
        Set<Customer> customers = new HashSet<>();
        try (Connection con = getCon()) {
            if (con != null) {
                String q = "SELECT * FROM CustInfo WHERE username = ?";
                PreparedStatement ps = con.prepareStatement(q);
                ps.setString(1, username);

                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
                    Customer customer = new Customer();
                    customer.setFname(rs.getString("firstName"));
                    customer.setLname(rs.getString("lastName"));
                    customer.setAdr(rs.getString("address"));
                    customer.setEmail(rs.getString("email"));
                    customer.setUsername(rs.getString("username"));
                    customer.setPassword(rs.getString("password"));
                    customers.add(customer);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
        }
}
