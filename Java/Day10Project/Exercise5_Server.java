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
import java.net.ServerSocket;
import java.net.Socket;
import java.util.*;

public class Exercise5_Server {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		ServerSocket listener = null;
		
		try {
		
			// create a server socket and port
			listener = new ServerSocket(4002);
			System.out.println("Server is waiting to accept for CLIENT request.");
			
			while(true) {
				
				//listens for a connection to the socket and accepts it
				// The accept() method blocks until a connection is made
				
				Socket serverSoc = listener.accept();
				
				InputStream is = serverSoc.getInputStream();
				DataInputStream dis = new DataInputStream(is);
				
				OutputStream os = serverSoc.getOutputStream();
				DataOutputStream dos = new DataOutputStream(os);
				
				Scanner input = new Scanner(System.in);
				
				for (int i = 0; i < 5; i++) {
					// b. The characters that are received by the server are output.
					System.out.println("CLIENT: " + dis.readUTF());
				   // c. The server sends a response to the client that your message has been received.
					System.out.print("SERVER: ");
					String message = input.nextLine();
					dos.writeUTF(message);		
				}
				
				input.close();		
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
				e.printStackTrace();
		} finally {
			try {
				if (listener != null) {
					listener.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
