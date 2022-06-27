package com.lec.ex07_timer;

import java.util.Timer;
import java.util.TimerTask;

public class TimerTestMain {
	public static void main(String[] args) throws InterruptedException {
		System.out.println("Start");
		Timer timer = new Timer(true); // 프로그램이 끝나도 계속 timer상주
		TimerTask task1 = new TimerTaskEx1();
		TimerTask task2 = new TimerTaskEx2();
		timer.schedule(task1, 2000); // run task1.run() after 2 seconds (2000 millisecs = 2 seconds)
		timer.schedule(task2, 1000, 500); // After 1 second, run task2.run() every 0.5 seconds
		Thread.sleep(5000);// After 5 seconds, stop
		System.out.println("END");
	}
}