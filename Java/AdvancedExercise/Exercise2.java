/*2. Write a program to convert the temperature units between Fahrenheit and Centigrade. 
 *a. To convert Fahrenheit to Centigrade: subtract 32, multiply by 5 and then divide by 9. 
 *b. To convert Centigrade to Fahrenheit: multiply by 9, divide by 5 and then add 32.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-24
 * */

package evyd;

import java.util.*;

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner input = new Scanner(System.in);
		
		System.out.print("Enter your Fahrenheit: ");
		double fahrenheit = input.nextDouble();
		
		double convertFahrenheit = ((fahrenheit - 32) * 5) / 9;
		
		System.out.println("a. To convert Fahrenheit, " + fahrenheit + ", to Centigrade: " + convertFahrenheit);
		
		System.out.print("\nEnter your celcius: ");
		double celcius = input.nextDouble();
		
		double convertCelcius = ((celcius * 9)/5) + 32;
		
		System.out.println("b. To convert Celcius, " + celcius + ", to Fahrenheit: " + convertCelcius);
		
		input.close();
		
	}

}
