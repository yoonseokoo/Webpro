package com.lec.ex02_voidAndReturn;

public class Point3D extends Point {
	private int z; // x,y has already been made in class 'Point'

	public Point3D() {
	};

	public Point3D(int x, int y, int z) {
		setX(x);
		setY(y);
		this.z = z;
	}

	public void point3DPrint() {
		System.out.println("[PP]:3D coordinates: x=" + getX() + ", y=" + getY() + ", z=" + z);
	}

	public String info3DPrint() {
		return "[IP]:3D coordinates: x=" + getX() + ", y=" + getY() + ", z=" + z;
	}

	protected int getZ() {
		return z;
	}

	protected void setZ(int z) {
		this.z = z;
	}
}
