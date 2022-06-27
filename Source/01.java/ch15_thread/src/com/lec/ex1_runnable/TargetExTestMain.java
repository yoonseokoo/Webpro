package com.lec.ex1_runnable;

public class TargetExTestMain {
	public static void main(String[] args) {
		Runnable target1 = new TargetEx01();
		Thread threadA = new Thread(target1, "A");
		Runnable target2 = new TargetEx02();
		Thread threadB = new Thread(target2, "B");
		threadA.start();
		threadB.start();
		for (int i = 0; i < 10; i++) {
			System.out.println("This is " + Thread.currentThread().getName() + i);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}
	}
}
