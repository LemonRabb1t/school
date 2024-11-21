package lab3.Persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private String username;
    private String password;

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    // Establish database connection
    private static Connection getCon(){
        Connection con = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/MusicBrowser","root","student");
            System.out.println("USER: Connected to database");
        }
        catch(Exception e){
            System.out.println("USER: " + e);
        }
        return con;
    }

    // Authenticate user
    public static boolean login(String username, String password){
        try{ Connection con = getCon();
            PreparedStatement ps = con.prepareStatement("select * from user where username=? and password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return true;
            }
        }
        catch(Exception e){
            System.out.println(e);
            return false;
        }
        return false;

    }
}
