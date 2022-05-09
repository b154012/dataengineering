/* 4. Using FileInputStream and FileOutputStream, complete the following requirements:
 * a. Using FileOutputStream, create a file "test.txt" in the current directory and output "HelloWorld" to the file. 
 * If the file already exists, it will be appended after the original file content.
 * b. Using FileInputStream, read and print test.txt on the console.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-13
 */

package pkg_9;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Exercise4 {

	public static void main(String[] args) throws FileNotFoundException, IOException {
		// TODO Auto-generated method stub
		String content = "Hello World";
		
		File file = new File("C:\\Users\\Lenovo\\Documents\\text.txt");
		
		write(file, content);
		read(file);
		
	}
	
	// FileNotFoundExcetion is thrown if file exist and is not a regular file, rather a directory
	// file does not exist, cannot be created/opened
	public static void write(File f, String content) throws IOException {
		
		//If the file already exists, it is overridden
		FileOutputStream data = null;
		try {
			data = new FileOutputStream(f);
			
			// convert string into byte array
			byte b[] = content.getBytes();
			// write the content in the file
			data.write(b);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//close FileOutputstream is not empty
			if (data != null) {
				data.close();
				data.flush();
			}
			System.out.println("File is successfully written.");
		}
		
	}
	
	public static void read(File file) throws IOException {
		//If the file already exists, it is overridden
		FileInputStream data = null;
			try {
				data = new FileInputStream(file);
					
				int i = 0;
				
				//read content
				while ((i = data.read()) != -1) {
					System.out.print((char) i);
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				//close FileOutputstream is not empty
				if (data != null) {
					data.close();
				}
			}
	}
}
