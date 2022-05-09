/*3. Write a program to generate 100 numbers randomly, count the repeated data and output the repeated data.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-12
 */

package pkg_8;

import java.util.*;

public class Exercise3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//create Random object to generate numbers randomly
		Random random = new Random();
		
		//create an array of 100 integers
		int numbers[] = new int[100];
		
		// compute 100 random numbers
		for(int i = 0; i < 100; i++) {
			numbers[i] = random.nextInt(100) + 1;
		}
		
		//Iterate using enhance for-loop to see the order
		System.out.println("Random numbers: ");
		for(Integer x : numbers) {
			System.out.print(x + " ");
		}
		
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
	}
}
