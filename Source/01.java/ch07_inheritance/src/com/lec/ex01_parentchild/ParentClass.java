package com.lec.ex01_parentchild;

public class ParentClass {

	private int i;
	private int j;

	public ParentClass() {
		System.out.println("PARENT CONSTRUCTOR");
	}

	public ParentClass(int i, int j) {
		this.i = i;
		this.j = j;
		System.out.println("PARENT CONSTRUCTOR WITH 2 PARAMETER");

	}

	public void getPapiName() {
		System.out.println("Dad: Mr Gianni\n");
	}

	public void getMamiName() {
		System.out.println("Mum: Mrs Gianni\n");
	}

	protected int getI() {
		return i;
	}

	protected void setI(int i) {
		this.i = i;
	}

	protected int getJ() {
		return j;
	}

	public void setJ(int j) {
		this.j = j;
	}
}
