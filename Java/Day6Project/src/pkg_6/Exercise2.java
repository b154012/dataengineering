/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-09
 */

package pkg_6;

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//a.Create a new StringBuilder named mySB with the text “Hey there John”.
		StringBuilder mySB = new StringBuilder("Hey there John");
		
		System.out.println("The StirngBuilder with text is " + mySB);
		
		//b. Use the Insert method to change the string to “Oh, hey there John.”
		mySB.replace(0, 1, "");	
		mySB.insert(0, "Oh, h");
		
		int addFullStop = mySB.length();		
		mySB.insert(addFullStop, ".");
		System.out.println("From 'Hey there Jonn' ---> " + "'" + mySB + "'");
		
		//c.Use the Replace method to change the string to “Oh, hi there Mark.”
		mySB.replace(4, 7, "hi");
		//check the length of a new string after replacing hi from hey System.out.println(mySB.length());
		mySB.replace(13, 17, "Mark");
		System.out.println("From 'Oh, hey there John.' ---> " + "'" + mySB + "'");
		
		//d. Use the Delete method to change the string to “Oh, hi Mark.”
		mySB.delete(7,12);
		System.out.println("After removing the word THERE from 'Oh, hey there Mark.' ---> " + "'" + mySB + "'");
	}
}
