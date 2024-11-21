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
public class Product {
    int barcode;
    String name;
    float price;
    
    public Product (int barcode, String name, float price){
        this.barcode = barcode;
        this.name = name;
        this.price = price;
    }
    
    public int getBarcode(){
        return barcode;
    }
}
