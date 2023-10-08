/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coe528lab1;

/**
 *
 * @author N
 */
public class Flight {

    private int flightNum, cap, numOfSeatsLeft;
    private double ogPrice;
    private String origin, desti, depart;

    // constructor
    Flight(int fn, int c, double ogP, String o, String des, String dep) {
        if (o.compareToIgnoreCase(des) == 0) {
            throw new IllegalArgumentException("Origin and destination can't be same");
        } else {
            setflightNum(fn);
            setcap(c);
            setSeatsLeft(c);
            setogPrice(ogP);
            setorigin (o);
            setdesti(des);
            setdepart(dep);
        }
    } 
    
    // book a seat
    boolean bookASeat(){
        if (numOfSeatsLeft > 0){
            numOfSeatsLeft -= 1;
            return true;
        } else {
            return false;
        }
    }
    
    // gets and sets
    public int getflightNum(){     // flight num
        return flightNum;
    }
    public void setflightNum(int a){
        flightNum =a;
    }
    
    public int getcap(){            // cap
        return cap;
    }
    public void setcap(int a){
        cap =a;
    }
    
    public int getSeatsLeft(){      // seats left
        return numOfSeatsLeft;
    }
    public void setSeatsLeft(int a){
        numOfSeatsLeft =a;
    }
    
    public double getogPrice(){     // og Price
        return ogPrice;
    }
    public void setogPrice(double a){
        ogPrice =a;
    }
    
    public String getorigin(){            // origin
        return origin;
    }
    public void setorigin(String a){
        origin =a;
    }
    
    public String getdesti(){      // desti
        return desti;
    }
    public void setdesti(String a){
        desti =a;
    }
    
    public String getdepart(){      // depart time
        return depart;
    }
    public void setdepart(String a){
        depart =a;
    }
    
    // toString()
    @Override 
    public String toString(){
        return "Flight #: "+getflightNum()+"\nSeats left: "+getSeatsLeft()+"/"+getcap()+"\nOrigin: "+getorigin()+"\nDestination: "+getdesti()+"\nDeparting: "+getdepart()+"\nCost: $"+getogPrice();
    }
}
