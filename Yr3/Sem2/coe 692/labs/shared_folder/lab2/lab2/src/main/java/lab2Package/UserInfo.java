/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab2Package;

/**
 *
 * @author student
 */
public class UserInfo {
    private String username, password;
    
    public UserInfo(String user, String pword){
        changeUser(user);
        changePword(pword);
    }
    
    public void changeUser(String u){
        username = u;
    }
    
    public void changePword(String p){
        password = p;
    }
    
    public String getUser(){
        return username;
    }
    
    public String getPword(){
        return password;
    }

}
