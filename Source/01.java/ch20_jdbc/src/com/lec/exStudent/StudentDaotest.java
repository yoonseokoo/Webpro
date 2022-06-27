package com.lec.exStudent;

import java.util.ArrayList;
import java.util.Vector;

public class StudentDaotest {
	public static void main(String[] args) {
		StudentDao dao = StudentDao.getInstance();

		// [0]
		System.out.println("0.학과명 리스트");
		Vector<String> mnames = dao.getMNamelist();
		System.out.println(mnames);

		// [1]
		System.out.println("1.학번검색");
		StudentDto dto = dao.sNogetStudent("2022001");
		System.out.println(dto);
		dto = dao.sNogetStudent("20");
		System.out.println(dto);

		// [2]
		System.out.println("2.이름검색");
		ArrayList<StudentDto> students = dao.sNamegetStudent("홍길동");
		System.out.println(students);

		// [3]
		System.out.println("3.전공검색");
		students = dao.mNamegetStudent("컴퓨터공학");
		System.out.println(students);

		// [4]
		System.out.println("4.학생입력");
		dto = new StudentDto("테스터", "신문방송학", 89);
		int result = dao.insertStudent(dto);
		System.out.println(result == StudentDao.SUCCESS ? "입력성공" : "입력실패");

		// [5]
		System.out.println("5. 학생수정");
		dto = new StudentDto("2022004", "이테스", "컴퓨터공학", 99);
		result = dao.updateStudent(dto);
		System.out.println(result == StudentDao.SUCCESS ? "수정성공" : "수정실패");

		// [6]
		System.out.println("6.학생출력");
		students = dao.getStudents();
		System.out.println(students);

		// [7]
		System.out.println("7.제적자 출력");
		students = dao.getStudentsExpel();
		System.out.println(students);

		// [8]
		System.out.println("8. 제적처리(2022004학생)");
		result = dao.sNoExpel("2022004");
		System.out.println(result == StudentDao.SUCCESS ? "제적처리성공" : "제적처리실패");
	}
}