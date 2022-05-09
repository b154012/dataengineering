/*1.There are three threads: T1, T2 and T3. How do you ensure that T2 is executed after T1 and T3 are executed after T2?
 * 
 * @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-16
 */

package pkg_10;

class Thread123 implements Runnable {
	String threadname;
	
	Thread123(String name) {
		this.threadname = name;
	}
	
	//entry point of thread
	@Override
	public void run() {
		// TODO Auto-generated method stub
		System.out.println(threadname + " is started.");
		try {
			for (int count = 0; count < 3; count++) {
				System.out.println(threadname + " is executing " + count);
				Thread.sleep(400);
			}
		} catch (InterruptedException exc) {
			System.out.println(threadname + " has been interrupted.");
		}
		System.out.println(threadname + " terminated");
	}
	
}


public class Exercise1 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("---Main threads starting---\n");
		
		// construct Thread123 object
		Thread123 th1 = new Thread123("[T1]");
		Thread123 th2 = new Thread123("[T2]");
		Thread123 th3 = new Thread123("[T3]");
		
		// construct a thread from Thread123
		Thread t1 = new Thread(th1);
		Thread t2 = new Thread(th2);
		Thread t3 = new Thread(th3);
		
		// use join
		try {
			
			//first thread
			t1.start();
			t1.join();
			//second thread
			t2.start();
			t2.join();
			//third thread
			t3.start();
			t3.join();
			
		} catch (InterruptedException exc) {
			System.out.println("Main thread interrupted.");
		}
		
		System.out.println("\n---Main thread ending---");
	}

}

