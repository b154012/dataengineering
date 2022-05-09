/*9. Create an empty int array of length equalling to 7.
 * Use a For loop statement to fill up the array with numbers 1 to 7.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
  */

package pkg_3;

public class Exercise9 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
       int alist[] = new int[7];
       
       int num = 0;
       
       for(int i = 0; i < alist.length; i++) {
    	   num = i + 1;
    	   alist[i] = num;
    	   System.out.println(alist[i]);
       }
       
       System.out.print("My array list is ");
       for(int x : alist) {
    	   System.out.print(x);
       }
	}
}
