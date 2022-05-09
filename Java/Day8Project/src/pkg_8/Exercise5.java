/*/*5.The program receives multiple integers from user, the limitation of the input is initiated by user when the program is run.
 * The whole number of all input is printed in reverse order.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-12
 */

package pkg_8;

import java.util.*;

public class Exercise5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Scanner input = new Scanner(System.in);
		
		System.out.print("Enter the number of time the program runs: ");
		int n = input.nextInt();
		
		// create a  LinkedHashSet object which is of type Integer
		HashSet<Integer> integerVal = new LinkedHashSet<Integer>();
		
		// add integer elements to LinkedHashSet object as below
		while(n > 0) {
			System.out.print("Enter your integer: ");
			integerVal.add(input.nextInt());
			n--;
		}
		
		//Iterate using enhance for-loop to see the order
		System.out.println("Insertion order by using LinkedHashSet: ");
		for(Integer x : integerVal) {
			System.out.print(x + " ");
		}
		
		// convert LinkedHashSet by creating ArrayList and then reverse the array
		List<Integer> integerList = new ArrayList<Integer>(integerVal);
				
		// declare ListIterator of type integer and provide listIterator method the size of List
		ListIterator<Integer> itr = integerList.listIterator(integerList.size());
				
		//Then reverse the order using hasPrevious
		System.out.println("\nPrinted in reverse order: ");
		while (itr.hasPrevious()) {
		System.out.print(itr.previous() + " ");

		}
		input.close();
	}

}
