
package Endpoint;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import Business.ViewBusiness;
import Helper.CustomersXML;

@Path("/profile/{username}")
public class ViewResource {

    @GET
    @Produces(MediaType.APPLICATION_XML)
    public CustomersXML viewProfile(@PathParam("username") String username) throws ClassNotFoundException {
        // Initialize the business logic class
        ViewBusiness viewBusiness = new ViewBusiness();
        
        // Retrieve customer information based on the provided username
        CustomersXML customersXML = viewBusiness.getCustomerByUsername(username);
        
        return customersXML;
    }
}

