/*
 * Write a program that sets an int variable x equalling to 20. 
 * Then, write a For…loop statement that prints a descending number series from x and 1, i.e. x, x-1, x-2 … 1. 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-03 
 */

package pkg_2;

public class Exercise6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int x = 10;
		int i;
		
		for (i = x; i > 0; i--) {
			
			if (i == 1) {
				System.out.print(i + ". ");
				continue;
			}
			
			System.out.print(i + ", ");
		}
	}
}
