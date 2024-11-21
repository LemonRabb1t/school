package Business;

import Helper.CustomersXML;
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
import Helper.Product;
import Helper.SearchXML;

/**
 *
 * @author student
 */
public class Business {

    public static boolean isAuthenticated(String username, String passwrod) {
        return true;
    }

    public static SearchXML getServices(String query) throws IOException {

        Client searchclient = ClientBuilder.newClient();
        WebTarget searchwebTarget
                = searchclient.target("http://localhost:8080/Search/webresources/search");
        InputStream is
                = searchwebTarget.path(query).request(MediaType.APPLICATION_XML).get(InputStream.class);
        String xml = IOUtils.toString(is, "utf-8");
        SearchXML products = productsxmltoObjects(xml);

        /* if (token != null) {
            Client holdclient = ClientBuilder.newClient();
            WebTarget holdwebTarget
                    = holdclient.target("http://localhost:8080/HoldBook/webresources/hold/isOnHold");
            for (Product book : products.getProducts()) {

                InputStream holddata
                        = holdwebTarget.path(book.getIsbn()).queryParam("token", token).
                                request(MediaType.APPLICATION_XML).get(InputStream.class);
                try{
                    Product a=bookholdxmltoObjects(IOUtils.toString(holddata, "utf-8"));
                    if(a!=null)
                        book.setTobeHold(true);
                    else
                        book.setTobeHold(false);
                }
                catch(Exception e){
                    book.setTobeHold(false);
                }
                
                
            }
        }
         */
        return (products);

    }

    public static CustomersXML getServicesCust(String query, String token) throws IOException {
        System.out.println("business getServices entered, token: " + token);

        if (token != null) {
            // searches by username
            Client profileclient = ClientBuilder.newClient();

            WebTarget searchwebTarget
                    = profileclient.target("http://localhost:8080/ViewProfile/webresources/profile");
            System.out.println("successful url webtarget, query: " + query);

            InputStream is
                    = searchwebTarget.path(query).request(MediaType.APPLICATION_XML).get(InputStream.class);
            System.out.println("successful input stream");
            String xml = IOUtils.toString(is, "utf-8");
            CustomersXML products = custxmltoObjects(xml);
            System.out.println("cust: " + query);
            return (products);

        }
        /* if (token != null) {
            Client holdclient = ClientBuilder.newClient();
            WebTarget holdwebTarget
                    = holdclient.target("http://localhost:8080/HoldBook/webresources/hold/isOnHold");
            for (Product book : products.getProducts()) {

                InputStream holddata
                        = holdwebTarget.path(book.getIsbn()).queryParam("token", token).
                                request(MediaType.APPLICATION_XML).get(InputStream.class);
                try{
                    Product a=bookholdxmltoObjects(IOUtils.toString(holddata, "utf-8"));
                    if(a!=null)
                        book.setTobeHold(true);
                    else
                        book.setTobeHold(false);
                }
                catch(Exception e){
                    book.setTobeHold(false);
                }
                
                
            }
        }
         */
        return (null);
    }

    private static SearchXML productsxmltoObjects(String xml) {
        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(SearchXML.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

            SearchXML products = (SearchXML) jaxbUnmarshaller.unmarshal(new StringReader(xml));
            return products;

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static CustomersXML custxmltoObjects(String xml) {
        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(CustomersXML.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

            CustomersXML products = (CustomersXML) jaxbUnmarshaller.unmarshal(new StringReader(xml));
            return products;

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }
    /*private static Product bookholdxmltoObjects(String xml) {
        if(xml.isEmpty())
            return null;
        JAXBContext jaxbContext;
        try {
            jaxbContext = JAXBContext.newInstance(Product.class);

            Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();

            Product book = (Product) jaxbUnmarshaller.unmarshal(new StringReader(xml));
            return book;

        } catch (JAXBException e) {
            e.printStackTrace();
        }
        return null;
    }
     */
}
