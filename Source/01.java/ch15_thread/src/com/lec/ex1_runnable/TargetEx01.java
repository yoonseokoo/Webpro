package com.lec.ex1_runnable;

public class TargetEx01 implements Runnable { // implements an interface
												// Runnable
	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			System.out.println(Thread.currentThread().getName() + i);
			try {
				Thread.sleep(500); // it will sleep the main thread for 0.5 sec
									// ,each time the for loop runs
			} catch (InterruptedException e) {
			}
		}
	}
}