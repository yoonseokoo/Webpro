package com.lec.ex2_thread;

public class TargetExTestMain {
	public static void main(String[] args) {
		TargetEx01 threadA = new TargetEx01("A");
		TargetEx02 threadB = new TargetEx02();
		threadB.setName("B"); // Setting name separately as TargetEx2 lacks constructor

		// RUNNING THE THREADS
		threadA.start(); // BRANCHES OFF NEW THREAD THREAD AND STARTS RUNNING THE RUN METHOD
		threadB.start();
		System.out.println(Thread.currentThread().getName()); // PRINTS "main" = default name of the main thread
		System.out.println("main function"); // IS PRINTED ONCE SOMEITME BETWEEN A, B, THREAD NAME
	}
}