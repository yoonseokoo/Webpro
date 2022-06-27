package com.lec.ex2_swing;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class Ex02 extends JFrame implements ActionListener {

	// Add the variable components that are needed
	private Container contenPane; // Variable brought from container
	private ImageIcon icon; // The icon that will go in the button
	private JButton jBtn;
	private JTextField jtxtField;
	private Vector<String> items; // Item list, to be added to combo-box
	private String[] item = { "A", "B", "C" };
	private JComboBox<String> jCombo;
	private JCheckBox jCheck;
	private JLabel jlBlank;
	private JButton jBtnExit;

	// constructor: get container and add -> setVisible, set Size
	public Ex02() {
		setDefaultCloseOperation(EXIT_ON_CLOSE); // close if 'x' is pressed
		contenPane = getContentPane();
		contenPane.setLayout(new FlowLayout());
		icon = new ImageIcon("icon/write.gif"); // since icon is in this folder,
												// we don't need to write the
												// whole path
		jBtn = new JButton("Button", icon);
		jtxtField = new JTextField(20);
		// jcombo = new JComboBox<String> (item); How to add list in combo-box -
		// 1. String array (has set items)
		items = new Vector<String>();
		items.add("A");
		items.add("B");
		items.add("C");
		jCombo = new JComboBox<String>(items);
		jCheck = new JCheckBox("CheckBox");
		jlBlank = new JLabel("");
		jBtnExit = new JButton("Exit");

		// Adding components and adjust component size
		contenPane.add(new JLabel("Label"));
		contenPane.add(jBtn);
		contenPane.add(jtxtField);
		contenPane.add(jCombo);
		contenPane.add(jCheck);
		contenPane.add(jlBlank);
		contenPane.add(jBtnExit);
		jBtn.setPreferredSize(new Dimension(200, 50));
		jtxtField.setPreferredSize(new Dimension(300, 50));
		jCombo.setPreferredSize(new Dimension(100, 50));
		jCheck.setPreferredSize(new Dimension(100, 50));
		jlBlank.setPreferredSize(new Dimension(200, 50));
		jBtnExit.setPreferredSize(new Dimension(100, 50));
		setVisible(true);
		pack(); // adjust everything to the most efficient size
		setLocation(100, 50);

		jBtn.addActionListener(this);
		jCombo.addActionListener(this);
		jCheck.addActionListener(this);
		jBtnExit.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == jBtn) {
			String temp = jtxtField.getText().trim().toUpperCase();
			if (temp.equals("")) {
				System.out.println("ERROR");
				return;
			}
			jCombo.addItem(temp);
			jlBlank.setText(jtxtField.getText().trim());
			jtxtField.setText("");

		} else if (e.getSource() == jCombo) {
			String temp = jCombo.getSelectedItem().toString();
			int no = jCombo.getSelectedIndex();
			jlBlank.setText(no + " ¹ø¤Š " + temp + " ¼±ÅÃ");
			jCombo.setSelectedItem("A");

		} else if (e.getSource() == jCheck) {
			if (jCheck.isSelected()) {
				jlBlank.setText(jCheck.getText());
			} else {
				jlBlank.setText("");
			}
		} else if (e.getSource() == jBtnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}

	public static void main(String[] args) {
		new Ex02();
	}
}
