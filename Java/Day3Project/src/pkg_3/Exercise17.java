/*17.Define an integer array and output the odd and even numbers.
 * 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise17 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int numbers[] = new int[] {1,2,3,4,5,6,7,8,9,10,11,15,29,45,50,52,58,59};

		for(int arr : numbers) {
			System.out.print(arr + "\t");
		}
		System.out.println("\nEven numbers: ");
		for(int i = 0; i < numbers.length; i++) {
			if(numbers[i] % 2 == 0) {
				System.out.print(numbers[i] + "\t");
			}
		}
		
		System.out.println("\nOdd numbers: ");
		for(int i = 0; i < numbers.length; i++) {
			if(numbers[i] % 2 != 0) {
				System.out.print(numbers[i] + "\t");
			}
		}
	}
}