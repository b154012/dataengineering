/* According to the definition of student class, create five objects of this class, output the information of each student,
 * calculate and output the average of the five students' Java language scores,
 * and calculate and output the maximum and minimum of their Java language scores
 * 
 * 1. Create 5 objects
 * 2. Output info
 * 3. Calculate average scores and output its average
 * 4. Calculate maximum and minimum and output those.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-05 
 * */

package pkg_4;

import java.util.Scanner;

public class Exercise7 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		Student studentArr[] = new Student[5];
		
		Scanner input = new Scanner(System.in);
		
		//First Student record
		Student student1 = new Student();
		student1.setNo(1);
		student1.setName("Alicia");
		student1.setGender("Female");
		student1.setAge(20);
		student1.setCourseScore(82);
		studentArr[0] = student1;
		
		//Second student record
		Student student2 = new Student();
		student2.setNo(2);
		student2.setName("Brian");
		student2.setGender("Male");
		student2.setAge(21);
		student2.setCourseScore(75);
		studentArr[1] = student2;
		
		//Third student record
		Student student3 = new Student();
		student3.setNo(3);
		student3.setName("Cecilia");
		student3.setGender("Female");
		student3.setAge(19);
		student3.setCourseScore(50.5);
		studentArr[2] = student3;
		
		//Fourth student record
		Student student4 = new Student();
		student4.setNo(4);
		student4.setName("Desmond");
		student4.setGender("Male");
		student4.setAge(26);
		student4.setCourseScore(43);
		studentArr[3] = student4;
		
		//Fifth student record
		Student student5 = new Student();
		student5.setNo(5);
		student5.setName("Edmund");
		student5.setGender("Male");
		student5.setAge(18);
		student5.setCourseScore(92);
		studentArr[4] = student5;
		
		//create a new object
		Student studentInfo = new Student();
		studentInfo.stu = studentArr;
		
		//Display student
		System.out.println("Number\t" + "Name\t" + "Gender\t" + "Age\t" + "Course Score ");
		System.out.println(" ");
		for(int i = 0; i < studentArr.length; i++) {
			System.out.println(studentArr[i].toString());
			System.out.println();
		}
		
		System.out.println("The average score of the student class is " + studentInfo.avg() + ".");
		System.out.println("The minimum value is " + studentInfo.getMin() + ".");
		System.out.println("The maxmimum value is " + studentInfo.getMax() + ".");
		
		input.close();
	}
}
