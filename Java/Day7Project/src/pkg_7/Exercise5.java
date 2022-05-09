/*5. Define four student objects, add them to the list, and output them.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-11
 */

package pkg_7;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Exercise5 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//define four student objects
		Student student1 = new Student("Pinky", 1, 20, "Computer Science");
		Student student2 = new Student("Blacky", 3, 19, "Math");
		Student student3 = new Student("Redy", 5, 18, "Physics");
		Student student4 = new Student("Bluey", 7, 23, "Chemistry");
		Student student5 = new Student("Orangey", 9, 21, "Biology");
		
		//create an array list
		List<Student> studentList = new ArrayList<Student>();
		
		//add to the list
		studentList.add(student1);
		studentList.add(student2);
		studentList.add(student3);
		studentList.add(student4);
		studentList.add(student5);
		
		//iterate and output student list
		Iterator<Student> itr = studentList.iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
	}
}
