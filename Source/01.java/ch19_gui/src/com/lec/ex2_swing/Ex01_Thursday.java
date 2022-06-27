package com.lec.ex2_swing;

import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Ex01_Thursday extends JFrame implements ActionListener {
	private JPanel panel; // save the imported container
	private JLabel jlbl;
	private JButton jbtn;

	public Ex01_Thursday(String title) { // add component in the imported
											// container
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE); // close if user clicks 'x'

		panel = (JPanel) getContentPane();
		panel.setLayout(new FlowLayout());
		jlbl = new JLabel("Have a happy thursday", (int) CENTER_ALIGNMENT);
		jbtn = new JButton("EXIT");

		panel.add(jlbl);
		jlbl.setPreferredSize(new Dimension(150, 200));
		panel.add(jbtn);
		jbtn.setPreferredSize(new Dimension(200, 200));
		setVisible(true);
		setSize(new Dimension(400, 250));
		setLocation(200, 50);

		jbtn.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jbtn) {
			setVisible(false);
			dispose();
			System.exit(0);
			;
		}

	}

	public static void main(String[] args) {
		new Ex01_Thursday("title");

	}
}
