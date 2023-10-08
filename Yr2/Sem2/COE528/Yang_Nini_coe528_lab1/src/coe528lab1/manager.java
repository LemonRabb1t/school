/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coe528lab1;

import java.util.Scanner;

/**
 *
 * @author N
 */
public class manager {

    private static ticket tickets[] = new ticket[9999];
    private static Flight flights[] = new Flight[9999];
    private static int flightnum = 0;
    static Scanner scan = new Scanner(System.in);  // scan obj

    public static void createFlights() {
        try {
            // obtain info
            System.out.println("Please enter a flight number: ");
            int fn = Integer.parseInt(scan.nextLine());

            System.out.println("Please enter capacity: ");
            int c = Integer.parseInt(scan.nextLine());

            System.out.println("Please enter a original price (x.xx): ");
            double ogP = Double.parseDouble(scan.nextLine());

            System.out.println("Please enter the flight origin: ");
            String o = scan.nextLine();

            System.out.println("Please enter the flight destination: ");
            String des = scan.nextLine();
            
            System.out.println("Please enter flight departure date (dd/mm/yyyy): ");
            String dep = scan.nextLine();

            System.out.println("Please enter flight departure time (hh:mm): ");
            dep += " " + scan.nextLine();

            if (getFlight(fn) == null) {
                // create new flight
                Flight n = new Flight(fn, c, ogP, o, des, dep);
                System.out.println("\nA flight has been created\n" + n.toString());
                // put flight into flight array and keep count
                flights[flightnum] = n;
                flightnum++;
            } else {
                System.out.println("\nFlight with duplicate flight number exists");
            }

        } catch (Exception e) {
            System.out.println("Error, flight was not added:" + e);
        }

    }

    public static void displayAvailFlights(String o, String t) {
        for (int i = 0; i < flightnum; i++) {
            Flight f = flights[i];
            // if flight path is same, print
            if (f.getorigin().equalsIgnoreCase(o) == true && f.getdesti().equalsIgnoreCase(t) == true && f.getSeatsLeft() > 0) {
                System.out.println(f.toString());
            } else if (f == null) {
                break;
            }
        }
    }

    public static Flight getFlight(int fn) {
        for (int i = 0; i < flightnum; i++) {
            Flight f = flights[i];
            // if flight num is same, print
            if (f.getflightNum() == fn) {
                return f;
            }
        }
        System.out.println("No flight with that flight num");
        return null;
    }

    public static void bookSeat(int fn, passenger p) {
        if (getFlight(fn).bookASeat() == true) {
            // success
            System.out.println("Booking successful");

            System.out.println("\nDiscount applied to: " + getFlight(fn).getogPrice());
            // set price as discounted
            getFlight(fn).setogPrice(Math.round(p.applyDiscount(getFlight(fn).getogPrice()) * 100.0) / 100.0);

            //display
            System.out.println("Final Price: " + getFlight(fn).getogPrice() + "\n" + p.getName() + " age " + p.getAge() + " is booked into:\n\n" + getFlight(fn).toString());

        } else {
            // no success
            System.out.println("Booking unsuccessful");
        }
    } // book seat

    public static void main(String[] args) {
        String in = "";
        String[] availFlight = new String[4];

        while (in.equalsIgnoreCase("exit") == false || in.equalsIgnoreCase("e") == false) {
            System.out.println("\nA. Create flight\nB. Available Flights\nC. Get flight\nD. Book a Seat\nE. Exit");
            in = scan.nextLine();
            if (in.equalsIgnoreCase("a") || in.equalsIgnoreCase("create flight")) {
                createFlights();
            } else if (in.equalsIgnoreCase("b") || in.equalsIgnoreCase("available flights")) {
                try {
                    System.out.println("Origin and destination required:");
                    availFlight[0] = scan.nextLine();
                    availFlight[1] = scan.nextLine();

                    displayAvailFlights(availFlight[0], availFlight[1]);
                } catch (Exception e) {
                    System.out.println("error: " + e);
                }
            } else if (in.equalsIgnoreCase("c") || in.equalsIgnoreCase("get flight")) {
                try {
                    System.out.println("Enter flight number: ");
                    availFlight[0] = scan.nextLine();

                    System.out.println(getFlight(Integer.parseInt(availFlight[0])).toString());

                } catch (Exception e) {
                    System.out.println("Error, flight not found " + e);
                }

            } else if (in.equalsIgnoreCase("d") || in.equalsIgnoreCase("book a seat")) {
                try {
                    // obtain flight num, pass name & age
                    System.out.println("Enter a flight number: ");
                    availFlight[0] = scan.nextLine();
                    availFlight[1] = "f";

                    for (int i = 0; i < flightnum; i++) {
                        Flight f = flights[i];
                        if (Integer.parseInt(availFlight[0]) == f.getflightNum()) {
                            availFlight[1] = "t";
                        }
                    }

                    if (availFlight[1].equals("t")) {

                        System.out.println("Enter passenger name: ");
                        availFlight[1] = scan.nextLine();

                        System.out.println("Enter passenger age: ");
                        availFlight[2] = scan.nextLine();

                        System.out.println("Enter years of membership: ");
                        availFlight[3] = scan.nextLine();

                        // create passenger
                        passenger p = null;

                        // member
                        if (Integer.parseInt(availFlight[3]) > 0) {
                            p = new member(availFlight[1], Integer.parseInt(availFlight[2]),
                                    Integer.parseInt(availFlight[2]));
                        } // non member
                        else if (Integer.parseInt(availFlight[3]) == 0) {
                            p = new nonmember(availFlight[1], Integer.parseInt(availFlight[2]));
                        } else {
                            System.out.println("Error in input");
                        }

                        // book seat
                        bookSeat(Integer.parseInt(availFlight[0]), p);
                    } else {
                        System.out.println("no flight found");
                    }

                } catch (Exception e) {
                    System.out.println("no flight booked: " + e);
                }
            } else if (in.equalsIgnoreCase("exit") == true || in.equalsIgnoreCase("e") == true) {
                System.out.println("Bye bye");
                break;
            } else {
                System.out.println("Invalid input. Try again");
            }

        } // while

    }
}
