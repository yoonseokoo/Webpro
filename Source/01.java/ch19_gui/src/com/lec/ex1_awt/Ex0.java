package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;

public class Ex0 {
	public static void main(String[] args) {
		Frame frame = new Frame("Java's first GUI"); // layout type of 'frame'
		Button btn = new Button("Button");
		frame.add(btn, BorderLayout.NORTH); // adding button in the north side
		Button btn1 = new Button("Button");
		frame.add(btn1, BorderLayout.CENTER);

		frame.setSize(new Dimension(300, 200));
		frame.setVisible(true);
		frame.setLocation(100, 50);

		// after 3 second, closet the window
		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
		}
		frame.setVisible(false);
		frame.dispose();
		System.exit(0);

	}
}
