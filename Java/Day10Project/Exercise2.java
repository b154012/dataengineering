/*2.Write a program for the following: Four threads are designed, two of which increase j by 1 each time, and the other two decrease j by 1 each time.
 * 
* @author  Zulmi Yahya
 * @version 1.0
 * @since   2021-08-16
 */

package pkg_10;

class ThreadA extends Thread {
	@Override
	public void run() {
		int val = 0;
		try {
			for(int j = 0; j < 10; j++) {
				val += j;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Thread a - Increase j by 1 each time " + val);
	}
}

class ThreadB extends Thread {
	@Override
	public void run() {
		int val = 0;
		try {
			for(int j = 0; j < 10; j++) {
				val += j;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Thread b - Increase j by 1 each time " + val);
	}
}

class ThreadC extends Thread {
	@Override
	public void run() {
		int val = 0;
		try {
			for(int j = 10; j > 0; j--) {
				val -= j;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Thread c - Decrease j by 1 each time " + val);
	}
}

class ThreadD extends Thread {
	@Override
	public void run() {
		int val = 0;
		try {
			for(int j = 10; j > 0; j--) {
				val -= j;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Thread d - Decrease j by 1 each time " + val);
	}
}

public class Exercise2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ThreadA a = new ThreadA();
		ThreadB b = new ThreadB();
		ThreadC c = new ThreadC();
		ThreadD d = new ThreadD();

		a.start();
		b.start();
		c.start();
		d.start();
	}

}
