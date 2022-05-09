/*4. Define an array of non-empty integers. Each element appears twice except one. Output the element that appears only once.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-12
 */

package pkg_8;

import java.util.*;

public class Exercise4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		int numbers[] = {1,1,2,2,3,4,4,5,5};
		
		//METHOD1
		
		//store all duplicate values
		HashSet<Integer> temp = new HashSet<Integer>();
		//store not repeated values
		HashSet<Integer> nonDuplicate = new HashSet<Integer>();

		//Iterate using enhance for-loop to see the order
		for (int element : numbers) {
			//if temp contains an element
		    if (temp.contains(element)) {
		    	//delete duplicated values
		    	nonDuplicate.remove(element);
		    }
		    else {
		    	//store duplicate values in temp 
		    	temp.add(element);
		    	//store duplicate vlaues in nonDuplicate to remove duplicated ones
		    	nonDuplicate.add(element);
		    }
		}
		
		// Output non duplicate
		System.out.println("Non duplicate output is " + nonDuplicate + ".");
		
		// METHOD 2
		
		/*
		 //Create a map
		//key is the element of the array
		//value is the counter
		Map<Integer, Integer> map = new HashMap<Integer, Integer>(); 
		
		for (int element : numbers) {
		    if (map.containsKey(element)) {
		    	//check if map includes the key
		    	//if yes, increase count by map.get(element) + 1
		    	map.put(element, map.get(element)+1);
		    } else {
		    	//or add a new set
		    	map.put(element, 1);
		    }
		}
		
		// display the key, which is the repeated element and the value, how many it repeat
		// use lambda method (map.forEach)
		System.out.println("\nKey is the element and value is how many each repeated element");
		 map.forEach((k, v) -> {
			 if (v == 1 ) {
				 System.out.println("Key : " + k + ", Value : " + v);
			 }
		 });
		 */
	}
}
