/*1.Create a class called Animal with attribute int DistanceTravelled. Create a constructor for the class that takes no arguments.
 *  DistanceTravelled should be set to 0 in the constructor. 
 *  Then, add a method called Move that doesn’t return anything, but outputs the increments for DistanceTravelled by 1. 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-06 
 */

package pkg_5;

public class Exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//Create Distancetravelled increments by 1
		System.out.println("When distance travelled increments by 1");
		Animal a = new Animal();
		a.move();
		System.out.println();
		
		//make dog moves 3 times
		System.out.println("When the dog runs 3 times: ");
		Animal dog = new Animal();
		System.out.println("The distance travelled by Dog is " + dog.move(3));
		System.out.println();
		
		//Create FastAnimal
		System.out.println("When Fast Animal moves and runs: ");
		FastAnimal fastanimal = new FastAnimal();
		fastanimal.move();
		fastanimal.run();
		System.out.println();
		
		//When fox
		System.out.println("When Fox runs and moves: ");
		FastAnimal fox = new FastAnimal();
		fox.run();
		fox.move();
		System.out.println();
		
		//When Barry
		System.out.println("When Barry moves and runs: ");
		FastAnimal barry = new VeryFastAnimal();
		barry.run();
		barry.move();
	}
}
