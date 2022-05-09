/*
 * Enter an integer between 0 and 1000 to find the sum of the digits. For example, inputting integers 2 and 3 will give an output value is 5. 
 * */

package pkg_2;

import java.util.Scanner;

public class Exercise7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int num1;
		int num2;
		
		@SuppressWarnings("resource")
		Scanner val = new Scanner(System.in);
		
		System.out.print("Enter first digit: ");
		num1 = val.nextInt();
		
		System.out.print("Enter second digit: ");
		num2 = val.nextInt();
		
        if (0 < num1 && num1 < 1000) {
        	if (0 < num2 && num2 < 1000) {
        		int result = num1 + num2;
        		System.out.println("The result is " + result + ".");
            //if either num2 is less than/= 0 OR more than to 1000, the system will be terminated..
        	} else {
        		System.out.println("Your number 2, which is " + num2 + ", should be between 1 and 999. Cannot add with " + num1);
        	}
        	//if either num1 is less than/= 0 OR more than to 1000, the system will be terminated.
		} else {
			System.out.println("Your number 1, which is " + num1 + ", should be between 1 and 999. Cannot add with " + num2);
		}
	}
}