/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4;

/**
 *
 * @author N
 */
public class FoodItem extends FoodComponent{
    private String name = "";
    private Double p;
    private String out = "";
    
    public FoodItem(String name, double price){
        this.name = name;
        this.p = price;
    }
    
    @Override
    public double getPrice(){
        return p;
    }
    
    @Override
    public void print(int level){
        for (int i = 0; i < level; i++){
            System.out.print("     ");
        }
        System.out.println(this);
    }
    
    @Override
    public String toString()
    {
        out += "Food Item: " + name + ", $" + p;
        return out;
    }
}
