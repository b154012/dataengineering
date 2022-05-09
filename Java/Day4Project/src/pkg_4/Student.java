package pkg_4;

public class Student {
	Student[] stu;
	private int StudentNo;
	private String Name;
	private String Gender;
	private int Age;
	private double Course;
	
	public Student() {
		this.StudentNo = 0;
		this.Name = "";
		this.Gender = " ";
		this.Age = 0;
		this.Course = 0.0;
	}
	
	public Student(int studentNo, String name, String gender, int age, double course) {
		this.StudentNo = studentNo;
		this.Name = name;
		this.Gender = gender;
		this.Age = age;
		this.Course = course;
	}
	
	public void setNo(int studentNo) {
		this.StudentNo = studentNo;
	}
	
	public void setName(String name) {
		this.Name = name;
	}
	
	public void setGender(String gender) {
		this.Gender = gender;
	}
	
	public void setAge(int age) {
		this.Age = age;
	}
	
	public void setCourseScore(double courseScore) {
		this.Course = courseScore;
	}
	
	public int getNo() {
		return this.StudentNo;
	}
	
	public String getName() {
		return this.Name;
	}
	
	public String getGender() {
		return this.Gender;
	}
	
	public int getAge() {
		return this.Age;
	}
	
	public double getCourseScore() {
		return this.Course;
	}
	
	public double avg() {
		double sum = 0;
		double average = 0;
		for (int i = 0; i < 5; i++) {
			sum += stu[i].getCourseScore();
		}
		
		average = sum / stu.length;
		return average;
	}
	
	public double getMin() {
		//find min and max of Java Scores
		double min = stu[0].getCourseScore();
		double max = stu[0].getCourseScore();
		for(int j = 0; j < stu.length; j++) {
			if(min > stu[j].getCourseScore()) {
				min = stu[j].getCourseScore();
			}
		}
		return min;
	}
	
	public double getMax() {
		double max = stu[0].getCourseScore();
		for(int j = 0; j < stu.length; j++) {
			if(max < stu[j].getCourseScore()) {
				max = stu[j].getCourseScore();
			}
		}
		return max;
	}
	
	//Override toString() to print object directly
	public String toString() {
		return getNo() + "\t" + getName() + "\t" + getGender() + "\t" + getAge() + "\t" + getCourseScore();
	}
}
