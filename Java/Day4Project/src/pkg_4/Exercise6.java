/*1. Create a Circle Class
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_4;

import java.util.Scanner;

public class Exercise6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("Enter your radius: ");
		double r = input.nextDouble();
		input.close();

		Circle circ = new Circle((float)(r));
		circ.show();
	}
}