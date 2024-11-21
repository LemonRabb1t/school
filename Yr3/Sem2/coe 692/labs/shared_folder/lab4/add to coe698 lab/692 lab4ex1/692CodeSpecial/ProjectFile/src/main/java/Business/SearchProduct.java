/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;

import java.util.ArrayList;
import Helper.Product;
import Persistence.Product_CRUD;
import java.util.ArrayList;

/**
 *
 * @author sarahjawwad
 */
public class SearchProduct {
    
    // Method to display all products
    public static ArrayList<Product> displayProducts() {
        return Product_CRUD.readAllProducts();
    } 
    
    // Method to search for products by name
    public static ArrayList<Product> searchProducts(String keyword) {
        return Product_CRUD.searchProducts(keyword);
    }
    
}
