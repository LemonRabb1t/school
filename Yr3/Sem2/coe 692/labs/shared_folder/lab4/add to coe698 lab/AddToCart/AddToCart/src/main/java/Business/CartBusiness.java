package Business;

// KNOWN ISSUES: can't find io repo in mavern


import Helper.ProductAdd;
import Persistence.ProductADD_CRUD;
import io.kubemq.sdk.basic.ServerAddressNotSuppliedException;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class CartBusiness {

    public ProductAdd getCart(String userId) {
        ProductAdd add = ProductADD_CRUD.getCart(userId);
        return (add);
    }

    public boolean add(String userId, int productId) throws ClassNotFoundException, SQLException, ServerAddressNotSuppliedException, IOException {
        
        boolean success = false;

        success = ProductADD_CRUD.addToCart(productId, userId);

        return success;
    }

}
