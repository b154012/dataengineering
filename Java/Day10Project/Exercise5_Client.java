/*5.Using Java socket programming based on TCP, the following functions are completed:
 *a.	It is required to enter several characters from the client and send it to the server.
 *b.	The characters that are received by the server are output.
 *c.	The server sends a response to the client that your message has been received.
 *d.	The client receives the response information from the server.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-16
 */

package pkg_10;

import java.io.*;
import java.net.*;
import java.util.*;

public class Exercise5_Client {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		Socket clientSoc = null;
		
		try {
			
			clientSoc = new Socket("localhost", 4002);				
			
			OutputStream os = clientSoc.getOutputStream();
			DataOutputStream dos = new DataOutputStream(os);			
				
			InputStream is = clientSoc.getInputStream();
			DataInputStream dis = new DataInputStream(is);
				
			Scanner input = new Scanner(System.in);		
				
			// a. It is required to enter several characters from the client and send it to the server.
			for (int i = 0; i < 5; i++) {
				System.out.print("CLIENT: ");
				String s 	= input.nextLine();
				dos.writeUTF(s);
				// d.	The client receives the response information from the server.
				System.out.println("SERVER: " + dis.readUTF());
			}
				
			input.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (clientSoc != null) {
				clientSoc.close();
			}
		}
	}

}
			