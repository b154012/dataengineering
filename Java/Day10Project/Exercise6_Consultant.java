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

public class Exercise6_Consultant {

	public static void main(String[] args) throws SocketException {
		// TODO Auto-generated method stub
		
		Scanner input = new Scanner(System.in);
		
		consultant(input);
	}
	
	public static void consultant(Scanner input) throws SocketException {
		// create a datagram socket and binds it with the given port number
				// which is 77
				DatagramSocket consultantSocket = new DatagramSocket(77);
				
				System.out.println("Consultant is ready to talk with the client.");
				try {
					while(true) {
						
						byte sendBuffer[] = new byte[1024];
						byte receiveBuffer[] = new byte[1024];
						
						// receive a datagram packet from the client
						DatagramPacket receiveThePacket = new DatagramPacket(receiveBuffer, receiveBuffer.length);
						consultantSocket.receive(receiveThePacket);
						
						// obtain the IP address from the Client's packet
						InetAddress IP = receiveThePacket.getAddress();
						// retrieve the porn number of the Client's port
						int portNo = receiveThePacket.getPort();
						
						String clientMessage = new String(receiveThePacket.getData());
						
							
						System.out.print("\nClinet: " + clientMessage);
						System.out.print("\nConsultant: ");
						
						String consultantData = input.nextLine();	
						sendBuffer = consultantData.getBytes();
						DatagramPacket sendThePacket = new DatagramPacket(sendBuffer, sendBuffer.length, IP, portNo);
						consultantSocket.send(sendThePacket);
						
						if (consultantData.equalsIgnoreCase("bye")) {
							System.out.println("Connection stopped by the Consultant");
							break;
						}
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				} finally {
					try {
						if (consultantSocket != null ||
							input != null) {
							consultantSocket.close();
							input.close();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
		}
}
