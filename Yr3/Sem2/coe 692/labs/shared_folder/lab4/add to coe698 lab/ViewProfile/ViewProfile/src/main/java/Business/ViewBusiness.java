package Business;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import Helper.CustomersXML;
import Helper.Customer;
import Persistence.Customer_CRUD;

public class ViewBusiness {
    
    public CustomersXML getCustomerByUsername(String username) {
        // Get customer information from the database based on the username
        Set<Customer> customersSet = Customer_CRUD.getCustomerByUsername(username);
        
        // Convert the set of customers to a list
        List<Customer> customersList = new ArrayList<>(customersSet);
        
        // Create a CustomersXML object and set the list of customers
        CustomersXML customersXML = new CustomersXML();
        customersXML.setCustomers(customersList);
        
        return customersXML;
    }
}
