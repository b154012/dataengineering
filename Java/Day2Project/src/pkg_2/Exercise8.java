/*Two tennis teams are playing against each other. 
 * Each team has three players. 
 * One team has Players a, b, c, and the other has Players x, y, z. Lots have been drawn to decide the list of matches.  
 * Player a says he does not want to be matched with Player x.  
 * Player c says he does not want to be matched with Players x and z.  
 * Write a program to output the 3 possible matches.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-03 
 */

package pkg_2;

public class Exercise8 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		char a,b,c;
		
		for(a = 'x'; a <= 'z'; a++) {
			for(b = 'x'; b <= 'z'; b++) {
				//avoiding repeated players
				if(a != b) {
					for(c = 'x'; c <= 'z'; c++) {
						//avoid repeated players
						if(a != c && b != c) {
							//the constraints of the question such that a != x && c != x && c != z
							if(a != 'x' && c != 'x' && c != 'z') {
								System.out.println("A plays with " + a + "\n" + "B plays with " + b + "\n" + "C plays with " + c);
							}
						}
					}
				}
			}
		}
	}
}
