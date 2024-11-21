/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;
import Helper.Product;
import Persistence.Product_CRUD;
import java.util.ArrayList;


/**
 *
 * @author sarahjawwad
 */
public class ProductTile {
    
        public static ArrayList<Product> readAllProducts() {
        return Product_CRUD.readAllProducts();
    } 
    
}
