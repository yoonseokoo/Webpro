package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;

public class Ex01_MyFrame extends Frame {
	private Button btn;
	private Button btn1;
	public Ex01_MyFrame(String title) {
		super(title);
		// 버튼 2개를 추가한 frame
		btn = new Button("Button");
		btn1 = new Button("Normal Button");
		add(btn1, BorderLayout.CENTER);
		add(btn, BorderLayout.NORTH);
		// pack(); // To the smallest size
		setSize(new Dimension(300, 200));
		setVisible(true);
		setLocation(100, 50);

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
		}
		setVisible(false);
		dispose();
		System.exit(0);

	} // MAIN 함수
	public static void main(String[] args) {
		new Ex01_MyFrame("First GUI");
	}
}
