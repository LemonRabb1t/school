/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Helper;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;

import javax.xml.bind.annotation.XmlTransient;

/**
 * nini
 */
@XmlRootElement (name = "product")
@XmlAccessorType (XmlAccessType.FIELD)

public class Product {
@XmlTransient
    private final int barcode;
    private final String name;
    private final String imageUrl;
    private final double price;
    private int amount; 
    private boolean toBeBought;

    public Product(int barcode, String name, String imageUrl, double price, int amount) {
        this.barcode = barcode;
        this.name = name;
        this.imageUrl = imageUrl;
        this.price = price;
        this.amount = amount;
    }
    
    public void setTobeBought(boolean t){
        toBeBought = t;
    }

    public int getBarcode() {
        return barcode;
    }

    public String getName() {
        return name;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public double getPrice() {
        return price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
