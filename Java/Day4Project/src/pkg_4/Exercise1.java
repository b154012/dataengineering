/*Exercise 1 till 5
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-05 
 */

package pkg_4;

public class Exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//Pass arguments with number of doors and passengers	
		Car honda = new Car(1000, 2000, 10, 4, 8);
		Car porsche = new Car(1000, 50000, 1);
		
		//Print out 4 attributes
		honda.printVal(1000, 2000, 10);
		porsche.printVal(1000, 50000, 1);
		
		System.out.printf("The selling price for honda is $%.2f.\n", honda.GetSellingPrice());
		
		//Honda is much expensive when it is in good condition.
		System.out.printf("The selling price for a good condition is $%.2f.\n", honda.GetSellingPrice(true));
		System.out.printf("The selling price for a bad condition is $%.2f.\n", honda.GetSellingPrice(false));
		
	}

}