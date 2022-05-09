/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-09
 */

package pkg_6;

//k. Create a class named WhiteQueen that implements both of these interfaces. 

public class WhiteQueen implements IChessPiece, IWhitePiece {

	//m.	The CapturePiece should print to the console “Can capture black pieces”. 
	@Override
	public void CapturePiece() {
		// TODO Auto-generated method stub
		System.out.println("Can capture black pieces.");
	}
	
	//l. The PossibleMoves should print to the console “Can move vertically, horizontally and diagonally.”
	@Override
	public void PossibleMoves() {
		// TODO Auto-generated method stub
		System.out.println("Can move vertically, horizontally and diagonally.");
		
	}

}
