/*4. Variables a and b are integers. 
 * Without passing the third variable, write a program to exchange the values of a and b variables.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-24
 * */

package evyd;

public class Exercise4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int a = 1;
		int b = 2;
		
		System.out.println("Original a: " + a);
		System.out.println("Original b: " + b);
		
		//a = 3
		a = a + b;
		// b = 2
		b = a - b;
		// a = 1
		a = a - b;
		
		System.out.println("\nValue of A after exchanging its value with b: " + a);
		System.out.println("Values of B after exchanging its value with a: " + b);
	}

}
