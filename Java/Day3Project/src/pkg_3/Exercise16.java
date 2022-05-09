/*16.Define an array of integers and output the average and variance.
 * 
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
 */

package pkg_3;

public class Exercise16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		double values[] = new double[] {1,2,3,4,5,6,7,8,9,10};
		
		//find average
		double total= 0;
		for(int i = 0; i < values.length; i++) {
			total += values[i];
		}
		
		double average = (double) (total) / values.length;
		
		//find variance
		double varianceVal = 0.0;
		
		for(int i = 0; i < values.length; i++) {
			varianceVal += Math.pow(values[i] - average, 2);
		}
		
		varianceVal = varianceVal/values.length; 
		
		//display the results of average and variance
		System.out.printf("The average is %.2f\n", average);
		System.out.printf("The variance is %.2f", varianceVal);
	}
}