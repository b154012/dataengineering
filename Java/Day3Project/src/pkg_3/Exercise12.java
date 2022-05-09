/*12. Write a program to find the index of the smallest element in the integer array.
 * If the number of such element is greater than 10, return the index of the number with the highest element value.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

//import java.util.Scanner;

public class Exercise12 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*Scanner input = new Scanner(System.in);
		
		int values[] = new int[10];
		int n = 0;
		
		
		for(int i = 0; i < values.length; i++) {
			n = i + 1;
			System.out.print("Enter " + n + " value: ");
			values[i] = input.nextInt();
		}*/
		
		int values[] = new int[] {20,51,40,18,19,30,15,1,21};
		
		System.out.println("Original Array:");
		for(int x : values) {
			System.out.print(x + "\t");
		}
		
		System.out.println();
		
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
		
		//if min is more than 10
		if(min > 10) {
			//find max
			for(int i = 0; i < values.length; i++) {
				if (values[i] > max) {
						max = values[i];
						indexMax = i;
				}
			}
			System.out.println("The minimum value, " + min + ", is more than 10 at index " + indexMin + ".");
			System.out.println("Therefore the max value, " + max + ", is at index " + indexMax + ".");
		} else {
			System.out.println("The minimum value, " + min + ", is at index " + indexMin + ".");
		}
	}
}