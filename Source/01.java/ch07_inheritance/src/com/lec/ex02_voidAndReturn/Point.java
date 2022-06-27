package com.lec.ex02_voidAndReturn;

public class Point {
	private int x;
	private int y;

	public Point() {
	}

	public Point(int x, int y) {
		this.x = x;
		this.y = y;
	}

	public void pointPrint() { // VOID METHOD
		System.out.println("[PP]: 2D coordination: x=" + x + ", y=" + y);
	}

	public String toString() { // override
		return "[TS]: 2D coordination: x=" + x + ", y=" + y;
	}

	protected int getX() {
		return x;
	}

	protected void setX(int x) {
		this.x = x;
	}

	protected int getY() {
		return y;
	}

	protected void setY(int y) {
		this.y = y;
	}

}
