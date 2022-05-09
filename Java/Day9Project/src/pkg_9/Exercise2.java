/*2. Write a method void: 
isTriangle(int   a,int   b,int   c) 
a.	Determine whether the three parameters can form a triangle.
b.	If not, throw an exception illegalargumentexception and display the exception information a, b, c "cannot form a triangle". 
c.	If a triangle can be formed, display the three sides of the triangle, get three integers from the command line in the main method, call this method, and catch the exception.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-13
 */

package pkg_9;

import java.util.*;

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Scanner input = new Scanner(System.in);
		
		try {
				System.out.print("Entere a: ");
				int a = input.nextInt();
				
				System.out.print("Entere b: ");
				int b = input.nextInt();
				
				System.out.print("Entere c: ");
				
				int c = input.nextInt();
				
				isTriangle(a, b, c);
				
		} catch(InputMismatchException e) {
			System.out.println(e.getMessage());
			System.out.println("Input should be an integer value!");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			input.close();
		}
	}
	
	public static void isTriangle(int a, int b, int c) {
		try {
			//either one of 3 conditions to form a triangle
			if((a + b) > c) {
				System.out.println("Can form a triangle");
			} /*else if ((b+c) > a) {
				System.out.println("Can form a triangle");
			} else if ((a + c) > b) {
				System.out.println("Can form a triangle");
			} */ else {
				throw new IllegalArgumentException();
			}
		} catch (IllegalArgumentException e) {
			System.out.println("Cannot form a triangle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
