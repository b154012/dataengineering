/*4.Generate 6 random integers between 1 and 44, add them to the list, and output them.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-11
 */

package pkg_7;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Exercise4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub	
		
		//create random object to generate random numbers
		Random random = new Random();
		
		//create a list to store random values
		List<Integer> randomNumbers = new ArrayList<Integer>();
		
		for(int i = 0; i < 6; i++) {
			randomNumbers.add(random.nextInt(44) + 1);
		}
		
	System.out.println("The 6 random numbers between 1 and 44 is " + randomNumbers + ".");
		
	}

}
