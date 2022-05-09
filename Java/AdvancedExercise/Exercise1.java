/* 1.Write a program to encrypt letters:
 * a.	First, output the original letters, such as ABC.
 * b.	Encrypt the above series of original letters into the next five characters in the alphabet. 
 * For example, if the original letter is ABC, FGH is output.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-24
 * */

package evyd;

import java.util.Scanner;

public class Exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		System.out.print("Enter your letters eg, CDE: ");
		String letters = input.nextLine();
		
		char ch1 = letters.charAt(0);
		char ch2 = letters.charAt(1);
		char ch3 = letters.charAt(2);
		
		for (int i = 0; i < 5; i++) {
			ch1++;
			ch2++;
			ch3++;
		}
		
		System.out.println(ch1 + "" + ch2 + "" + ch3);
		input.close();
	}

}
