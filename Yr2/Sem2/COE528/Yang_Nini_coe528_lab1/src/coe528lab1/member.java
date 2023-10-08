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
class member extends passenger{
    int yrsofMember;
    
    public member(String n, int a, int yr) {
        super(n, a);
        yrsofMember=yr;
    }
    
    // discount
    @Override
    public double applyDiscount(double p) {
        if (yrsofMember>5){
            return (p*0.5);
        } else if (yrsofMember<5){
            return (p*0.9);
        } else {
            return p;
        }
    }

    
    
}
