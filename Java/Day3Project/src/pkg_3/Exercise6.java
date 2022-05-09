/*6.	Create an array called myNames which contains the strings [“Maria”, “Ludwig”, “Rom”].
 * Change “Rom” to “Laurence” without changing the array declaration, i.e. use arrayName[x] = “example”.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise6 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String myNames[] = new String[]{"Maria", "Ludwig", "Rom"};
		
		//change Rom to Laurence
		myNames[2] = "Laurence";
		
		System.out.println(myNames[2]);
	}
}