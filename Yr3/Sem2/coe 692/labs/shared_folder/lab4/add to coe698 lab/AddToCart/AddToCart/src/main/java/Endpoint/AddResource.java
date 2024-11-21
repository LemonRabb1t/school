package Endpoint;

import Business.CartBusiness;
import io.kubemq.sdk.basic.ServerAddressNotSuppliedException;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

@Path("cart")
public class AddResource {

    @Context
    private UriInfo context;

    public AddResource() {
    }

    @GET
    @Produces(MediaType.APPLICATION_XML)
    @Path("addToCart/{productId}/{username}")
    public String addToCart(@PathParam("productId") int productId, @PathParam("username") String username) throws SQLException, ClassNotFoundException, ServerAddressNotSuppliedException, IOException {
        CartBusiness addBusiness = new CartBusiness();
        boolean success = addBusiness.add(username, productId);
        return success ? "Added to cart successfully" : "Failed to add to cart";
    }

    @POST
    @Produces(MediaType.TEXT_PLAIN)
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Path("update")
    public String updateCart(@FormParam("productId") int productId, @FormParam("username") String username) throws ClassNotFoundException, SQLException, IOException, ServerAddressNotSuppliedException {
        CartBusiness addBusiness = new CartBusiness();
        boolean success = addBusiness.add(username, productId);
        return success ? "Added to cart successfully" : "Failed to add to cart";
    }
}
