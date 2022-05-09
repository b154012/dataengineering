/*Write a program, use an If…else statement to determine whether a year is a leap year. 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-03 
 */

package pkg_2;

import java.util.Scanner;

public class Exercise3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int year;
		Scanner input = new Scanner(System.in);
		System.out.print("Enter a year (eg. XXXX): ");
		year = input.nextInt();
		input.close();
		
		/*method to determine whether a leap year or not
		 * 1. if year % 4 == 0, go to step 2. Else, go to step 5
		 * 2. if year % 100 == 0, go to step 3. Else, go to step 4.
		 * 3. if year % 400 == 0, go to step 4. Else, go to step 5.
		 * 4. The year is LEAP.
		 * 5. The year is NOT leap.
		 * */
		
		if (year % 4 == 0) {
			if (year % 100 == 0) {
				if (year % 400 == 0) {
					System.out.println(year + " is a leap year.");
				} else {
					System.out.println(year + " is NOT a leap year.");
				}
			} else {
				System.out.println(year + " is a leap year.");
			}
		} else {
			System.out.println(year + " is NOT a leap year.");
		}
	}
}