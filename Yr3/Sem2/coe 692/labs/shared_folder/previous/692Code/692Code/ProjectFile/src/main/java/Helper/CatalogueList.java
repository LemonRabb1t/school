/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author student
 */
public class CatalogueList {
    private List<Product> inventory;
    
    public CatalogueList(){
        inventory = new ArrayList<>();
    }
    
    public void addProduct(Product p){
        inventory.add(p);
    }
    
    public List<Product> getInventory(){
        return inventory;
    }
    
    public void setCatalogue(List<Product> c){
        inventory = c;
    }
    
    public int deleteProduct(int barcode){
        for (int i=0;i<inventory.size();i++){
            Product p = inventory.get(i);
            if (p.getBarcode() == barcode){
                inventory.remove(i);
                return 1; // deleted
            }
        }
        return 0; // fail deleted
    }
}
