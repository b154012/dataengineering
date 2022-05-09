/*3. Write a program to flip the alphabetic order of each word in the following text: "To be or not to be" will become "oT eb ro ton ot eb”.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-09
 */

package pkg_6;

import java.util.Scanner;

public class Exercise3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		System.out.print("Write your text: ");
		
		String str = input.nextLine(); //"To be or not to be";
		
		System.out.print("Original text:\t" + str);
		
		int size = str.length();
		String temp = "";
		
		//reverse string
		for(int i = 0; i <= size-1; i++) {
			temp = str.charAt(i) + temp;
		}
		
		//remove space and keep each word in an array
		String[] arr = temp.split(" ");
		int n = arr.length;		
		
		//create another array to store and output an array of words in flip order
		String arr2[] = new String[n];
		
		int j = n;
		
		System.out.print("\nFlip:\t");
        for (int i = 0; i < n; i++) {
            arr2[j - 1] = arr[i];
            j--;
        }
 
        for(String x : arr2) {
			System.out.print(x + " ");
		}
	}

}
