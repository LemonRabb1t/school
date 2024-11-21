/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Helper;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlElement;

import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author student
 */

@XmlRootElement(name="products")
@XmlAccessorType (XmlAccessType.FIELD)

public class ProductXML {
    @XmlElement(name="product")
    private ArrayList<Product> products;
    
    ProductXML(){}
    
    public List<Product>getProducts(){
        return products;
    }
    
    public void setProducts(ArrayList<Product> p){
        products = p;
    }
}
