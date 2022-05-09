/*8.	Create an array of int [1, 2, 3, 4, 5].
 * Use a Do while loop statement to print out each number in the array. 
 * Use a While loop and an int Counter to do this entire process 7 times.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int numbers[] = new int[] {1,2,3,4,5};
		
		int counter = 0;
		int index = 0;

		while(counter < numbers.length) {	
			do {
				System.out.print(numbers[counter]);
				index++;
			} while (index < 7);
			System.out.println();
		counter++;
		//refresh index after 7th interation
		index = 0;
		}
	}
}
