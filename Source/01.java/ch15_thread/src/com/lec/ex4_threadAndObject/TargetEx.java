package com.lec.ex4_threadAndObject;

public class TargetEx implements Runnable {
	private int num = 0;

	@Override
	public void run() {
		for (int i = 0; i < 10; i++) {
			if (Thread.currentThread().getName().equals("A")) {// "A"�������� ���
				System.out.println("~ ~ ~ A ������ ������ ~ ~ ~");
				num++;
			}
			System.out.println(Thread.currentThread().getName() + "�� num = " + num);
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}
	}

	public int getNum() {
		return num;
	}
}
