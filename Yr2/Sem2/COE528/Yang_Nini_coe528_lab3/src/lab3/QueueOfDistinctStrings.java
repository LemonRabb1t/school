/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab3;

/**
 *
 * @author N
 */
import java.util.ArrayList;

public class QueueOfDistinctStrings {
// Overview: QueueOfDistinctStrings are mutable, bounded
// collection of distinct strings that operate in
// FIFO (First-In-First-Out) order.
//
// The abstraction function is:
// a) Write the abstraction function here
//
// abstractFunc(a) = abstract queue of x    a is QueueOfDistinctStrings obj
// x.first = a.items.get(0)                 first = first obj in queue
// x.last = a.items.get(items.size()-1)     last = last obj in queue
// x.col = c.items                          create string queue              
//
// The rep invariant is:
// b) Write the rep invariant here
//
// repInvar (a) :
//      false: if repitition detected
//      true : no repititions
//the rep

    private ArrayList<String> items;
// constructor

    public QueueOfDistinctStrings() {
// EFFECTS: Creates a new QueueOfDistinctStrings object
        items = new ArrayList<String>();
    }
// MODIFIES: this
// EFFECTS: Appends the element at the end of the queue
// if the element is not in the queue, otherwise
// does nothing.

    public void enqueue(String element) throws Exception {
        if (element == null) {
            throw new Exception();
        }
        if (false == items.contains(element)) {
            items.add(element);
        }
    }

    public String dequeue() throws Exception {
// MODIFIES: this
// EFFECTS: Removes an element from the front of the queue
        if (items.size() == 0) {
            throw new Exception();
        }
        return items.remove(0);
    }

    public boolean repOK() {
        // EFFECTS: Returns true if the rep invariant holds for this
// object; otherwise returns false
// c) Write the code for the repOK() here

        boolean hasRep = false;
        for (int a = 0; a < items.size(); a++) {
            for (int i = a+1; i < items.size(); i++) {
                if (items.get(a).equals(items.get(i))) {
                    hasRep = true;
                    break;
                }
            }
        }
        if (hasRep) { // if rep exist, false
            return false;
        } else { // if rep no exit, true
            return true;
        }
    }

    public String toString() {
// EFFECTS: Returns a string that contains the strings in the
// queue, the front element and the end element.
// Implements the abstraction function.
// d) Write the code for the toString() here
        String p = "";
        String first = items.get(0);
        String last = items.get(items.size() - 1);
        String col = items.toString();
        return "____________\nFirst: " + first + "\nLast: " + last + "\nCollection: " + col;

    }
    
    public static void main(String[] args) {
        QueueOfDistinctStrings q = new QueueOfDistinctStrings();
        try {
            q.enqueue("ab");
            q.enqueue("CD");
            q.enqueue("Ef");
        } catch (Exception e) {
            System.out.println("Failed to put into queue: "+e);
        }
        
        // test
        q.items.add("ae");
        q.items.add("eF");
        q.items.add("cd");
        
        if (q.repOK()){ // no dupe
            System.out.println("Valid queue of distinct string");
        }else{
            System.out.println("Invalid queue of distinct string");
        }
        System.out.println(q.toString());
        
        
    }    
}
