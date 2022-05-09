/*3. Generate a random number between 0 and 100, until 88, stop the loop!
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int min = 0;
		int max = 100;
		int counter = 0;
		double randomNumber;	
		
		while(counter != 88) {
			randomNumber = Math.random()*(max-min+1)+min;
			System.out.println(Math.round(randomNumber));
			counter++;
		}
	}
}
