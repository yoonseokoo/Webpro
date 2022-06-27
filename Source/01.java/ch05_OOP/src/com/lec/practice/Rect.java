package com.lec.practice;

public class Rect {
	private int width;
	private int height;

	public void setWidth(int width) { //CONSTRUCTOR 1
	this.width = width;
	}
	public void setHeight(int height) { //CONSTRUCTOR 2
	this.height = height;
	}
	public int area() { //METHOD 'AREA'
		return width*height;
	}
	public int getWidth() {
	return width;
	}

	public int getHeight() { 
	return height; 
	}
}