/*2. Write a program to output the penultimate day of the next month.
 * 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-11
 */

package pkg_7;

import java.time.LocalDate;

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		LocalDate d = LocalDate.now().plusMonths(1);
		
		System.out.println("Today is " + LocalDate.now() + ". Next month is " + d + ".");
		System.out.println("The day of the next month: " + d.getDayOfMonth() + ".");
		System.out.println("The penultimate day of the next month: " + (d.getDayOfMonth()-1) + ".");
	}

}
