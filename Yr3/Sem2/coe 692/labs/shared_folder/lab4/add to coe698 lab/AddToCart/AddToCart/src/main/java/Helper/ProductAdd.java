package Helper;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "productAdd")
@XmlAccessorType(XmlAccessType.FIELD)

public class ProductAdd {

    private int productId;
    private String username;
    

    public ProductAdd() {
    }

    public ProductAdd(int productId, String username) {
        this.productId = productId;
        this.username = username;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
