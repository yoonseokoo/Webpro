package com.lec.ex04_object;

public class ex03_Point3DClass implements Cloneable {
	private double x;
	private double y;
	private double z;

	public ex03_Point3DClass() {
	}

	public ex03_Point3DClass(double x, double y, double z) {
		this.x = x;
		this.y = y;
		this.z = z;
	}

	@Override
	public boolean equals(Object obj) { // Overriding equals method to compare address
		if (obj != null && obj instanceof ex03_Point3DClass) {
			boolean xBool = (x == ((ex03_Point3DClass) obj).x);
			boolean yBool = (y == ((ex03_Point3DClass) obj).y);
			boolean zBool = (z == ((ex03_Point3DClass) obj).z);
			return xBool && yBool && zBool;
		}
		return false;
	}

	@Override
	public String toString() {
		return "Coordination [" + x + ", " + y + ", " + z + "]";
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}
}