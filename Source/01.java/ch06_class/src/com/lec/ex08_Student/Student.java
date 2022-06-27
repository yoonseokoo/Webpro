package com.lec.ex08_Student;

public class Student {
	private String name;
	private int num;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	public static int count = 0;

	public Student() {
	}

	public Student(String name, int kor, int eng, int mat) {
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
		tot = kor + eng + mat;
		avg = tot / 3.0;
	}

	public void print() {
		num = ++count;
		System.out.printf("\t %d \t %s \t %d \t %d \t %d \t %d \t %.1f\n", num, name, kor, eng, mat, tot, avg);
	}

	public void printnum() {
		System.out.println("\t" + num + "\n");
	}

	public String infoString() {
		return String.format("\t %d \t %s \t %d \t %d \t %d \t %d \t %.1f\n", num, name, kor, eng, mat, tot, avg);
	}

	public String getName() {
		return name;
	}

	public int getNum() {
		return num;
	}

	public int getKor() {
		return kor;
	}

	public int getEng() {
		return eng;
	}

	public int getMat() {
		return mat;
	}

	public int getTot() {
		return tot;
	}

	public double getAvg() {
		return avg;
	}
}