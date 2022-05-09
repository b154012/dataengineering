/* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-11
 */

package pkg_7;

public class Student {
	private String name;
	private int number;
	private int age;
	private String course;
	
	public Student() {
		this.name = "";
		this.number = 0;
		this.age = 0;
		this.course = "";
	}
	
	public Student(String name, int number, int age, String course) {
		this.name = name;
		this.number = number;
		this.age = age;
		this.course = course;
	}
	
	public String toString() {
		return name + " " + number + " " + age + " " + course;
	}
}
