/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class VeryFastAnimal extends FastAnimal {
	
	public VeryFastAnimal() {
		super();
	}
	
	public VeryFastAnimal(int a) {
		super();
	}
	
	public void run() {
		this.Distancetravelled += 20;
		System.out.println("The distance travel when fast animal runs is " + this.Distancetravelled);
	}	
}
