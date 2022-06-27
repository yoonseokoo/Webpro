package com.lec.ex1_awt;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.Dimension;
import java.awt.Frame;
import java.awt.Label;
import java.awt.Panel;
import java.awt.TextField;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

public class Ex02Login extends Frame {
	private Panel panel;
	private Label lbl1; // current value: null
	private TextField txtId; // current value: null
	private Label lbl2; // current value: null
	private TextField txtPw; // current value: null
	private Button btnLogin; // current value: null

	public Ex02Login(String title) { // ADD COMPONENETS TO THE FRAME TO EXECUTE
										// EVENT
		super(title);
		// FRAME'S DEFAULT TYPE: BorderLayout ( N/E/S/W, CENTER)
		// OTHER TYPES : FlowLayout (Adds components from left to right & from
		// top to bottom)
		// : GridLayout (using column# and row#)

		panel = new Panel(); // Panel's default layout
		// panel = new Panel(new GridLayout(2, 2));

		lbl1 = new Label("ID"); // In the object Label, giving value "ID"
		txtId = new TextField("ID", 20); // 20: the length of the textbox (the
											// actual ID can b e longer than 20)
		lbl2 = new Label("PASSWORD"); // In the object Label, giving value "ID"
		txtPw = new TextField("PASSWORD", 20);
		txtPw.setEchoChar('*');
		btnLogin = new Button("LOGIN");

		panel.add(lbl1);
		panel.add(txtId);
		panel.add(lbl2);
		panel.add(txtPw);
		panel.setPreferredSize(new Dimension(280, 60));

		add(panel, BorderLayout.NORTH);
		add(btnLogin, BorderLayout.SOUTH);
		setSize(new Dimension(300, 150));
		setLocation(200, 100);
		setVisible(true);
		setResizable(false);

		// when 'x' is clicked, end
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowClosing(WindowEvent e) {
				setVisible(false); // blind everything
				dispose(); // dispose resources
				System.exit(0); // Forcefully terminates
			}
		});

	}

	public Ex02Login() {
		this("");
	}

	// MAIN ÇÔ¼ö
	public static void main(String[] args) {
		new Ex02Login("Login");
	}
}