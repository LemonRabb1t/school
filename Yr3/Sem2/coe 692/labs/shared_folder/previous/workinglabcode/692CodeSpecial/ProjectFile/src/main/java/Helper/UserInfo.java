/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;


/**
 *
 * @author student
 */
public class UserInfo {

    private String fname, lname, adr, email, username, password;
    
    public UserInfo( String fname, String lname, String adr, String email, String username, String password) {

        this.fname = fname;
        this.lname = lname;
        this.adr = adr;
        this.email = email;
        this.username = username;
        this.password = password;
    }


    public String getFname() {
        return fname;
    }


    public String getLname() {
        return lname;
    }


    public String getAdr() {
        return adr;
    }


    public String getEmail() {
        return email;
    }


    public String getUsername() {
        return username;
    }


    public String getPassword() {
        return password;
    }
    
     

}
