/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;

import Helper.AdminInfo;
import Persistence.Admin_CRUD;

public class AdminVerify {

    // Method to verify admin credentials
    public static AdminInfo verifyAdmin(String username, String password) {
        return Admin_CRUD.verifyAdmin(username, password);
    }
}

