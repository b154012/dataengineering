/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-09
 */

package pkg_6;

//n.Create another class named BlackBishop that only implements IChessPiece (since it is not a white piece, it definitely should not be implementing IWhitePiece). 

public class BlackBishop implements IChessPiece {

	///o. The PossibleMoves should print to the console “Can move diagonally.” and should not return anything.
	@Override
	public void PossibleMoves() {
		// TODO Auto-generated method stub
		System.out.println("Can move diagonally.");
	}

}
