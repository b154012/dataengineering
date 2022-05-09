/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class Animal {
	protected int Distancetravelled;
	
	public Animal() {
		this.Distancetravelled = 0;
	}
	
	public Animal(int a) {
		this.Distancetravelled = a;
	}
	
	public void move() {
		this.Distancetravelled += 1;
		System.out.println("The distance travelled is " + this.Distancetravelled + ".");
	}
	
	public int move(int a) {
		this.Distancetravelled += a;
		return this.Distancetravelled;
	}
}
