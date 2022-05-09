/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

/*7. Write a Java program with the below requirements:
 * a.	Three classes: Ape class, People class and main class E
 * b.	There is a construction method in apes: String s, and there is a public void speak() method. In the speak method, the information of "yiyiya..." is the output.
 * c.	The People class is a subclass of Ape. In the People class, the method speak () is overridden, and the output is the speak method "Small sample, not bad!" 
 * Add a new method void think () in the People class, and output "Don't talk! Think hard! "
 * d.	In the main method of main class E, create the object classes of Ape class and People class to test the functions of these two classes.

 * 
 * */

package pkg_5;

public class E {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Ape ape1 = new Ape();
		Ape ape2 = new Ape("Booo");
		Ape people1 = new People();
		People people2 = new People();
		
		ape1.speak();
		ape2.speak();
		people1.speak();
		people2.speak();
		people2.think();

	}

}
