/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class B extends A {
	
	public B() {
		this.name = "";
	}
	
	public B(String name) {
		this.name = name;
	}
	
	public String g() {
		return this.name.toUpperCase();
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String toString() {
		return this.name;
	}
}
