package com.lec.ex02_voidAndReturn;

public class TestMain {
	public static void main(String[] args) {
		Point point = new Point(5, 5);
		point.setX(10); // Point(10,5)

		point.pointPrint(); // PointPrint (void)
		System.out.println(point.toString()); // toString (return)
		System.out.println(point); // toString (return)
		Point3D point3d = new Point3D(1, 2, 3);
		System.out.println(point3d.info3DPrint()); // info3DPrint (return)
		point3d.point3DPrint(); // point3DPrint (void)

		// PRINTING VOID METHODS VS METHODS WITH RETURN:

		// System.out.println(**METHODS WITH RETURN VALUES GO HERE**);
		// className.**VOID_METHOD_NAME**

	}
}
