/*15.Define an integer array, and then calculate the sum, the maximum and the minimum values of the array elements. Output the result.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise15 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int values[] = new int[] {10,5,4,8,9,3,11,-11,2};
		
		//calculate the sum
		int total = 0;
		
		for(int i = 0; i < values.length; i++) {
			total += values[i];
		}
		
		System.out.println("The sum is " + total + ".");
		
		//calculate the maximum and minimum values of the array elements
		
		int max = values[0];
		int min = values[0];
		int indexMin = 0;
		int indexMax = 0;
		
		//find min
		for(int i = 0; i < values.length; i++) {
			if (values[i] < min) {
				min = values[i];
				indexMin = i;
			}
		}
		
		//find max
		for(int i = 0; i < values.length; i++) {
			if (values[i] > max) {
				max = values[i];
				indexMax = i;
			}
		}
		
		System.out.print("The maximum value is " + max + " at index " + indexMax + "\nThe minimum value is " + min + " at index " + indexMin + ".");
	}
}
