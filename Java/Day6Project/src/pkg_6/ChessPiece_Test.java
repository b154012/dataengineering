/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-09
 */

package pkg_6;

public class ChessPiece_Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//h.Create an instance of Rook named myRook. Make myRook use Kill() and PossibleMoves() to see if they have been implemented correctly.
		ChessPiece myRook = new Rook();
		
		//implementations. set Kill to false and display the possible moves.
		myRook.Kill(false);
		myRook.PossibleMoves();
		
		
		//create an array of IChessPiece named myChessPieces
		IChessPiece myChessPieces[] = new IChessPiece[2];
		int size = myChessPieces.length;
		
		//q. Set myChessPieces[0] to a new WhiteQueen, and myChessPieces[1] to a new BlackBishop. 
		myChessPieces[0] = new WhiteQueen();
		myChessPieces[1] = new BlackBishop();
		
		//r. Use a For loop statement to make each piece use their PossibleMoves() method and see what is printed to the console.
		for(int i = 0; i < size; i++) {
			if(i == 0) {
				System.out.println("WhiteQueen: ");
				myChessPieces[i].PossibleMoves();
			} else {
				System.out.println("BlacksBishop: ");
				myChessPieces[i].PossibleMoves();
			}
		}
	
	}
}
