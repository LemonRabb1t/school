/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Business;

import Persistence.Customer_CRUD;
import Helper.UserInfo;

public class CustVerify {
     
    //user with account tries logging in
    public static UserInfo verifyUser(String username, String password) {
        UserInfo uf= Customer_CRUD.read(username, password);
        return uf;
    }
    
    //user tries registering 
    public static UserInfo newUser(String fname, String lname, String email, String adr, String username, String password) {
       //check if all fields are filled
        if (fname == null || fname.isEmpty() || lname == null || lname.isEmpty() || email == null || email.isEmpty() ||adr == null|| 
                adr.isEmpty() ||username == null || username.isEmpty() || password == null || password.isEmpty()) {
            
            return null; 
        }
        return Customer_CRUD.create(fname, lname, email, adr, username, password);
    }
     
}