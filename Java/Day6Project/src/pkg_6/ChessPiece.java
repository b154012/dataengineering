/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-09
 */

package pkg_6;

//a.Create an abstract class called ChessPiece. 
public abstract class ChessPiece {
	//b. It should have a private Boolean attribute named Alive. 
	private boolean Alice;
	
	//c.It should have a constructor that sets Alive to True. 
	public ChessPiece() {
		this.setAlice(true);
	}
	
	public ChessPiece(boolean a) {
		this.setAlice(a);
	}
	
	//d. It should have an abstract method named PossibleMoves. 
	public abstract void PossibleMoves();
	
	//e.It should have a method named Kill that sets Alive to False, and prints to the console “Piece has been killed.” 
	public void Kill(boolean a) {
		System.out.println("Piece has been killed.");
	}

	public boolean isAlice() {
		return this.Alice;
	}

	public void setAlice(boolean alice) {
		this.Alice = alice;
	}	
}
