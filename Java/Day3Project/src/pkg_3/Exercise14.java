/*14. There are two arrays: Array A: “1, 7, 9, 11, 13, 15, 17, 19” and Array B: “2, 4, 6, 8, 10”.
 * Combine the two arrays into Array C and arrange in ascending order
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int arrayA[] = new int[] {1, 7, 9, 11, 13, 15, 17, 19};
		int arrayB[] = new int[] {2, 4, 6, 8, 10};
		
		//add the length of array A and array B and put it for length C
		int totalLength = arrayA.length + arrayB.length;
		
		//create array C
		int arrayC[] = new int[totalLength];
		
		//introducing iteration variables
		// i for array A, j for array B, k for Array k
		int i = 0, j = 0, k = 0;
		
		//eg. if 1 > 2, then arrayC at position 0 will have value of array A at position 0
		while (i < arrayA.length && j < arrayB.length) {
			if (arrayA[i] < arrayB[i]) {
				arrayC[k++] = arrayA[i++];
			} else {
				arrayC[k++] = arrayB[j++];
			}
		}
		
		//in some instances, the above while loop returns false, then use individual loop
		while(i < arrayA.length) {
			arrayC[k++] = arrayA[i++];
		}
		
		while (j < arrayB.length) {
			arrayC[k++] = arrayB[j++];
		}
		
		for(int x : arrayC) {
			System.out.print(x + " ");
		}
	}
}