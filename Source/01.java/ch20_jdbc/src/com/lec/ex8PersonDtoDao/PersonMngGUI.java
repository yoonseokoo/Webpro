package com.lec.ex8PersonDtoDao;

import java.awt.Container;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class PersonMngGUI extends JFrame implements ActionListener {
	// COMPONENTS THAT WILL SHOW ON SCREEN
	private Container contenPane;
	private JPanel jpup, jpbtn;
	private JTextField txtName, txtKor, txtEng, txtMat;
	private Vector<String> jnames;
	private JComboBox<String> comJob;
	private JButton btnInput, btnSearch, btnOutput, btnExit;
	private JTextArea txtPool;
	private JScrollPane scrollPane;

	// REGARDING DATABASE
	PersonDao dao = PersonDao.getInstance();
	private ArrayList<PersonDto> person;

	public PersonMngGUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane();
		contenPane.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(5, 2));
		jpbtn = new JPanel();
		txtName = new JTextField(20);
		jnames = dao.jnamelist();
		comJob = new JComboBox<String>(jnames);
		txtKor = new JTextField(20);
		txtEng = new JTextField(20);
		txtMat = new JTextField(20);
		ImageIcon icon1 = new ImageIcon("icon/join.png");
		btnInput = new JButton("INSERT", icon1);
		ImageIcon icon2 = new ImageIcon("icon/search.png");
		btnSearch = new JButton("JOB SEARCH", icon2);
		ImageIcon icon3 = new ImageIcon("icon/output.png");
		btnOutput = new JButton("PRINT INFO", icon3);
		ImageIcon icon4 = new ImageIcon("icon/exit.png");
		btnExit = new JButton("END", icon4);

		btnInput.setPreferredSize(new Dimension(150, 50));
		btnSearch.setPreferredSize(new Dimension(150, 50));
		btnOutput.setPreferredSize(new Dimension(150, 50));
		btnExit.setPreferredSize(new Dimension(150, 50));
		txtPool = new JTextArea(10, 60);
		scrollPane = new JScrollPane(txtPool);
		jpup.add(new JLabel("ename", (int) CENTER_ALIGNMENT));
		jpup.add(txtName);
		jpup.add(new JLabel("job", (int) CENTER_ALIGNMENT));
		jpup.add(comJob);
		jpup.add(new JLabel("kor", (int) CENTER_ALIGNMENT));
		jpup.add(txtKor);
		jpup.add(new JLabel("eng", (int) CENTER_ALIGNMENT));
		jpup.add(txtEng);
		jpup.add(new JLabel("maths", (int) CENTER_ALIGNMENT));
		jpup.add(txtMat);
		jpbtn.add(btnInput);
		jpbtn.add(btnSearch);
		jpbtn.add(btnOutput);
		jpbtn.add(btnExit);
		contenPane.add(jpup);
		contenPane.add(jpbtn);
		contenPane.add(scrollPane);
		setSize(new Dimension(700, 450));
		setLocation(200, 150);
		setVisible(true);
		btnInput.addActionListener(this);
		btnSearch.addActionListener(this);
		btnOutput.addActionListener(this);
		btnExit.addActionListener(this);
	}

	public static void main(String[] args) {
		new PersonMngGUI("연예인 성적 관리");

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == btnInput) { // PUTTING IN txtName, comJOb, txrKor, txtEng, txtMat VALUES IN THE DB
			String pname = txtName.getText();
			String jname = comJob.getSelectedItem().toString();
			String korStr = txtKor.getText();
			String engStr = txtEng.getText();
			String matStr = txtMat.getText();
			if (pname.equals("") || jname.equals("") || korStr.equals("") || engStr.equals("") || matStr.equals("")) {
				txtPool.setText("You MUST enter all fields to proceed");
				return;
			}
			int kor = Integer.parseInt(korStr);
			int eng = Integer.parseInt(engStr);
			int mat = Integer.parseInt(matStr);
			PersonDto newPerson = new PersonDto(pname, jname, kor, eng, mat);
			int result = dao.insertPerson(newPerson);
			if (result == PersonDao.SUCCESS) {
				txtPool.setText("Your information has been saved");
				txtName.setText("");
				comJob.setSelectedIndex(0); // 콤보박스를 0번째 선택
				comJob.setSelectedItem(""); // 콤보박스를 ""이 있는 것으로 선택
				txtKor.setText("");
				txtEng.setText("");
				txtMat.setText("");
			}

		} else if (e.getSource() == btnSearch) {
			String jname = comJob.getSelectedItem().toString();

			if (jname.equals("") || jname.equals("")) {
				txtPool.append("You must pick a JOB to search");
				return;
			}
			person = dao.selectJname(jname);
			if (person.size() != 0) {
				txtPool.setText("RANK\tPNAME\tJNAME\tKOR\tENG\tMAT\tSUM\n");
				for (PersonDto dto : person) {
					txtPool.append(dto.toString() + "\n");
					System.out.println(dto);
				}
			} else {
				System.out.println("There is not person in this field");
			}

		} else if (e.getSource() == btnOutput) {
			person = dao.selectAll();
			if (person.size() != 0) {
				txtPool.setText("RANK\tPNAME\tJNAME\tKOR\tENG\tMAT\tSUM\n");
				for (PersonDto dto : person) {
					txtPool.append(dto.toString() + "\n");
					System.out.println(dto);
				}
			} else {
				System.out.println("There is not person in this field");
			}

		} else if (e.getSource() == btnExit) {
		}
	}
}
