/* *6. Java socket programming based on UDP is used to complete the online consultation function:
 *  a.	The client consulted the consultant.
 *  b.	The consultant gave an answer.
 *  c.	The client and the consultant can communicate until the client sends a bye to the consultant.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-16
 */

package pkg_10;

import java.net.*;
import java.util.*;

public class Exercise6_Client {

	public static void main(String[] args) throws PortUnreachableException, SocketException, UnknownHostException {
		// TODO Auto-generated method stub
		
		Scanner input = new Scanner(System.in);
		
		client(input);	
	}
	
	public static void client(Scanner input) throws UnknownHostException, SocketException {
		InetAddress IP = InetAddress.getByName("localhost");
		DatagramSocket clientSocket = new DatagramSocket();
		int port = 77;
		
		try {
			while(true) {
				byte sendBuffer[] = new byte[1024];
				byte receiveBuffer[] = new byte[1024];
				
				System.out.print("\nClient: ");
				String clientMessage = input.nextLine();
				sendBuffer = clientMessage.getBytes();
					
				// send a datagram packet
				DatagramPacket sendPacket = new DatagramPacket(sendBuffer, sendBuffer.length, IP, port);
				clientSocket.send(sendPacket);
					
				//exit if the client says exit
				if (clientMessage.equalsIgnoreCase("bye")) {
					System.out.println("Connection stopped by the Client.");
					break;
				}
					
				//receive a datagram packet
				DatagramPacket receivePacket = new DatagramPacket(receiveBuffer, receiveBuffer.length);
				//clientSocket.setSoTimeout(100000);
				clientSocket.receive(receivePacket);
				String serverData = new String(receivePacket.getData());
				System.out.print("\nConsultant: " + serverData);	
				
			}
				
		} catch (Exception e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
		} finally {
				try {
					if (clientSocket != null ||
						input != null) {
						clientSocket.close();
						input.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	}

}
