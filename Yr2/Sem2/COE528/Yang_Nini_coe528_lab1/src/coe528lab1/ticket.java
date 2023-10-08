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
public class ticket {
    private passenger p;
    private Flight flight;
    private double price;
    private static int ticketNum=0;
    
    ticket (passenger pass, Flight f, double p){
        ticketNum++;
        setPass(pass);
        setFlight(f);
        setPrice(p);
    }
    
    // get & set
    public passenger getPass(){
        return p;
    }
    public void setPass(passenger g){
        p = g;
    }
    
    public Flight getFlight(){
        return flight;
    }
    public void setFlight(Flight h){
        flight = h;
    }
    
    public double getPrice(){
        return price;
    }
    public void setPrice(double p){
        price = p;
    }
    
    public int getticketNum(){
        return ticketNum;
    }
    
    @Override
    public String toString(){
        return getPass()+", "+getFlight()+", $"+ getPrice();
    }
    
}
