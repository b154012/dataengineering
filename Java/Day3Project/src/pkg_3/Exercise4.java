/*4. Output a list of numbers between 100 and 150 which are not divisible by 3.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 **/

package pkg_3;

public class Exercise4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int min = 100;
		int max = 150;
		
		while (min < max) {
			if (min % 3 == 0) {
				System.out.println(min);
			}
			min++;
		}
	}
}
