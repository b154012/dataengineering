/*3. Sort a line of floating-point numbers (separated by spaces) in the file, and output (each newline)
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-13
 */

package pkg_9;

import java.io.*;
import java.util.*;

public class Exercise3 {

	public static void main(String[] args) throws FileNotFoundException {
		// TODO Auto-generated method stub
		
		Scanner inputFile = null;
		ArrayList<Float> arr = new ArrayList<Float>();
		
		//create file and set the current location of data
		File file = new File("C:\\Users\\Lenovo\\Documents\\data.dat");
		
		try {
			inputFile = new Scanner(file);
	
			while(inputFile.hasNext()) {    
				arr.add(inputFile.nextFloat());
			}
			
		} catch(FileNotFoundException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		} catch (Exception e) {
			System.out.println();
			
		} finally {
			inputFile.close();
		}
		
		// Arrraylist before sorting
		System.out.println("Before sorting:");
			for (Float x : arr) {
			System.out.println(x);
		}
		
		//sort ArrayList using built-in function sort() 
		Collections.sort(arr);
	
		// ArrayList aftet sorting
		System.out.println("After sorting:");
			for (Float x : arr) {
			System.out.println(x);
		}
	}
}
