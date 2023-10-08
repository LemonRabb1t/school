/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coe528lab1;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author N
 */
public class FlightTest {
    Flight instance = new Flight(1, 2, 3.0, "o", "des", "dep") ;

    public FlightTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }
    
    /** test constructor
     * 
     */
    @Test
    public void testConstructor(){
        Flight i = new Flight(2, 2, 2.0, "2", "3", "2") ;
        assertEquals(2, i.getflightNum());
    }
    
    /** test constructor (invalid prompts)
     * 
     */
    @Test(expected = IllegalArgumentException.class)
    public void testInvalidConstructor(){
        instance = new Flight(2, 2, 2.0, "2", "2", "2") ;
    }
    
    /**
     * Test of bookASeat method, of class Flight.
     */
    @Test
    public void testBookASeat() {
        System.out.println("bookASeat");
        int expResult = 1;
        instance.bookASeat();
        int result = instance.getSeatsLeft();
        assertEquals(expResult, result);
    }

    /**
     * Test of getflightNum method, of class Flight.
     */
    @Test
    public void testGetflightNum() {
        System.out.println("getflightNum");
        int expResult = 1;
        int result = instance.getflightNum();
        assertEquals(expResult, result);
    }

    /**
     * Test of setflightNum method, of class Flight.
     */
    @Test
    public void testSetflightNum() {
        System.out.println("setflightNum");
        int a = 0;
        instance.setflightNum(a);
    }

    /**
     * Test of getcap method, of class Flight.
     */
    @Test
    public void testGetcap() {
        System.out.println("getcap");
        int expResult = 2;
        int result = instance.getcap();
        assertEquals(expResult, result);
    }

    /**
     * Test of setcap method, of class Flight.
     */
    @Test
    public void testSetcap() {
        System.out.println("setcap");
        int a = 0;
        instance.setcap(a);
    }

    /**
     * Test of getSeatsLeft method, of class Flight.
     */
    @Test
    public void testGetSeatsLeft() {
        System.out.println("getSeatsLeft");
        int expResult = 2;
        int result = instance.getSeatsLeft();
        assertEquals(expResult, result);
    }

    /**
     * Test of setSeatsLeft method, of class Flight.
     */
    @Test
    public void testSetSeatsLeft() {
        System.out.println("setSeatsLeft");
        int a = 0;
        instance.setSeatsLeft(a);
    }

    /**
     * Test of getogPrice method, of class Flight.
     */
    @Test
    public void testGetogPrice() {
        System.out.println("getogPrice");
        double expResult = 3.0;
        double result = instance.getogPrice();
        assertEquals(expResult, result, 0.0);
    }

    /**
     * Test of setogPrice method, of class Flight.
     */
    @Test
    public void testSetogPrice() {
        System.out.println("setogPrice");
        double a = 0.0;
        instance.setogPrice(a);
    }

    /**
     * Test of getorigin method, of class Flight.
     */
    @Test
    public void testGetorigin() {
        System.out.println("getorigin");
        String expResult = "o";
        String result = instance.getorigin();
        assertEquals(expResult, result);
    }

    /**
     * Test of setorigin method, of class Flight.
     */
    @Test
    public void testSetorigin() {
        System.out.println("setorigin");
        String a = "";
        instance.setorigin(a);
    }

    /**
     * Test of getdesti method, of class Flight.
     */
    @Test
    public void testGetdesti() {
        System.out.println("getdesti");
        String expResult = "des";
        String result = instance.getdesti();
        assertEquals(expResult, result);
    }

    /**
     * Test of setdesti method, of class Flight.
     */
    @Test
    public void testSetdesti() {
        System.out.println("setdesti");
        String a = "";
        instance.setdesti(a);
    }

    /**
     * Test of getdepart method, of class Flight.
     */
    @Test
    public void testGetdepart() {
        System.out.println("getdepart");
        String expResult = "dep";
        String result = instance.getdepart();
        assertEquals(expResult, result);
    }

    /**
     * Test of setdepart method, of class Flight.
     */
    @Test
    public void testSetdepart() {
        System.out.println("setdepart");
        String a = "";
        instance.setdepart(a);
    }

    /**
     * Test of toString method, of class Flight.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        String expResult = "Flight #: 1\nSeats left: 2/2\nOrigin: o\nDestination: des\nDeparting: dep\nCost: $3.0";
        String result = instance.toString();
        assertEquals(expResult, result);
    }
    
}

   