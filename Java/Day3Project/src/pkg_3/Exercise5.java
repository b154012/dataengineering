/*5.Write a program to perform the following calculation: ∑1+∑2+……+∑100.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n = 1;
		int total = 0;
		
		while (n <= 100) {
			total += n;
			n++;
		}	
	System.out.println(total);
	}
}