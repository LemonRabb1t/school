package Business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import Helper.ProductsXML;
import Helper.Product;
import Persistence.Product_CRUD;
import io.kubemq.sdk.basic.ServerAddressNotSuppliedException;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import Business.Messaging;

public class SearchBusiness {

    public ProductsXML getProductsByQuery(String query) throws ClassNotFoundException {
        // Get products from the database based on the query
        Set<Product> products = Product_CRUD.searchForProducts(query);

        // Group products by some unique identifier (e.g., product name) to handle duplicates
        Map<String, Product> uniqueProducts = new HashMap<>();

        for (Product product : products) {
            if (uniqueProducts.containsKey(product.getName())) {
                // Handle duplicates by updating the existing product
                Product existingProduct = uniqueProducts.get(product.getName());
                existingProduct.setPrice(product.getPrice()); // Update price if necessary
                // You can add more logic here if needed
            } else {
                // Add the product if it's unique
                uniqueProducts.put(product.getName(), product);
            }
        }

        // Convert the map values (unique products) to a list
        List<Product> uniqueProductList = new ArrayList<>(uniqueProducts.values());

        // Create ProductsXML object and set the list of unique products
        ProductsXML productsXML = new ProductsXML();
        productsXML.setProducts(new ArrayList<>(uniqueProductList));

        return productsXML;
    }

    public void addtoCart(String userId, int productId) throws ClassNotFoundException, SQLException, ServerAddressNotSuppliedException, IOException {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.now();

        LocalDate exDate = date.plusDays(14);

        Messaging.sendmessage("MSG:" + userId + ":" + productId + ":" + exDate.format(formatter));

    }

}
