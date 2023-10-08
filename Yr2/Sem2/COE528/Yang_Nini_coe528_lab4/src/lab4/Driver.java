/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4;
import java.util.*;
import java.io.*;
/**
 *
 * @author N
 */
public class Driver {
    public static void main(String[] args) {
        FoodComponent fi1 = new FoodItem("Blueberries", 2.5);
        FoodComponent fi2 = new FoodItem("Strawberries", 3.5);
        FoodComponent fi3 = new FoodItem("Egg", 4.5);
        FoodComponent fi4 = new FoodItem("Chicken", 5.0);
        FoodComponent fi5 = new FoodItem("Peas", 6.0);
        FoodComponent fi6 = new FoodItem("Ice Cream", 7.0);
        
        FoodComponent fc1 = new FoodCategory("Frozen");
        FoodComponent fc2 = new FoodCategory("Meat");
        FoodComponent fc3 = new FoodCategory("Vegetables");
        
        ((FoodCategory)fc1).add(fc2);
        ((FoodCategory)fc1).add(fc3);
        ((FoodCategory)fc1).add(fi6);
        
        ((FoodCategory)fc2).add(fi3);
        ((FoodCategory)fc2).add(fi4);
        
        ((FoodCategory)fc3).add(fi1);
        ((FoodCategory)fc3).add(fi2);
        ((FoodCategory)fc3).add(fi5);
        
        fc1.print(0);
    }
}
