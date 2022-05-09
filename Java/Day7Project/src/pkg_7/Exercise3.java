/*3. Calculate the number of days between any two dates.
 * The year, month and day are required to be passed to the program through the main method.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-11
 */

package pkg_7;

import java.time.LocalDate;
import java.time.Period;

public class Exercise3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		LocalDate day1 = LocalDate.of(2021, 3, 24);
		
		LocalDate day2 = LocalDate.of(2021, 7, 31);
		
		Period diff = Period.between(day1, day2);
		
		System.out.println("The number of days between two dates is " + diff.getDays() + ".");
	}

}
