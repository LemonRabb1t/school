/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author student
 * user info class 
 */
public class UserInfo {
    private int ID;
    private String fname, lname, adr, email, username, password,adr1,adr2, city, prov, country;
    
    public UserInfo(int id, String fname, String lname, String adr1, String adr2, String city, String prov, String country, String email, String username, String password) {
        this.ID = id;
        this.fname = fname;
        this.lname = lname;
        this.adr1 = adr1;
        this.adr2 = adr2;
        this.city = city;
        this.prov = prov;
        this.country = country;
        this.email = email;
        this.username = username;
        this.password = password;
    } // full implementation ver
    
    public UserInfo(String fname, String lname, String adr1,String email,String user, String pass){
        this.fname = fname;
        this.lname = lname;
        this.adr1 = adr1;
        this.adr2 = adr2;
        this.email = email;
        this.username = user;
        this.password = pass;
    } // write vers
    
    public UserInfo(int id, String fname, String lname, String adr1,String adr2, String email,String user, String pass){
        this.ID = id;
        this.fname = fname;
        this.lname = lname;
        this.adr1 = adr1;
        this.adr2 = adr2;
        this.email = email;
        this.username = user;
        this.password = pass;
    } // read vers
    
    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }
   

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getAdr1() {
        return adr1;
    }

    public void setAdr1(String adr) {
        this.adr1 = adr;
    }
    
    public String getAdr2() {
        return adr2;
    }

    public void setAdr2(String adr) {
        this.adr2 = adr;
    }
    
      public String getCity() {
        return city;
    }

    public void setCity(String c) {
        this.city = c;
    }
    
    public String getProvince() {
        return prov;
    }

    public void setProvince(String p) {
        this.prov = p;
    }
    
     public String getCountry() {
        return country;
    }

    public void setCountry(String c) {
        this.country = c;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
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
    
    public void write() {
        int rowsAdded = 0;
        Connection con = null;
        PreparedStatement ps= null;
        try {
            con = getCon();

            if (con != null) {

                String q = "INSERT INTO CUSTOMER (firstName, lastName, address, email, username, password) Values (?,?,?,?,?,?);";

                ps = con.prepareStatement(q);
                ps.setString(1, getFname());
                ps.setString(2, getLname());
                ps.setString(3, getAdr1());
                ps.setString(4, getEmail());
                ps.setString(5, getUsername());
                ps.setString(6, getPassword());

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
}



