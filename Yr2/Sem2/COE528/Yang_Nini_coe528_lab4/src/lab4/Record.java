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
import java.io.File;
import java.util.Scanner;
import java.io.FileWriter;
import java.io.IOException;

public class Record {
// Name of the associated file

    private String filename;
    static Record r= new Record("record.txt");

    public Record(String n) {
        filename = n;
    }
// Effects: Reads and prints the contents of the associated
// file to the standard output.

    public void read() {
        try {
            Scanner scan = new Scanner(new File(filename));
            while (scan.hasNextLine()) {
                System.out.println(scan.nextLine());
            }
            scan.close();
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }
// Effects: Appends the specified message, msg, to the
// associated file.

    public void write(String msg) {
        try {
            FileWriter writer = new FileWriter (filename, true);
            writer.write(msg);
            writer.close();
        } catch (IOException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        // Fill the blank below that obtains the sole instance
        // of the Record class.
        // (You should not invoke the Record constructor here.)

// Do not modify the code below
        r.write("Hello-1\n");
        r.write("Hello-2\n");
        System.out.println("Currently the file record.txt "
                + "contains the following lines:");
        r.read();
    }
}
