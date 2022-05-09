/*Output a list of all numbers between 1 to 1000 which are divisible by 5. Each output line must only contain 3 numbers. 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-03 
 */

package pkg_2;

public class Exercise10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int i;
		int counter = 0;
		
		for (i = 1; i <= 1000; i++) {
			
			if (counter == 3) {
				break;
			}
			
			if (i % 5 == 0) {
				System.out.println(i);
				counter += 1;
		   }
	    }
   }
}