/*Write a program that sets an int variable x equalling to 20. Then, write a Switch 
 * statement such that:  
 * a. If x is 0, print “x is 0”.
 * b. If x is smaller than 50, print “x is smaller than 50”. 
 * c. If x is greater than 50, print “x is greater than 50”. 
 * 
 * @author  Zulmi Yahya
 *  @version 1.0
 *  @since   2021-08-03 
 */

package pkg_2;

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int x = 20;
		
		switch(x) {
		case 0:
			System.out.println("x is 0.");
			break;
		case 10:
			System.out.println("x is less than 50.");
			break;
		case 20:
			System.out.println("x is less than 50.");
			break;
		case 30:
			System.out.println("x is less than 50.");
			break;
		case 40:
			System.out.println("x is less than 50.");
			break;
		case 50:
			System.out.println("x is equal to 50.");
			break;
		case 60:
			System.out.println("x is greater than 50.");
			break;		
		}
	}
}