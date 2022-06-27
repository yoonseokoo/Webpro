package com.lec.quiz;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class Quiz1_GUI extends JFrame implements ActionListener {

	private Container contenPane; // Variable brought from container
	private JPanel jpInfo;
	private JTextField jtxtName, jtxtTel, jtxtAge;
	private JPanel jpAction;
	private ImageIcon iconIn; // The 'print' icon that will go in the button
	private JButton jbtnIn;
	private ImageIcon iconOut;
	private JButton jbtnOut;
	private int cnt;
	ArrayList<Person> people = new ArrayList<Person>();
	public Quiz1_GUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane();
		jpInfo = new JPanel(new GridLayout(3, 2));
		jtxtName = new JTextField();
		jtxtTel = new JTextField();
		jtxtAge = new JTextField();
		jpAction = new JPanel(new FlowLayout());
		iconIn = new ImageIcon("icon/join.png");
		jbtnIn = new JButton("Input", iconIn);
		iconOut = new ImageIcon("icon/output.png");
		jbtnOut = new JButton("Print", iconOut);

		contenPane.add(jpInfo, BorderLayout.NORTH);
		contenPane.add(jpAction, BorderLayout.SOUTH);

		jpInfo.setPreferredSize(new Dimension(150, 150));
		jpInfo.add(new JLabel("NAME", (int) CENTER_ALIGNMENT));
		jpInfo.add(jtxtName);
		jpInfo.add(new JLabel("TEL", (int) CENTER_ALIGNMENT));
		jpInfo.add(jtxtTel);
		jpInfo.add(new JLabel("AGE", (int) CENTER_ALIGNMENT));
		jpInfo.add(jtxtAge);

		jpAction.add(jbtnIn);
		jpAction.add(jbtnOut);
		jbtnIn.setPreferredSize(new Dimension(150, 100));
		jbtnOut.setPreferredSize(new Dimension(150, 100));

		setVisible(true);
		setBounds(200, 100, 400, 300);
		jbtnOut.addActionListener(this);
		jbtnIn.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jbtnIn) {
			String name = jtxtName.getText().trim();
			String tel = jtxtTel.getText().trim();
			if (name.equals("") || tel.equals("")) {
				System.out.println("You must enter a name and a phone number");
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
				System.out.println("Not a valid age");
			}
			System.out.println(++cnt + "people have inserted their info");
			people.add(new Person(name, tel, age));
			jtxtName.setText("");
			jtxtTel.setText("");
			jtxtAge.setText("");
		} else if (e.getSource() == jbtnOut) {
			OutputStream os = null;
			try {
				os = new FileOutputStream("src/com/lec/quiz/person.txt");
				for (Person p : people) {
					byte[] bs = p.toString().getBytes();
					System.out.print(p);
					os.write(bs);
				}
				String msg = String.format("\n...%d person has registered\n\n",
						people.size());
				System.out.println(msg);
				os.write(msg.getBytes());
			} catch (FileNotFoundException e2) {
				System.out
						.println("File could not be found " + e2.getMessage());
			} catch (IOException e2) {
				System.out.println("Exception" + e2.getMessage());
			} finally {
				try {
					if (os != null)
						os.close();
				} catch (Exception ignore) {
					System.out.println(ignore.getMessage());
				}
			}

		}

	}
}