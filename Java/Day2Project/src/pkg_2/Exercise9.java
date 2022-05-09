/*Calculate the sum of odd and even numbers within 100, and output. 
 * 
 * */

package pkg_2;

public class Exercise9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int sumOdd = 0;
		int sumEven = 0;
		int total = 0;
		int i;
		
		for (i = 0; i < 100; i++) {
			
			if (i % 2 == 0) {
				sumEven += i;
			} else {
				sumOdd += i;
			}
		}
		
		total = sumEven + sumOdd;
		
		System.out.println("The result of the sum of odd and even is " + total + ".");
	}
}
