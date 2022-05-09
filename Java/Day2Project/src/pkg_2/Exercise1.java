/*Write a program that sets an int variable x equalling to 51. Then, write an If statement such that: 
*If x is greater than 50, the program prints “x is greater than 50” to the console. 
*If x is not greater than 50, it should print “x is smaller than 50” to the console.
*
* @author  Zulmi Yahya
* @version 1.0
* @since   2021-08-03 
*/

package pkg_2;

public class Exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int x = 50;
		
		if (x > 50) {
			System.out.println("x is greater than " + x + ".");
		} else {
			System.out.println("x is smaller than " + x + ".");
		}
	}

}
