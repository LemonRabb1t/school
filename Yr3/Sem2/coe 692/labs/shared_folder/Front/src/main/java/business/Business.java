/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package business;

import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Invocation;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import org.apache.commons.io.IOUtils;
import Helper.Customer;
import Helper.CustomersXML;
import Helper.Product;

/**
 *
 * @author student
 */
public class Business {

    public static boolean isAuthenticated(String username, String passwrod) {
        return true;
    }

    public static CustomersXML getServices(String query, String token) throws IOException {

        Client searchclient = ClientBuilder.newClient();
        WebTarget searchwebTarget
                = searchclient.target("http://localhost:8080/Search/webresources/search"); 
        InputStream is
                = searchwebTarget.path(query).request(MediaType.APPLICATION_XML).get(InputStream.class);

        String xml = IOUtils.toString(is, "utf-8");
        CustomersXML customer = customerxmltoObjects(xml);

        // must have a token to view profile
        if (token != null) {
            Client holdclient = ClientBuilder.newClient();
            WebTarget holdwebTarget
                    = holdclient.target("http://localhost:8080/ViewProfile/webresources/profile"); // confirmed address

            
            for (Customer c : customer.getCustomers()) {
                
                InputStream holddata
                    = holdwebTarget.path(c.getUsername()).queryParam("token", token).
                            request(MediaType.APPLICATION_XML).get(InputStream.class);
                
                try {
                    Customer a = custxmltoObjects(IOUtils.toString(holddata, "utf-8"));

                    // cust found
                    if (a != null) {
                        c.setExists(true);
                    } else {
                        c.setExists(false);
                    }
                } catch (Exception e) {

                }
            }

        }

        return (customer);

    }

    private static CustomersXML customerxmltoObjects(String xml) {
        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(CustomersXML.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

            CustomersXML customers = (CustomersXML) jaxbUnmarshaller.unmarshal(new StringReader(xml));
            return customers;

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static Customer custxmltoObjects(String xml) {
        if (xml.isEmpty()) {
            return null;
        }
        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(Customer.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

            Customer c = (Customer) jaxbUnmarshaller.unmarshal(new StringReader(xml));
            return c;

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }

}
