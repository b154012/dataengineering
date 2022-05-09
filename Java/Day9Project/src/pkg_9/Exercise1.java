/*1.Get 5 integers from the command line, put them into an integer array, and print them out. Program the below requirements:
 *a.	If the input data is not an integer, an exception should be generated. 
 *b.	Parseint() to display "Please input integer"
 *c.	Exceptions with less than 5 input parameters (array out of bounds) to display "Please input at least 5 integers".
 *
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-13
 */

//eg1. input is 1 2 3 4 5, output is 1 2 3 4 5 Done!
//eg2. input is 1 2 3, output is Please input at least 5 integers
//eg3. input 1 2 3 hello, output is Exception error messages

package pkg_9;

public class Exercise1 {
    public static void main(String args[]) {
        try {
        	int integerArray[] = new int[args.length];
   		
        		for (int i = 0; i < 5; i++) {
        			//use parseInt() and store values into the array
        			integerArray[i] = Integer.parseInt(args[i]);
        		}
        			
        	ParseInt(integerArray);
        	System.out.println();
    
        } catch (ArrayIndexOutOfBoundsException e) {
            System.out.println("Please input at least 5 integers");
            System.out.println(e.toString());
        }
    }
    
    public static void ParseInt(int[] arr) {
    	System.out.println("Please input integer");
		for(int x : arr) {
			System.out.print(x + " ");
	    }
    }
    
}
