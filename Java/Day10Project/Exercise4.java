/*4. Write a Java program to implement multithreading, output the name of the thread in the thread, output once every 300 milliseconds, and output 20 times.
 *
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-16
 */

package pkg_10;

class MultiThread implements Runnable {
	Thread thd;
	
	MultiThread() {
		thd = new Thread(this);
	}
	
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		for(int i=0; i < 20; i++) {
			System.out.println("---------------------------------");
			try {
				Thread.sleep(300);
				int val = i + 1;
				// name of the thread in the thread
				System.out.println(Thread.currentThread().getName() + " [" + val + "]");
			} catch (InterruptedException exc) {
				System.out.println("Main thread interrupted");
			}
		}
		
		System.out.println("\n---Main threads ending---");	
	}	
}

public class Exercise4 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("---Main threads starting---\n");
		
		//create MultiThread object
		MultiThread multi = new MultiThread();
		
		//create a thread from that object
		Thread multiThread = new Thread(multi);
		
		// start executing the thread
		multiThread.start();
	}
}
