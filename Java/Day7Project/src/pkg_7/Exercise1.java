/* 1. Calculate the number of integers with absolute values greater than 6 or less than 2.1 between -10.8 and 5.9.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-11
 */

package pkg_7;

import java.util.*;

public class Exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//create an arraylist of integers
		ArrayList<Integer> integerAbs = new ArrayList<Integer>();
		
		double min = -10.8;	
		double max = 5.9;
		
		//Iterate using minimum and maximum
		for(int i = (int) Math.round(min); i <= (int) Math.round(max); i++ ) {
			//if value is greater than 6
			if (i > 6) {
				integerAbs.add(i);
			//else if value is less than 5.9 and value is greater than initial min
			} else if (i < (int) Math.round(max)  && i > (int) Math.round(min)) {
				//unautobox values with Math absolute function
				int v = Math.abs(i);
				//check whether value is less than 2.1 or greater than 6
				if (v < 2.1 || v > 6) {
					//add in the array list
					integerAbs.add(v);
				}
			}
		}
	System.out.println("The number of integers with absolute values is " + integerAbs.size() + ".");	
	System.out.println("The array list is " + integerAbs);
	}
}
