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
 class nonmember extends passenger{

    public nonmember(String n, int a) {
        super(n, a);
    }

    @Override
    public double applyDiscount(double p) {
        if (this.age>65){
            return (p*0.9);
        } else
            return p;
    }
    
}
