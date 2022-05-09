/*Exercise 1 until 5
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-05 
 */

package pkg_4;

public class Car {
	private int Mileage;
	private int BuyingPrice;
	private int YearsOwned;
	private double SellingPrice;
	private boolean GoodCondition;
	private int NumOfPassengers;
	private int NumOfDoors;
	
	//default constructor
	public Car() {
		this.Mileage = 0;
		this.BuyingPrice = 0;
		this.YearsOwned = 0;
		this.SellingPrice = 0.0;
		this.NumOfPassengers = 0;
		this.NumOfDoors = 0;
	}
	
	//when the passing arguments are only mileage, buyingprice, yearsowned
	public Car(int m, int b, int y) {
		this.Mileage = m;
		this.BuyingPrice = b;
		this.YearsOwned = y;
	}
	
	//when more arguments include selling price, no. of passengers and doors.
	public Car(int m, int b, int y, int p, int d) {
		this.Mileage = m;
		this.BuyingPrice = b;
		this.YearsOwned = y;
		this.NumOfPassengers = p;
		this.NumOfDoors = d;
	}
	
	//GetSellingPrice without any parameter
	public double GetSellingPrice() {
		SellingPrice = BuyingPrice/(1 + 0.00001 * Mileage + 0.1 * YearsOwned);
		
		return SellingPrice;
	}
	
	//when the parameter is bool GoodCondition
	public double GetSellingPrice(boolean goodCondition) {
		
		if(goodCondition == true) {
			SellingPrice = BuyingPrice * 1.1/(1.1/(1 + 0.00001 * Mileage + 0.1 * YearsOwned + 0.3 * NumOfDoors + NumOfPassengers));
			
			return SellingPrice;
		} else {
			SellingPrice = BuyingPrice * 0.6 / (1.1/(1 + 0.00001 * Mileage + 0.1 * YearsOwned + 0.3 * NumOfDoors + NumOfPassengers));
			
			return SellingPrice;
		}
	}
	
	public void printVal(int m, int b, int y) {
		System.out.println("The mileage is " + m + ". The buying price is $" + b + ". The years owned is " + y + ".");
	}

}