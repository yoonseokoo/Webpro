package com.lec.ex3_synchronized;

public class TargetEx implements Runnable {
	private int num = 0;

	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			out(); // it goes to the synchronized method
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
			}
		}
	}

	private synchronized void out() {
		if (Thread.currentThread().getName().equals("A")) {// When "A" is called
			System.out.println("~ ~ ~ 'A' Thread in process ~ ~ ~");
			num++;
		}
		System.out.println(Thread.currentThread().getName() + "ÀÇ num = " + num); // is processed for both A and B
	}
}// class