/*6 Write a class named A. The object created by this class can call method f to output lowercase English alphabet. 
 * Then write a subclass B of class A, which requires subclass B to inherit method f of class A (no rewriting allowed). 
 * Objects created by subclass B can not only call method f to output lowercase alphabet, 
 * but also call method g added by subclass to output uppercase alphabet. 
 * Finally, write the main class C to test class A and class B in the main method of the main class.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class C {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String value = "Song Jong Ki";
		
		//in lowercase
		A classA = new A(value);
		
		//in uppercase
		B classB = new B(value);
		
		System.out.println("A calls method f: " + classA.f());
		System.out.println("B calls method g: " + classB.g());
		System.out.println("B calls method f of A: " + classB.f());
	}

}
