/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class FastAnimal extends Animal {
	
	public FastAnimal() {
		super();
	}
	
	public FastAnimal(int a) {
		super();
	}
	
	public void run() {
		this.Distancetravelled += 5;
		System.out.println("The distance travel when fast animal runs is " + this.Distancetravelled);
	}
	
	//override
	public void move() {
		this.Distancetravelled += 3;
		System.out.println("The distance travel of fast animal moves " + this.Distancetravelled);
	}
}
