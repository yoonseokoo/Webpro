package com.lec.test;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class CustomerMng extends JFrame implements ActionListener {
	private CustomerDao dao = CustomerDao.getInstance();
	private Container contenPane;
	private JPanel jpup, jpdown;
	private JTextField txtPhone, txtName, txtPoint;
	private JButton btnJoin, btnSearch, btnOutput, btnExit;
	private JTextArea jta;
	private JScrollPane scrollPane;

	public CustomerMng(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane();
		contenPane.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(3, 2));
		jpdown = new JPanel(new GridLayout(1, 4));
		txtPhone = new JTextField(15);
		txtName = new JTextField(15);
		txtPoint = new JTextField(15);
		btnJoin = new JButton("가입");
		btnSearch = new JButton("폰조회");
		btnOutput = new JButton("출력");
		btnExit = new JButton("종료");
		jta = new JTextArea(15, 30);
		scrollPane = new JScrollPane(jta);
		jpup.add(new JLabel("폰번호", (int) CENTER_ALIGNMENT));
		jpup.add(txtPhone);
		jpup.add(new JLabel("이  름", (int) CENTER_ALIGNMENT));
		jpup.add(txtName);
		jpup.add(new JLabel("포인트", (int) CENTER_ALIGNMENT));
		jpup.add(txtPoint);
		jpdown.add(btnJoin);
		jpdown.add(btnSearch);
		jpdown.add(btnOutput);
		jpdown.add(btnExit);

		contenPane.add(jpup);
		contenPane.add(jpdown);
		contenPane.add(scrollPane);
		setVisible(true);
		setSize(new Dimension(400, 450));
		setLocation(200, 100);
		jta.setText("                      PRESS ON THE SERVICE YOU NEED");

		// 이벤트 추가

		btnJoin.addActionListener(this);
		btnSearch.addActionListener(this);
		btnOutput.addActionListener(this);
		btnExit.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// [1] 가입:

		if (e.getSource() == btnJoin) {
			jta.setText("");
			txtPoint.setText("");
			String cname = txtName.getText().trim();
			String ctel = txtPhone.getText().trim();

			if (cname.length() < 2 || ctel.length() < 8) {
				jta.setText("You MUST enter a valid name and phone number");
				return;
			}
			int result = dao.insertCustomer(ctel, cname);
			if (result == CustomerDao.SUCCESS) {
				jta.setText("customer " + cname + ", thank you for registering.\nYou now have 1000 points");
			}

			// [2] 폰 뒤4자리 OR 폰전체로, 회원 조회 **
		} else if (e.getSource() == btnSearch) {
			jta.setText("");
			txtName.setText("");
			txtPoint.setText("");
			String ctel = txtPhone.getText().trim();
			if (ctel.length() < 4) {
				jta.setText("You need to insert at least 4 numbers");
				return;
			}
			ArrayList<CustomerDto> customers = dao.cTelGetCustomer(ctel);
			if (customers.size() == 1) {
				for (CustomerDto customer : customers) {
					txtName.setText(customer.getCname());
					txtPhone.setText(customer.getCtel());
					txtPoint.setText(String.valueOf(customer.getCpoint()));
				}

			} else if (customers.size() > 1) {
				txtName.setText("");
				txtPhone.setText("");
				txtPoint.setText("");
				jta.setText("전화\t\t이름\t포인트\n");
				jta.append("─────────────────────────────\n");
				for (CustomerDto customer : customers) {
					jta.append(customer.toString() + "\n");
				}
			} else {
				jta.setText("Such phone number does not exist. Please Sign up");
				return;
			}
			// [3] 가입된 모든 회원정보 출력
		} else if (e.getSource() == btnOutput) {
			jta.setText("");
			txtName.setText("");
			txtPhone.setText("");
			txtPoint.setText("");

			ArrayList<CustomerDto> customers = dao.getCustomers();
			if (customers.size() != 0) {
				jta.setText("전화\t\t이름\t포인트\n");
				jta.append("──────────────────────────\n");
				for (CustomerDto customer : customers) {
					jta.append(customer.toString() + "\n");
				}
				jta.append("Total " + customers.size() + " customers");
			} else {
				jta.append("There are no customers");
			}
		} else if (e.getSource() == btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}

	}

	public static void main(String[] args) {
		new CustomerMng("회원관리");
	}
}
