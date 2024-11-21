/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import Helper.ProductsXML;
import Helper.Product;
import Persistence.Product_CRUD;

public class SearchBusiness {
    
    public ProductsXML getProductsByQuery(String query) {
        // Get products from the database based on the query
        Set<Product> products = Product_CRUD.searchForProducts(query);
        
        // Group products by some unique identifier (e.g., product name) to handle duplicates
        Map<String, Product> uniqueProducts = new HashMap<>();
        for (Product product : products) {
            uniqueProducts.put(product.getName(), product);
        }
        
        // Convert the map values (unique products) to a list
        List<Product> uniqueProductList = new ArrayList<>(uniqueProducts.values());
        
        // Create ProductsXML object and set the list of unique products
        ProductsXML productsXML = new ProductsXML();
        productsXML.setProducts(new ArrayList<>(uniqueProductList));
        
        return productsXML;
    }
}