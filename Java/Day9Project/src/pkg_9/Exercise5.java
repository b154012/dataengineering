/*5.Read file name from the command line to determine whether the file exists.
 *  If the file exists, a new file named "copy_original file name" is created under the same path of the original file, and
 *  the content of the file is the copy of the original file.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-13
 */

// input: original.txt
// output: Done! copying [copy_original.txt]

package pkg_9;

import java.io.*;
import java.util.*;

public class Exercise5 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		//read file name
		Scanner input = new Scanner(System.in);
		System.out.print("Enter your filename: ");
		String name = input.nextLine();
		input.close();
		
		String directory = "C:\\Users\\Lenovo\\Documents\\";
		String content = directory + name;
		
		File fileOriginal = new File(content);
		
		ifExist(fileOriginal);
	}
	
	public static void ifExist(File fileOriginal) throws IOException {
		
		// read data using FileInputStream and assign fileOriginal to the parameter
		FileInputStream readData = new FileInputStream(fileOriginal);
		
		try {
			//check if fileOriginal exists
			if (fileOriginal.exists()) {
				System.out.println("File exists: " + fileOriginal.exists());
				//copy data from fileOriginal
				File fileCopy = new File("C:\\Users\\Lenovo\\Documents\\copy_original.txt");
				FileOutputStream writeData = new FileOutputStream(fileCopy);
				
				//algorithms to copy file using FileOutputStream and FileInputStream
				byte[] buffer = new byte[1024];
				
				while (true) {
					int count = readData.read(buffer);
					if (count == -1) {
						break;
					}
					writeData.write(buffer, 0, count);
				}
				writeData.close();
			} else {
				throw new FileNotFoundException();
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (readData != null) {
				readData.close();
			}
			System.out.println("Done copying!");
		}
	}
}
