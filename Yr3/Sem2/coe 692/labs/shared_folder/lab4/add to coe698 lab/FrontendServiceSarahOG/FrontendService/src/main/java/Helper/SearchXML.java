
package Helper;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlRootElement;

 @XmlRootElement(name = "products")
@XmlAccessorType (XmlAccessType.FIELD)
       public class SearchXML{
     @XmlElement(name="product")
           private ArrayList<Product> products;
           
           
           public List<Product>getProducts(){
               return products;
               
           }
           
           SearchXML(){
                              
           }
           public void setBook(ArrayList<Product> bs){
               products=bs;
               
           }
           
       }