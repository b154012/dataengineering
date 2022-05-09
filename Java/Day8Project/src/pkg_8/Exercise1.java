/*1.Write a program to generate 100 numbers randomly and output the first repeated element.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-12
 */

package pkg_8;

import java.util.*;

public class Exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//create Random object to generate numbers randomly
		Random random = new Random();
		
		//create ArrayList object of type Integer
		ArrayList<Integer> array = new ArrayList<Integer>();
		
		//generate 100 random numbers
		for(int i = 0; i < 100; i++) {
			array.add(random.nextInt(10) + 1);
		}
		
		//print 100 random numbers
		for(Integer x : array) {
			System.out.print(x + " ");
		}
		
		int size = array.size();
		
		// index of first repeating element
        int index = -1;
 
        //create an empty hashset of type Interger to avoid duplicate values
        HashSet<Integer> randSet = new HashSet<Integer>();
        
        //start from the last index 
        for (int i = size-1; i >= 0; i--) {
            // check if element is in set
            if (randSet.contains(array.get(i))) {
            	//then update index
                index = i;
            }
            else {
            	//add value if not in set
                randSet.add(array.get(i));
            }
        }
        
        // check and display the result
        if (index != -1) {
        	System.out.println("\nThe first repeating element is " + array.get(index) + ".");
        }
        else {
        	System.out.println("\nThere are no repeating elements.");
	    }
        
    }
}
