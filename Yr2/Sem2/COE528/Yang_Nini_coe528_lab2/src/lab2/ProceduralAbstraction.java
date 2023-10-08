/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab2;

/**
 *
 * @author N
 */
public class ProceduralAbstraction {
//Requires: None
//Modifies: None
//Effects: Returns the smallest positive integer n for which n!
// (i.e. 1*2*3*...*n) is greater than or equal to x, for positive
// integer x. Otherwise returns 1

    static int count = 1;

    public static int reverseFactorial(int x) {
        if (x <= 1) {
            int num = count;
            count = 1;
            return num;
        }
        count++;
        return reverseFactorial(x / count);
    }

    //Requires: None
//Modifies: None
//Effects: If the matrix arr satisfies Nice property, prints the sum and
// returns true. Otherwise returns false.
    public static boolean isMatrixNice(int[][] arr) {
        int sumrow = 0;
        int sumcol = 0;
        int sumDia1 = 0;
        int sumDia2 = 0;
        int rows = arr[0].length;
        int col = arr.length;
        int temp = 0;
        try {
        if (rows == col) {
            for (int i = 0; i < rows; i++){
                sumrow = 0;
                for (int j = 0; j < col; j++){
                    sumrow += arr[i][j];
                }
                if(i == 0){
                    temp = sumrow;
                }else{
                    if(sumrow != temp){
                        return false;
                    }
                }
            }

               for (int i = 0; i < col; i++){
                sumcol = 0;
                for (int j = 0; j < rows; j++){
                    sumcol += arr[j][i];
                }
                if(i == 0){
                    temp = sumrow;
                }else{
                    if(sumrow != temp){
                        return false;
                    }
                }
            }
            

            for (int i = 0; i < arr.length; i++) {
                sumDia1 += arr[i][i];
                sumDia2 += arr[i][arr.length - (i + 1)];
            }
        }
        if (sumrow == sumcol && sumrow == sumDia1 && sumrow == sumDia2) {
            System.out.println("Sum of rows: " + arr[0][0] + "\nSum of cols: " + arr[0][1] + "\nSum of diag: " + arr[0][2] + "\n{" + arr[1][0] + ", " + arr[1][1] + ", " + arr[1][2] + "}, {" + arr[2][0] + ", " + arr[2][1] + ", " + arr[2][2] + "} is " + sumrow);
            return true;
        } else {
            return false;
        }
        } catch (Exception e){
            System.out.println("Invalid input\nerror: "+e);
            return false;
        }
    }

   
    public static String print(int [][] array) {
        String a = "";
        for (int[] x : array) {
            for (int y : x) {
                a+= y + " ";
            }
            a+="\n";
        }
        return a;
    }

    public static void main(String[] args) {
        int[][] test1 = {{3, 2, 1}, {6, 5, 5}, {9, 8, 7}};
        int[][] test2 = {{99, 48, 69}, {-57, -31, 45}, {-37, -19, 10}};
        int[][] test3 = {{1, 2,3}, {1, 2}};
        int a = 33;
        int b = 88;

        System.out.println("The reverseFactorial of " + a + " is: " + reverseFactorial(a));
        System.out.println("The reverseFactorial of " + b + " is: " + reverseFactorial(b));
        System.out.println("Is matrix:\n"+print(test1)+ "nice? " + isMatrixNice(test1));
        System.out.println("Is matrix:\n"+print(test2)+ "nice? " + isMatrixNice(test2));
        System.out.println("Is matrix:\n"+print(test3)+ "nice? " + isMatrixNice(test3));
    }
}
