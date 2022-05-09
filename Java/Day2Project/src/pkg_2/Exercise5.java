/*
 * Write a program that sets an int variable x equalling to 10. 
 * Then, write a For…loop statement that prints an ascending number series from 1 to x, i.e. 1, 2, 3 … x. 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-03 
 */

package pkg_2;

public class Exercise5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int x = 10;
		int i;
		
		for (i = 1; i < x+1; i++) {
			
			if (i == 10) {
				System.out.print(i + ". ");
				continue;
			}
			
			System.out.print(i + ", ");
		}
	}
}
