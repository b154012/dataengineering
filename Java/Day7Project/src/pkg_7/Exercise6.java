/*6. Use a large set to store 20 random numbers, and then filter the even number elements into a small set.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-11
 */

package pkg_7;

import java.util.*;

public class Exercise6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int n = 20;
		
		Random random = new Random();
		ArrayList<Integer> randomNumber = new ArrayList<Integer>();
		
		for(int i = 0; i < n; i++) {
			randomNumber.add(random.nextInt(100) + 1);
		}
		
		//create an array list to store small set of even numbers
		ArrayList<Integer> smallSet = new ArrayList<Integer>();
		
		//create iterator object to iterate list
		Iterator<Integer> itr = randomNumber.iterator();
		
		//add even numbers into smallList
		while(itr.hasNext()) {
			int i = itr.next();
			if(i % 2 == 0) {
				smallSet.add(i);
			}
		}
		
		System.out.println(smallSet);
	}

}
