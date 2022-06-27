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
	// DB����
	private StudentDao dao = StudentDao.getInstance();
	// ȭ�鱸��
	private Container contenPane;
	private JPanel jpup, jpbtn;
	private JTextField txtSNo, txtSName, txtScore;
	private Vector<String> mNames; // �޺��ڽ��� �� ��������Ʈ�� ���� vector
	private JComboBox<String> comMname;
	private JButton btnSNoSearch, btnSNameSearch, btnMNameSearch;
	private JButton btnInput, btnUpdate;
	private JButton btnStudentOut, btnExpelOut, btnExpel, btnExit;
	private JTextArea txtPool;
	private JScrollPane scrollPane;

	public StudentMngGUI(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane(); // ȭ�鱸��
		contenPane.setLayout(new FlowLayout());
		jpup = new JPanel(new GridLayout(4, 3));
		jpbtn = new JPanel(new FlowLayout());
		txtSNo = new JTextField(10);
		txtSName = new JTextField(10);
		mNames = dao.getMNamelist();
		comMname = new JComboBox<String>(mNames);
		txtScore = new JTextField(10);
		btnSNoSearch = new JButton("�й��˻�");
		btnSNameSearch = new JButton("�̸��˻�");
		btnMNameSearch = new JButton("�����˻�");
		btnInput = new JButton("�л��Է�");
		btnUpdate = new JButton("�л�����");
		btnStudentOut = new JButton("�л����");
		btnExpelOut = new JButton("���������");
		btnExpel = new JButton("����ó��");
		btnExit = new JButton("����");
		txtPool = new JTextArea(10, 50);
		scrollPane = new JScrollPane(txtPool);
		jpup.add(new JLabel("�й�", (int) CENTER_ALIGNMENT));
		jpup.add(txtSNo);
		jpup.add(btnSNoSearch);
		jpup.add(new JLabel("�̸�", (int) CENTER_ALIGNMENT));
		jpup.add(txtSName);
		jpup.add(btnSNameSearch);
		jpup.add(new JLabel("����", (int) CENTER_ALIGNMENT));
		jpup.add(comMname);
		jpup.add(btnMNameSearch);
		jpup.add(new JLabel("����", (int) CENTER_ALIGNMENT));
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
		if (e.getSource() == btnSNoSearch) { // �й��˻�
			// �й��Է¶��� �����ϰ� �⺻���� ����
			txtSName.setText("");
			txtScore.setText("");
			comMname.setSelectedIndex(0); // comMname.setSelectedItem("");
			// �й� �˻� : txtSNo �� �޾� �й� �˻��Ͽ� txtSName, comMname, txtScore�� �־��ش�
			String sNo = txtSNo.getText().trim();
			if (sNo.length() == 0) { // �й��� �Է����� ���� ���
				txtPool.setText("�й��� �Է� �� �й� �˻��ϼ���");
				return;
			}
			StudentDto dto = dao.sNogetStudent(sNo); // �й����� �˻��� ��� �ޱ�
			if (dto != null) { // �ش� �й��� DB�� �ִ� ���
				txtSName.setText(dto.getsName());
				comMname.setSelectedItem(dto.getmName());
				// txtScore.setText(""+dto.getScore()); // ""+100 => "100"
				txtScore.setText(String.valueOf(dto.getScore()));
				txtPool.setText(sNo + "�� �˻� �Ϸ�");
			} else { // �ش� �й��� DB�� ���� ���
				txtPool.setText(sNo + "�� �й��� ��ȿ���� �ʽ��ϴ�");
			}
		} else if (e.getSource() == btnSNameSearch) { // �̸��˻�
			// �̸��Է¶��� �����ϰ� �⺻���� ����
			txtSNo.setText("");
			txtScore.setText("");
			comMname.setSelectedIndex(0);
			// txtSName.getText() �� �޾� �̸� �˻�
			// arraylist sizeȮ���Ͽ�, �˻��� ����� ���� ���, �Ѹ��� ���, �θ��̻� �ΰ�� ����� �ٸ���
			String sName = txtSName.getText().trim();
			if (sName.length() == 0) { // �̸��� �Է����� ���� ���
				txtPool.setText("�̸��� �Է� �� �̸� �˻��ϼ���");
				return;
			}
			ArrayList<StudentDto> students = dao.sNamegetStudent(sName);
			if (students.size() == 0) {
				txtPool.setText("�ش� �̸��� �л��� �����ϴ�");
			} else if (students.size() == 1) {
				txtSNo.setText(students.get(0).getsNo());
				comMname.setSelectedItem(students.get(0).getmName());
				txtScore.setText(String.valueOf(students.get(0).getScore()));
				txtPool.setText(sName + " �˻� �Ϸ�");
			} else {
				txtPool.setText("\t�й�\t�̸�\t�а���\t����\n");
				txtPool.append("\t������������������������������������������������������������������\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			}
		} else if (e.getSource() == btnMNameSearch) { // �����˻�
			// �������ö��� �����ϰ� �⺻���� ����
			txtSNo.setText("");
			txtSName.setText("");
			txtScore.setText("");
			// comMname �޺��ڽ��� ���õ� �����̸����� �˻��Ͽ� ���
			String mName = comMname.getSelectedItem().toString();
			ArrayList<StudentDto> students = dao.mNamegetStudent(mName);
			if (!students.isEmpty()) {
				txtPool.setText("\t���\t�̸�\t�а���\t����\n");
				txtPool.append("\t������������������������������������������������������������������\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			} else {
				txtPool.setText("�ش� �а��� �л��� �����ϴ�");
			} // if
		} else if (e.getSource() == btnInput) { // �л��Է�
			// txtSName, comMname, txtScore���� �޾� �л��Է� (txtScore�� ��ȿ�� ������ �Է����� ���� ��� ����)
			txtSNo.setText(""); // �й��Է¶��� �����(�л��Է½� �й��� ����ڰ� �Է����� �ʰ� �������� �̿�)
			String sName = txtSName.getText().trim();
			String mName = comMname.getSelectedItem().toString();
			String scoreStr = txtScore.getText().trim();
			if (sName.equals("") || mName.equals("") || scoreStr.equals("")) {
				txtPool.setText("�л��Է½� �̸�, ����, ��ȿ�� ����(0~100��)�� ��� �Է��ϼž� �մϴ�");
				return;
			}
			int score;
			try {
				score = Integer.parseInt(scoreStr);
				if (score < 0 || score > 100) {
					txtPool.setText("�л��Է½� �̸�, ����, ��ȿ�� ����(0~100��)�� ��� �Է��ϼž� �մϴ�");
					return;
				}
			} catch (Exception e2) {
				txtPool.setText("�л��Է½� �̸�, ����, ��ȿ�� ����(0~100��)�� ��� �Է��ϼž� �մϴ�");
				return;
			} // try-catch (scoreó��)
			StudentDto newStudent = new StudentDto(sName, mName, score);
			int result = dao.insertStudent(newStudent);
			if (result == StudentDao.SUCCESS) {
				txtPool.setText(sName + " �л� �Է� ����");
				txtSNo.setText("");
				txtSName.setText("");
				comMname.setSelectedIndex(0);
				txtScore.setText("");
			} // if
		} else if (e.getSource() == btnUpdate) { // �л�����
			// txtSNo, txtSName, comMname, txtScore���� �޾� �л� ����
			String sNo = txtSNo.getText().trim();
			String sName = txtSName.getText().trim();
			String mName = comMname.getSelectedItem().toString();
			String scoreStr = txtScore.getText().trim();
			if (sNo.equals("") || sName.equals("") || mName.equals("") || scoreStr.equals("")) {
				txtPool.setText("�л������� �й�, �̸�, ����, ��ȿ�� ����(0~100��)�� ��� �Է��ϼž� �մϴ�");
				return;
			}
			int score;
			try {
				score = Integer.parseInt(scoreStr);
				if (score < 0 || score > 100) {
					txtPool.setText("�л������� �й�, �̸�, ����, ��ȿ�� ����(0~100��)�� ��� �Է��ϼž� �մϴ�");
					return;
				}
			} catch (Exception e2) {
				txtPool.setText("�л������� �й�, �̸�, ����, ��ȿ�� ����(0~100��)�� ��� �Է��ϼž� �մϴ�");
				return;
			} // try-catch (scoreó��)
			StudentDto student = new StudentDto(sNo, sName, mName, score);
			int result = dao.updateStudent(student);
			if (result == StudentDao.SUCCESS) {
				txtPool.setText(sName + " �л� �Է� ����");
			} // if
		} else if (e.getSource() == btnStudentOut) { // �л����
			txtSNo.setText("");
			txtSName.setText("");
			comMname.setSelectedItem("");
			txtScore.setText("");
			// �������� �ʴ� �л��� pdf�� ���� ���
			ArrayList<StudentDto> students = dao.getStudents();
			if (students.size() != 0) {
				txtPool.setText("\t�й�\t�̸�\t�а���\t����\n");
				txtPool.append("\t������������������������������������������������������������������\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			} else {
				txtPool.setText("��ϵ� �л��� �����ϴ�");
			} // if
		} else if (e.getSource() == btnExpelOut) { // ���������
			txtSNo.setText("");
			txtSName.setText("");
			comMname.setSelectedItem("");
			txtScore.setText("");
			// ������ �л��� pdf�� ���� ���
			ArrayList<StudentDto> students = dao.getStudentsExpel();
			if (students.size() != 0) {
				txtPool.setText("\t�й�\t�̸�\t�а���\t����\n");
				txtPool.append("\t������������������������������������������������������������������\n");
				for (StudentDto student : students) {
					txtPool.append("\t" + student.toString() + "\n");
				} // for
			} else {
				txtPool.setText("��ϵ� �л��� �����ϴ�");
			} // if
		} else if (e.getSource() == btnExpel) { // ����ó��
			// txtSNo�� �Էµ� �л� ����ó��
			String sNo = txtSNo.getText().trim();
			if (sNo.length() == 0) {
				txtPool.setText("�й��� �Է��ϼž� ����ó���� �����մϴ�");
				return;
			}
			int result = dao.sNoExpel(sNo);
			if (result == StudentDao.SUCCESS) {
				txtPool.setText(sNo + " �л� ���� ó�� �Ϸ�");
			} else {
				txtPool.setText(sNo + "���� ��ȿ�� �й��� �ƴ϶� ����ó���� �Ұ��մϴ�");
			}
		} else if (e.getSource() == btnExit) { // ����
			setVisible(false);
			dispose();
			System.exit(0);
		}
	}

	public static void main(String[] args) {
		new StudentMngGUI("�л����");
	}
}