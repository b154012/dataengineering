/*7.Create an array of int [1, 2, 3, 4, 5].
 * Use For loop statement to print out each number in the array.
 * Use a For loop statement to do this entire process 7 times.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int numbers[] = new int[] {1,2,3,4,5};
		
		for(int i = 0; i < numbers.length; i++) {
			for(int j = 0; j < 7; j++) {
				System.out.print(numbers[i]);
			}
			System.out.println();
		}		
	}
}
