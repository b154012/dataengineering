/*13.One dimensional array (example array is as follows {7,4,3,9,0,6}) is used to realise bubble sort, select sort and insert sort. 
 * Comments are required in the program.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-04 
  */

package pkg_3;

public class Exercise13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		int oneDArray[] = new int[] {7,4,3,9,0,6};
		
		//bubble sort.
		
		//each element is compared with adjacent element.
		//it works in passes like a[0] = a[1], a[1] = a[2], etc.
		//N elements requires n-1 passes for sorting
		
		System.out.println("Original Array");
		for(int array : oneDArray) {
			System.out.print(array + " ");
		}
		
		
		int temp = 0;
		
		for(int i = 0; i < oneDArray.length; i++) {
			for (int j = 1; j < oneDArray.length-i; j++) {
				//compares the adjacent elements
				if (oneDArray[j-1] > oneDArray[j]) {
					//swap them if the j-1 > j
					temp = oneDArray[j];
					oneDArray[j] = oneDArray[j-1];
					oneDArray[j-1] = temp;
			}		
		}
	    }
		
		System.out.println("\nArray after Bubble Sort: ");
		for(int array : oneDArray) {
			System.out.print(array + " ");
		} 
		
		//insert sort
		
		//Algorithm
		//1. select the first unsorted element
		//2. Swap other elements to the right to create the correct position and shift the unsorted element.
		//3. Advance the market to the right one element.
		
		int key;
		
		for (int i = 1; i < oneDArray.length; i++) {
			key = oneDArray[i];
			int j = i - 1;
			//shifts all elements to the right to create the post for unsorted element.
			while(j > -1 && oneDArray[j] > key) {
				oneDArray[j+1] = oneDArray[j];
				j = j - 1;
			}
			//insert the correct element to the right position
			oneDArray[j+1] = key;
		}
		
		System.out.println("\nArray after Insertion Sort");
		for(int array : oneDArray) {
			System.out.print(array + " ");
		} 
		
		//Select sort
		//Logic, an integer array is considered into two parts of unsorted and sorted elemenets.
		
		//Selection 1: Select the lowest element in the remaining array.
		//Bring it to the starting point.
		//Change the counter for unsorted array by one.
		
		int min_index;
		
		for(int i = 0; i < oneDArray.length-1; i++) {
			min_index = i;
			for(int j = i+1; j < oneDArray.length; j++) {
				if(oneDArray[min_index] > oneDArray[j]) {
					min_index = j;
				}
			}
			
			temp = oneDArray[min_index];
			oneDArray[min_index] = oneDArray[i];
			oneDArray[i] = temp;
		}
		
		System.out.println("\nArray after Selection Sort: ");
		for(int array : oneDArray) {
			System.out.print(array + " ");
		}
	}
}
