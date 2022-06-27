package com.lec.ex04_object;

public class ex02_RectangleClass implements Cloneable {
	private int width;
	private int height;
	private String color;

	public ex02_RectangleClass() {
		color = "Black";
	}

	public ex02_RectangleClass(int width, int height) {
		this.width = width;
		this.height = height;
		color = "Black";
	}

	public ex02_RectangleClass(int width, int height, String color) {
		this.width = width;
		this.height = height;
		this.color = color;
	}

	@Override
	public String toString() {
		return String.format("%s rectangle with width %dcm and height %dcm", color, width, height);
	}

	@Override
	public boolean equals(Object obj) {
		if (obj != null && obj instanceof ex02_RectangleClass) {
			ex02_RectangleClass tempObj = (ex02_RectangleClass) obj;
			boolean widthChk = width == tempObj.width;
			boolean heightChk = height == tempObj.height;
			boolean colorChk = color.equals(tempObj.color);
			return widthChk && heightChk && colorChk;
		} else {
			return false;
		}
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public void setHeight(int height) {
		this.height = height;
	}
}
