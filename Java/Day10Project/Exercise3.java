/*3. Write a program to simulate stopping the thread, press any key to force the thread to stop, and print out the reason for termination.
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-16
 */

package pkg_10;

import java.io.IOException;

class MyThread implements Runnable {
	Thread myT;
	
	MyThread() {
		myT = new Thread(this);
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		do {
			//Thread will call new Thread
			// new there keeps running until being interrupted
			try {
				Thread.sleep(100);
				System.out.println("I am a thread. please stop me");	
			} catch (InterruptedException e) {
				System.out.println(e.getMessage());
				e.printStackTrace();
				break;
			} catch (Exception e) {
				e.printStackTrace();
			}
		} while(!Thread.interrupted());
		
	}
}

public class Exercise3 {

	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		
		//create MyThread object
		MyThread td = new MyThread();	
		
		//create a thread from MyThread object
		Thread tt = new Thread(td);
		
		//start execution of the thread
		tt.start();
		
		try {
			//read key
			System.in.read();
			// As soon as user presses key, Thread is stopped at once
			tt.interrupt();
			System.out.println();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	
	}
}
