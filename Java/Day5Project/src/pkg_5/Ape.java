/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class Ape {
	protected String speak;
	
	public Ape() {
		this.speak = "yiyiya...";
	}
	
	public Ape(String s) {
		this.speak = s;
	}
	
	public void speak() {
		System.out.println(this.speak);
	}

}
