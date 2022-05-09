/*
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_4;

public class Circle {
	private float Radius;
	
	public Circle() {
		this.Radius = 0;
	}
	
	public Circle(double r) {
		this.Radius = (float) r;
	}
	
	public double GetArea() {
		return Math.PI * (Radius * Radius);
	}
	
	public double GetPerimeter() {
		return 2 * Math.PI * Radius;
	}
	
	public void show() {
		System.out.println("The Radius is " + Radius + ".\nThe Area is " + GetArea() + ".\nThe Perimeter is " + GetPerimeter() + ".");
	}
}
