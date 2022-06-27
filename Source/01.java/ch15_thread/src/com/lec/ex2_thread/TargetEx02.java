package com.lec.ex2_thread;

public class TargetEx02 extends Thread {

	// NO CONSTRUCTOR
	// NO METHOD TO RECEIVE NAME

	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			System.out.println(Thread.currentThread().getName());
			System.out.println("TargetEx02's run method " + i);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}
	}
}