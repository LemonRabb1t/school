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
abstract class passenger {
    String name;
    int age;
    
    public passenger (String n, int a){
        setName(n);
        setAge(a);
    }
    
    // get and set
    public String getName(){
        return name;
    }
    public void setName(String n){
        name = n;
    }
    
    public int getAge(){
        return age;
    }
    public void setAge(int a){
        age = a;
    }
    
    // discount
    public abstract double applyDiscount(double p);
    
}
