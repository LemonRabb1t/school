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
public abstract class FoodComponent {
    public FoodComponent(){}
    
    abstract double getPrice();
    
    abstract void print(int lvl);
}
