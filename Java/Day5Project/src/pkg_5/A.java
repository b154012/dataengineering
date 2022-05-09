/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class A {
	protected String name;
	
	public A() {
		this.name = "";
	}
	
	public A(String name) {
		this.name = name;
	}
	
	public String f() {
		return this.name.toLowerCase();
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String toString() {
		return f();
	}
}
