/*3.	Write a program to calculate 
 * (1) the area of the circle and 
 * (2) the radius of the circle 
 * using the command line parameter input.
 * 
 * https://www.jdoodle.com/online-java-compiler/
 *  
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-24
 * */

package evyd;

public class Exercise3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//enter a number in the argument
		int rad = Integer.parseInt(args[0]);
		System.out.println("The radius is " + rad);
		
		// the area of the circle
		double area = Math.PI * rad * rad;
		
		//the radius of the circle
		//double r = Math.sqrt((area)/Math.PI);
		
		//the perimeter of the circle
		double perimeter = (2 * rad * rad) * Math.PI; 
		
		System.out.println("The area of the circle is " + area + ".");
		//System.out.println("The radius of the circle is " + r + ".);
		System.out.println("The perimeter of the circle is " + perimeter + ".");
		
	}

}
