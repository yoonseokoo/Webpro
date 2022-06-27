package com.lec.exStudent;

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

public class StudentMngGUI extends JFrame implements ActionListener {
	// DB관련
	private StudentDao dao = StudentDao.getInstance();
	// 화면구현
	private Container contenPane;
	private JPanel jpup, jpbtn;
	private JTextField txtSNo, txtSName, txtScore;
	private Vector<String> mNames; // 콤보박스에 들어갈 전공리스트를 담을 vector
	private JComboBox<String> comMname;
	private JButton btnSNoSearch, btnSNameSearch, btnMNameSearch;
	private JButton btnInput, btnUpdate;
	private JButton btnStudentOut, btnExpelOut, btnExpel, btnExit;
	private JTextArea txtPool;
	private JScrollPane scrollPane;

	public StudentMngGUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane(); // 화면구현
		contenPane.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(4, 3));
		jpbtn = new JPanel(new FlowLayout());
		txtSNo = new JTextField(10);
		txtSName = new JTextField(10);
		mNames = dao.getMNamelist();
		comMname = new JComboBox<String>(mNames);
		txtScore = new JTextField(10);
		btnSNoSearch = new JButton("학번검색");
		btnSNameSearch = new JButton("이름검색");
		btnMNameSearch = new JButton("전공검색");
		btnInput = new JButton("학생입력");
		btnUpdate = new JButton("학생수정");
		btnStudentOut = new JButton("학생출력");
		btnExpelOut = new JButton("제적자출력");
		btnExpel = new JButton("제적처리");
		btnExit = new JButton("종료");
		txtPool = new JTextArea(10, 50);
		scrollPane = new JScrollPane(txtPool);
		jpup.add(new JLabel("학번", (int) CENTER_ALIGNMENT));
		jpup.add(txtSNo);
		jpup.add(btnSNoSearch);
		jpup.add(new JLabel("이름", (int) CENTER_ALIGNMENT));
		jpup.add(txtSName);
		jpup.add(btnSNameSearch);
		jpup.add(new JLabel("전공", (int) CENTER_ALIGNMENT));
		jpup.add(comMname);
		jpup.add(btnMNameSearch);
		jpup.add(new JLabel("점수", (int) CENTER_ALIGNMENT));
		jpup.add(txtScore);
		jpbtn.add(btnInput);
		jpbtn.add(btnUpdate);
		jpbtn.add(btnStudentOut);
		jpbtn.add(btnExpelOut);
		jpbtn.add(btnExpel);
		jpbtn.add(btnExit);
		contenPane.add(jpup);
		contenPane.add(jpbtn);
		contenPane.add(scrollPane);
		setSize(new Dimension(600, 400));
		setLocation(200, 150);
		setVisible(true);
		btnSNoSearch.addActionListener(this);
		btnSNameSearch.addActionListener(this);
		btnMNameSearch.addActionListener(this);
		btnInput.addActionListener(this);
		btnUpdate.addActionListener(this);
		btnStudentOut.addActionListener(this);
		btnExpelOut.addActionListener(this);
		btnExpel.addActionListener(this);
		btnExit.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == btnSNoSearch) { // 학번검색
			// 학번입력란을 제외하고 기본으로 비운다
			txtSName.setText("");
			txtScore.setText("");
			comMname.setSelectedIndex(0); // comMname.setSelectedItem("");
			// 학번 검색 : txtSNo 를 받아 학번 검색하여 txtSName, comMname, txtScore에 넣어준다
			String sNo = txtSNo.getText().trim();
			if (sNo.length() == 0) { // 학번을 입력하지 않은 경우
				txtPool.setText("학번을 입력 후 학번 검색하세요");
				return;
			}
			StudentDto dto = dao.sNogetStudent(sNo); // 학번으로 검색한 결과 받기
			if (dto != null) { // 해당 학번이 DB에 있는 경우
				txtSName.setText(dto.getsName());
				comMname.setSelectedItem(dto.getmName());
				// txtScore.setText(""+dto.getScore()); // ""+100 => "100"
				txtScore.setText(String.valueOf(dto.getScore()));
				txtPool.setText(sNo + "번 검색 완료");
			} else { // 해당 학번이 DB에 없는 경우
				txtPool.setText(sNo + "번 학번은 유효하지 않습니다");
			}
		} else if (e.getSource() == btnSNameSearch) { // 이름검색
			// 이름입력란을 제외하고 기본으로 비운다
			txtSNo.setText("");
			txtScore.setText("");
			comMname.setSelectedIndex(0);
			// txtSName.getText() 를 받아 이름 검색
			// arraylist size확인하여, 검색한 결과가 없는 경우, 한명인 경우, 두명이상 인경우 결과가 다르다
			String sName = txtSName.getText().trim();
			if (sName.length() == 0) { // 이름을 입력하지 않은 경우
				txtPool.setText("이름을 입력 후 이름 검색하세요");
				return;
			}
			ArrayList<StudentDto> students = dao.sNamegetStudent(sName);
			if (students.size() == 0) {
				txtPool.setText("해당 이름의 학생이 없습니다");
			} else if (students.size() == 1) {
				txtSNo.setText(students.get(0).getsNo());
				comMname.setSelectedItem(students.get(0).getmName());
				txtScore.setText(String.valueOf(students.get(0).getScore()));
				txtPool.setText(sName + " 검색 완료");
			} else {
				txtPool.setText("\t학번\t이름\t학과명\t점수\n");
				txtPool.append("\t─────────────────────────────────\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			}
		} else if (e.getSource() == btnMNameSearch) { // 전공검색
			// 전공선택란을 제외하고 기본으로 비운다
			txtSNo.setText("");
			txtSName.setText("");
			txtScore.setText("");
			// comMname 콤보박스에 선택된 전공이름으로 검색하여 출력
			String mName = comMname.getSelectedItem().toString();
			ArrayList<StudentDto> students = dao.mNamegetStudent(mName);
			if (!students.isEmpty()) {
				txtPool.setText("\t등수\t이름\t학과명\t점수\n");
				txtPool.append("\t─────────────────────────────────\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			} else {
				txtPool.setText("해당 학과의 학생이 없습니다");
			} // if
		} else if (e.getSource() == btnInput) { // 학생입력
			// txtSName, comMname, txtScore값을 받아 학생입력 (txtScore에 유효한 점수를 입력하지 않을 경우 떼끼)
			txtSNo.setText(""); // 학번입력란을 지운다(학생입력시 학번은 사용자가 입력하지 않고 시퀀스를 이용)
			String sName = txtSName.getText().trim();
			String mName = comMname.getSelectedItem().toString();
			String scoreStr = txtScore.getText().trim();
			if (sName.equals("") || mName.equals("") || scoreStr.equals("")) {
				txtPool.setText("학생입력시 이름, 전공, 유효한 점수(0~100점)를 모두 입력하셔야 합니다");
				return;
			}
			int score;
			try {
				score = Integer.parseInt(scoreStr);
				if (score < 0 || score > 100) {
					txtPool.setText("학생입력시 이름, 전공, 유효한 점수(0~100점)를 모두 입력하셔야 합니다");
					return;
				}
			} catch (Exception e2) {
				txtPool.setText("학생입력시 이름, 전공, 유효한 점수(0~100점)를 모두 입력하셔야 합니다");
				return;
			} // try-catch (score처리)
			StudentDto newStudent = new StudentDto(sName, mName, score);
			int result = dao.insertStudent(newStudent);
			if (result == StudentDao.SUCCESS) {
				txtPool.setText(sName + " 학생 입력 성공");
				txtSNo.setText("");
				txtSName.setText("");
				comMname.setSelectedIndex(0);
				txtScore.setText("");
			} // if
		} else if (e.getSource() == btnUpdate) { // 학생수정
			// txtSNo, txtSName, comMname, txtScore값을 받아 학생 수정
			String sNo = txtSNo.getText().trim();
			String sName = txtSName.getText().trim();
			String mName = comMname.getSelectedItem().toString();
			String scoreStr = txtScore.getText().trim();
			if (sNo.equals("") || sName.equals("") || mName.equals("") || scoreStr.equals("")) {
				txtPool.setText("학생수정시 학번, 이름, 전공, 유효한 점수(0~100점)를 모두 입력하셔야 합니다");
				return;
			}
			int score;
			try {
				score = Integer.parseInt(scoreStr);
				if (score < 0 || score > 100) {
					txtPool.setText("학생수정시 학번, 이름, 전공, 유효한 점수(0~100점)를 모두 입력하셔야 합니다");
					return;
				}
			} catch (Exception e2) {
				txtPool.setText("학생수정시 학번, 이름, 전공, 유효한 점수(0~100점)를 모두 입력하셔야 합니다");
				return;
			} // try-catch (score처리)
			StudentDto student = new StudentDto(sNo, sName, mName, score);
			int result = dao.updateStudent(student);
			if (result == StudentDao.SUCCESS) {
				txtPool.setText(sName + " 학생 입력 수정");
			} // if
		} else if (e.getSource() == btnStudentOut) { // 학생출력
			txtSNo.setText("");
			txtSName.setText("");
			comMname.setSelectedItem("");
			txtScore.setText("");
			// 제적되지 않는 학생들 pdf와 같이 출력
			ArrayList<StudentDto> students = dao.getStudents();
			if (students.size() != 0) {
				txtPool.setText("\t학번\t이름\t학과명\t점수\n");
				txtPool.append("\t─────────────────────────────────\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			} else {
				txtPool.setText("등록된 학생이 없습니다");
			} // if
		} else if (e.getSource() == btnExpelOut) { // 제적자출력
			txtSNo.setText("");
			txtSName.setText("");
			comMname.setSelectedItem("");
			txtScore.setText("");
			// 제적된 학생들 pdf와 같이 출력
			ArrayList<StudentDto> students = dao.getStudentsExpel();
			if (students.size() != 0) {
				txtPool.setText("\t학번\t이름\t학과명\t점수\n");
				txtPool.append("\t─────────────────────────────────\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			} else {
				txtPool.setText("등록된 학생이 없습니다");
			} // if
		} else if (e.getSource() == btnExpel) { // 제적처리
			// txtSNo에 입력된 학생 제적처리
			String sNo = txtSNo.getText().trim();
			if (sNo.length() == 0) {
				txtPool.setText("학번은 입력하셔야 제적처리가 가능합니다");
				return;
			}
			int result = dao.sNoExpel(sNo);
			if (result == StudentDao.SUCCESS) {
				txtPool.setText(sNo + " 학생 제적 처리 완료");
			} else {
				txtPool.setText(sNo + "번은 유효한 학번이 아니라 제적처리가 불가합니다");
			}
		} else if (e.getSource() == btnExit) { // 종료
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}

	public static void main(String[] args) {
		new StudentMngGUI("학사관리");
	}
}