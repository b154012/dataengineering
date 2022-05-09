/*11.There is an integer array which stores the sequences 1, 3, 5, 7, 9, 11, 13, 15, 17 and 19.
 * Please store and output the sequence in reverse order.
 * 
 *  
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        int odd[] = new int[] {1, 3, 5, 7, 9, 11, 13, 15, 17,19};
        System.out.println("Original order: ");
        for(int i = 0; i < odd.length; i++) {
        	System.out.print(odd[i] + " ");
        }
        
        int oddNum[] = new int[odd.length];
        
        int j = odd.length;
        
        for(int i = 0; i < odd.length; i++) {
        	oddNum[j-1] = odd[i];
        	j--;
        }
        
        /*
        int temp;
        
        for(int i = 0; i < odd.length / 2; i++) {
        	temp = odd[i];
        	odd[i] = odd[odd.length-1-i];
        	odd[odd.length - 1 - i] = temp;
        }*/
        
        System.out.println("\nReverse order: ");
        for(int x : oddNum) {
        	System.out.print(x + " ");
        }
	}

}
