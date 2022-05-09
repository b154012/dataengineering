package pkg_2;

import java.util.Scanner;
import java.lang.Math.*;

public class ex1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
		
		Scanner input = new Scanner(System.in);
		
		System.out.print("Enter your radius value: ");
		
		double rad = input.nextDouble();
		
		double theRad = Math.pow(rad, 2);
		
		double result = Math.PI * theRad;
		
		System.out.println(result);
		
	}
}
