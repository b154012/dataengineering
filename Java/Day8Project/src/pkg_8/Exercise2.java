/*2. Write a program to randomly generate 100 numbers and remove the duplicate data.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-12
 */

package pkg_8;

import java.util.*;

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Random random = new Random();
		
		//create ArrayList object of type Integer
		List<Integer> randNumbers = new ArrayList<Integer>();
		
		// generate 100 random numbers
		for(int i = 0; i < 100; i++) {
			randNumbers.add(random.nextInt(100) + 1);
		}
		
		//Display duplicate values
		System.out.println("Before removing duplicates: ");
		for(Integer x : randNumbers) {
			System.out.print(x + " ");
		}
		
		System.out.println("\nThe size of original array is " + randNumbers.size());
		
		//create an empty hashset of type Integer as below
		HashSet<Integer> set = new HashSet<Integer>();
		
		//remove duplicate data by converting list to set
		set.addAll(randNumbers);
		
		// add interator object to iterate set
		Iterator<Integer> itr = set.iterator();
		
		System.out.println("\nAfter removing duplicates:");
		
		while(itr.hasNext()) {
			System.out.print(itr.next() + " ");
		}
		
		System.out.println("\nThe size of array without duplicates is " + set.size());
	}

}
