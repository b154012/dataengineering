/* an array containing the following value for each element:
 * 
 * Element	Value
 *   1	      0
 *   2	      2
 *   3	      4
 *   4	      6
 *   5	      8
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//declare, instantiate and initialize
		int elementData[] = new int[5];
		
		//input a value in each element
		for (int i = 0; i < elementData.length; i++) {
			elementData[i] = i * 2;
		}
		
		//display the elementData array
		
		System.out.println("Element" + "\t" + "Value");
		
		int elementNo = 0;
		
		for (int i = 0; i < elementData.length; i++) {
			elementNo += 1;
			System.out.println(elementNo + "\t" + elementData[i]);
		}
	}
}