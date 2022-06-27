package com.lec.ex2_swing;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class Ex03_GUI extends JFrame implements ActionListener {
	// COMPONENT OBJECT VARIABLES DECLARATION, ARRAYLIST VARIABLE, STREAM(FOR
	// FILE IO), DB VARIABLE

	private Container contenPane; // Variable brought from container
	private JPanel jp;
	private JTextField jtxtName, jtxtTel, jtxtAge;
	private ImageIcon icon; // The 'print' icon that will go in the button
	private JButton jbtnOut;
	private JTextArea jtxtarea; // 여러줄에 출력할때
	private JScrollPane scrollBar;
	private int cnt;

	// CONSTRUCTOR: PULL IN CONTAINER, DO LAYOUT SETTING, MAKING COMPONENT
	// OBJECT AND ADD

	public Ex03_GUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane(); // no need to set this layout as the
										// default (BorderLayout()) is what we
										// want
		jp = new JPanel(new GridLayout(3, 2)); // panel's default layout is
												// flowLayout()
		jtxtName = new JTextField(); // with grid layout, it automatically sets
										// the size of the txtbox
		jtxtTel = new JTextField();
		jtxtAge = new JTextField();
		icon = new ImageIcon("icon/output.png");
		jbtnOut = new JButton("Print", icon);
		jtxtarea = new JTextArea(5, 30);
		scrollBar = new JScrollPane(jtxtarea);
		jp.add(new JLabel("NAME", (int) CENTER_ALIGNMENT));
		jp.add(jtxtName);
		jp.add(new JLabel("TEL", (int) CENTER_ALIGNMENT));
		jp.add(jtxtTel);
		jp.add(new JLabel("AGE", (int) CENTER_ALIGNMENT));
		jp.add(jtxtAge);
		contenPane.add(jp, BorderLayout.NORTH);
		contenPane.add(jbtnOut, BorderLayout.CENTER);
		contenPane.add(scrollBar, BorderLayout.SOUTH);
		setVisible(true);
		// setSize(new Dimension(400, 300));
		// setLocation(200, 100);
		setBounds(200, 100, 400, 300);

		// ADD EVENT
		jbtnOut.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) { // EVENT LOGIC
		if (e.getSource() == jbtnOut) { // PRINT jtxtName, jtxtTel, jtxtAge,
										// THAT THE USER INSERTED IN jtxtarea
			String name = jtxtName.getText().trim();
			String tel = jtxtTel.getText().trim();
			if (name.equals("") || tel.equals("")) {
				System.out.println("You must enter a name and a phone number");
				return;
			}
			if (tel.indexOf("-") == tel.lastIndexOf("-") || tel.indexOf("-") < 2 || tel.lastIndexOf("-") > 10) {
				System.out.println(("Please check your phone number"));
				return;
			}
			int age = 0;
			try {
				age = Integer.parseInt(jtxtAge.getText());
				if (age < 0 || age > 150) {
					System.out.println("Not a valid age");
					age = 0;
				}
			} catch (Exception e1) {
				System.out.println("Not a valid age"); // IF AN INVALID AGE IS
														// INSERTED BYT HE USER,
														// 0 IS PRINTED
			}
			System.out.println(++cnt + "people have inserted their info");
			if (cnt == 1) {
				jtxtarea.setText("이름\t전화\t\t나이\n");
			}
			jtxtarea.append(name + "\t" + tel + "\t\t" + age + "\n"); // ADDING
																		// MORE
																		// INFO
																		// TO
																		// THE
																		// jtxtarea
			jtxtName.setText("");
			jtxtTel.setText("");
			jtxtAge.setText("");

		}

	}

	public static void main(String[] args) {
		new Ex03_GUI("Final Example:");
	}

}
