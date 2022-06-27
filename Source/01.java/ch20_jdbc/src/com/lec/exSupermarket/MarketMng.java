package com.lec.exSupermarket;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class MarketMng extends JFrame implements ActionListener {

	private CustomerDao dao = CustomerDao.getInstance();
	private Container container;
	private JPanel jpup, jpbtn;
	private JTextField txtCid, txtCtel, txtCname, txtCpoint, txtCamount;
	private Vector<String> levelNames;
	private JComboBox<String> comLevelName;
	private JButton btnCidSearch, btnCtelSearch, btnCnameSearch, btnBuyWithPoint;
	private JButton btnBuy, btnLevelNameOuput, btnAllOutput, btnInsert, btnCtelUpdate, btnDelete, btnExit;
	private JTextArea txtPool;
	private JScrollPane scrollPane;

	public MarketMng(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);

		container = getContentPane();
		container.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(6, 3));
		jpbtn = new JPanel();
		txtCid = new JTextField(20);
		txtCtel = new JTextField(20);
		txtCname = new JTextField(20);
		txtCpoint = new JTextField(20);
		txtCamount = new JTextField(20);
		levelNames = dao.getLevelNames();
		comLevelName = new JComboBox<String>(levelNames);

		btnCidSearch = new JButton("아이디 검색");
		btnCtelSearch = new JButton("폰 4 자리 검색");
		btnCnameSearch = new JButton("고객 이름 검색");
		btnBuyWithPoint = new JButton("포인트로 구매");
		btnBuy = new JButton("물품 구매");
		btnLevelNameOuput = new JButton("등급별 출력");
		btnAllOutput = new JButton("전체 출력");
		btnInsert = new JButton("회원가입");
		btnCtelUpdate = new JButton("번호 수정");
		btnDelete = new JButton("회원 탈퇴");
		btnExit = new JButton("나가기");
		txtPool = new JTextArea(6, 70);
		scrollPane = new JScrollPane(txtPool);

		jpup.add(new JLabel("아이디", (int) CENTER_ALIGNMENT));
		jpup.add(txtCid);
		jpup.add(btnCidSearch);
		jpup.add(new JLabel("고객전화", (int) CENTER_ALIGNMENT));
		jpup.add(txtCtel);
		jpup.add(btnCtelSearch);
		jpup.add(new JLabel("고객이름", (int) CENTER_ALIGNMENT));
		jpup.add(txtCname);
		jpup.add(btnCnameSearch);
		jpup.add(new JLabel("포인트", (int) CENTER_ALIGNMENT));
		jpup.add(txtCpoint);
		jpup.add(btnBuyWithPoint);
		jpup.add(new JLabel("구매금액", (int) CENTER_ALIGNMENT));
		jpup.add(txtCamount);
		jpup.add(new JLabel());
		jpup.add(new JLabel("고객등급", (int) CENTER_ALIGNMENT));
		jpup.add(comLevelName);
		jpbtn.add(btnBuy);
		jpbtn.add(btnLevelNameOuput);
		jpbtn.add(btnAllOutput);
		jpbtn.add(btnInsert);
		jpbtn.add(btnCtelUpdate);
		jpbtn.add(btnDelete);
		jpbtn.add(btnExit);
		container.add(jpup);
		container.add(jpbtn);
		container.add(scrollPane);
		setVisible(true);
		setSize(new Dimension(800, 400));
		setLocation(200, 100);
		txtPool.setText("\t\t\t ---PRESS ON THE SERVICE YOU NEED---");

		// 이벤트 추가
		btnCidSearch.addActionListener(this);
		btnCtelSearch.addActionListener(this);
		btnCnameSearch.addActionListener(this);
		btnBuyWithPoint.addActionListener(this);
		btnBuy.addActionListener(this);
		btnLevelNameOuput.addActionListener(this);
		btnAllOutput.addActionListener(this);
		btnInsert.addActionListener(this);
		btnCtelUpdate.addActionListener(this);
		btnDelete.addActionListener(this);
		btnExit.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {

		// [1] SEARCH CUSTOMER WITH ID
		if (e.getSource() == btnCidSearch) {
			txtCtel.setText("");
			txtCname.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			comLevelName.setSelectedItem("");
			int cid;
			try {
				cid = Integer.parseInt(txtCid.getText().trim());
			} catch (Exception e2) {
				txtPool.setText("Please enter a valid customer ID");
				return;
			}

			CustomerDto customer = dao.cIdGetCustomer(cid);
			if (customer != null) {
				txtCtel.setText(customer.getCtel());
				txtCname.setText(customer.getCname());
				txtCpoint.setText(String.valueOf(customer.getCpoint()));
				txtCamount.setText(""); // about to insert the price of purchase
				comLevelName.setSelectedItem(customer.getLevelName());
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업위한추가구매액\n");
				txtPool.append("─────────────────────────────────────────────────────────────\n");
				txtPool.append(customer.toString());

			} else {
				txtPool.setText("This ID cannot be found");
			}
			// [2] SEARCH CUSTOMER WITH NUMBER
		} else if (e.getSource() == btnCtelSearch) {
			txtPool.setText("");
			txtCid.setText("");
			txtCname.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			comLevelName.setSelectedItem("");
			String ctel = txtCtel.getText().trim();
			if (ctel.length() < 4) {
				txtPool.setText("You need to insert at least 4 numbers");
				return;
			}
			ArrayList<CustomerDto> customers = dao.cTelGetCustomer(ctel);
			if (customers.size() != 0) {
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업위한추가구매액\n");
				txtPool.append("─────────────────────────────────────────────────────────────\n");
				for (CustomerDto customer : customers) {
					txtCid.setText(String.valueOf(customer.getCid()));
					txtCname.setText(customer.getCname());
					txtCtel.setText(customer.getCtel());
					txtCpoint.setText(String.valueOf(customer.getCpoint()));
					txtCamount.setText("");
					comLevelName.setSelectedItem(customer.getLevelName());
					txtPool.append(customer.toString() + "\n");
				}

			} else {
				txtPool.setText("Such phone number does not exist. Please Sign up");
				return;
			}

			// [3] SEARCH CUSTOMER WITH NAME
		} else if (e.getSource() == btnCnameSearch) {
			txtPool.setText("");
			txtCid.setText("");
			txtCtel.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			comLevelName.setSelectedItem("");
			String cname = txtCname.getText().trim();
			if (cname.length() < 2) {
				txtPool.setText("A name should be at least  2 letters");
				return;
			}
			ArrayList<CustomerDto> customers = dao.cNameGetCustomer(cname);
			if (customers.size() != 0) {
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업위한추가구매액\n");
				txtPool.append("─────────────────────────────────────────────────────────────\n");
				for (CustomerDto customer : customers) {
					txtCid.setText(String.valueOf(customer.getCid()));
					txtCname.setText(customer.getCname());
					txtCtel.setText(customer.getCtel());
					txtCpoint.setText(String.valueOf(customer.getCpoint()));
					txtCamount.setText("");
					comLevelName.setSelectedItem(customer.getLevelName());
					txtPool.append(customer.toString() + "\n");
				}

			} else {
				txtPool.setText("Customer with this name does not exist. Please Sign up");
				return;
			}
			// [4] PURCAHSE WITH POINT
		} else if (e.getSource() == btnBuyWithPoint) {
			int cid, cpoint, camount;
			try {
				cid = Integer.parseInt(txtCid.getText().trim());
				cpoint = Integer.parseInt(txtCpoint.getText().trim());
				camount = Integer.parseInt(txtCamount.getText().trim());
				if (cpoint < camount) {
					txtPool.setText("You need more points to purchase this item");
					return;
				}
			} catch (Exception e2) {
				txtPool.setText("Please enter a valid id and amount");
				return;
			}
			int result = dao.buyWithPoint(cid, camount);
			if (result == CustomerDao.SUCCESS) {
				txtPool.setText("Point purchase success");
				txtCpoint.setText(String.valueOf(cpoint - camount));
				txtCamount.setText("");
			} else {
				txtPool.setText("Your ID cannot be found. Please check in the customer search section");
			}
		}

		// [5] PURCAHSING
		else if (e.getSource() == btnBuy) {
			int cid, camount, cpoint;
			try {
				cid = Integer.parseInt(txtCid.getText().trim());
				cpoint = Integer.parseInt(txtCpoint.getText().trim());
				camount = Integer.parseInt(txtCamount.getText().trim());
			} catch (NumberFormatException e2) {
				txtPool.setText("Please insert a valid ID/amount to proceed with the purchase");
				return;
			}
			int result = dao.buy(cid, camount);
			if (result == CustomerDao.SUCCESS) {
				txtPool.setText("Purchase successful");
				txtCpoint.setText(String.valueOf(cpoint + (camount * 0.05)));
				txtCamount.setText("");
			} else {
				txtPool.setText("Customer ID is invalid. Please search your ID, prior to the purchase");
			}

			// [6] PRITING BY LEVEL
		} else if (e.getSource() == btnLevelNameOuput) {
			txtPool.setText("");
			txtCid.setText("");
			txtCtel.setText("");
			txtCname.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			String levelName = comLevelName.getSelectedItem().toString();
			if (levelName.length() == 0) {
				txtPool.setText("Please select a Level to search");
				return;
			}
			ArrayList<CustomerDto> customers = dao.levelNameGetCustomer(levelName);
			if (customers.size() != 0) {
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업위한추가구매액\n");
				txtPool.append("─────────────────────────────────────────────────────────────\n");
				for (CustomerDto customer : customers) {
					txtPool.append(customer.toString() + "\n");
				}
				txtPool.append("Total " + customers.size() + " customers");
			} else {
				txtPool.append("There are no customers in this level");
			}
			// [7] PRINT EVERYTHING
		} else if (e.getSource() == btnAllOutput) {
			txtPool.setText("");
			txtCid.setText("");
			txtCname.setText("");
			txtCtel.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			comLevelName.setSelectedItem("");
			ArrayList<CustomerDto> customers = dao.getCustomers();
			if (customers.size() != 0) {
				txtPool.setText("ID\t전화\t\t이름\t포인트\t구매누적액\t고객레벨\t레벨업위한추가구매액\n");
				txtPool.append("─────────────────────────────────────────────────────────────\n");
				for (CustomerDto customer : customers) {
					txtPool.append(customer.toString() + "\n");
				}
				txtPool.append("Total " + customers.size() + " customers");
			} else {
				txtPool.append("There are no customers");
			}
			// [8] INSERT NEW CUSTOMER
		} else if (e.getSource() == btnInsert) {
			txtPool.setText("");
			txtCid.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			comLevelName.setSelectedItem("");
			String cname = txtCname.getText().trim();
			String ctel = txtCtel.getText().trim();
			if (cname.length() < 2 || ctel.length() < 8) {
				txtPool.setText("You MUST enter your name and phone number");
				return;
			}
			int result = dao.insertCustomer(cname, ctel);
			if (result == CustomerDao.SUCCESS) {
				txtPool.setText("customer " + cname + ", thank you for registering. You now have 1000 points");
			}

			// [9] UPDATE PHONE NUMBER
		} else if (e.getSource() == btnCtelUpdate) {
			txtPool.setText("");
			txtCname.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			int cid;
			String ctel;
			try {
				cid = Integer.parseInt(txtCid.getText().trim());
				ctel = txtCtel.getText().trim();
				if (ctel.length() < 8) {
					txtPool.setText("Please check the number");
				}
			} catch (Exception e2) {
				txtPool.setText("You MUST enter a valid ID");
				return;
			}
			int result = dao.updateCustomer(cid, ctel);
			if (result == CustomerDao.SUCCESS) {
				txtPool.setText("Your phone number has been changed");
			} else {
				txtPool.setText("Please search for your ID before changing your number");
			}

			// [10] DELETE ACCOUNT
		} else if (e.getSource() == btnDelete) {
			txtPool.setText("");
			txtCid.setText("");
			txtCname.setText("");
			txtCpoint.setText("");
			txtCamount.setText("");
			comLevelName.setSelectedItem("");
			String ctel = txtCtel.getText().trim();
			if (ctel.length() < 8) {
				txtPool.setText("Telephone Number must be inserted to delete your account");
				return;
			}
			int result = dao.deleteCustomer(ctel);
			if (result == CustomerDao.SUCCESS) {
				txtPool.setText("Account successfully deleted");
				txtCtel.setText("");
			} else {
				txtPool.setText("This number does not exist in our system");
			}

		} else if (e.getSource() == btnExit) {
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}

	public static void main(String[] args) {
		new MarketMng("슈퍼마켓 관리");
	}
}