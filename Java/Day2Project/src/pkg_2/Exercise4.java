/*
 * Using If…else statement, input three integers and output in ascending order. For example, input 5,7,2 and output 2,5,7. 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-03 
 */

package pkg_2;

import java.util.Scanner;

public class Exercise4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			
		Scanner input = new Scanner(System.in);
		
		System.out.print("Enter number 1: ");
		int a = input.nextInt();
		
		System.out.print("Enter number 2: ");
		int b = input.nextInt();
		
		System.out.print("Enter number 3: ");
		int c = input.nextInt();
		
		input.close();
		
		//if 752 or 725
		if (a > b && a > c) {
			if (b > c) {
				System.out.println(c + "," + b + "," + a);
			} else {
				System.out.println(b + "," + c + "," + a);
			}
		//if 572, 752
		} else if (b > a && b > c) {
			if (a > c) {
				System.out.println(c + "," + a + "," + b);
			} else {
				System.out.println(a + "," + c + "," + b);
			}
		//if 527, 257
		} else if (c > b && c > a) {
			if (a > b) {
				System.out.println(b + "," + a + "," + c);
			} else {
				System.out.println(a + "," + b + "," + c);	
			}
		}
	}
}