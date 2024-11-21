
package Helper;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "customers")
@XmlAccessorType(XmlAccessType.FIELD)
public class CustomersXML {
    
    @XmlElement(name = "customer")
    private List<Customer> customers;

    public List<Customer> getCustomers() {
        return customers;
    }
    
    CustomersXML(){
           }
    
    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }

    
}
