/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4;
import java.util.*;
/**
 *
 * @author N
 */
public class FoodCategory extends FoodComponent{
    private Vector<FoodComponent> FoodCategory;
    public String Category;
    public String out = "";
    
    public FoodCategory(String c){
        this.Category = c;
        this.FoodCategory = new Vector();
    }
    
    public void add(FoodComponent c){
        FoodCategory.add(c);
    }
    
    public void remove(FoodComponent c){
        if(FoodCategory.size() > 0){
            FoodCategory.remove(c);
        } else {
            System.out.println("Unable to remove");
        }
    }
    
    @Override
    public double getPrice(){
        double p = 0.0;
        for(int i = 0; i < FoodCategory.size();i++){
            p += FoodCategory.get(i).getPrice();
        }
        return p;
    }
    
    @Override
    public void print(int lvl){
        for(int i = 0; i < lvl; i++){
            System.out.print("     ");
        }
        System.out.println(this);
        for (int j =0; j<FoodCategory.size(); j++){
            FoodCategory.get(j).print(lvl+1);
        }
    }
    
    @Override
    public String toString(){
        out += "FoodCategory (" + Category + ", Cost: $" + this.getPrice() + ") contains:";
        return out;
    }
    
}
