package com.lec.ex8PersonDtoDao;

import java.util.ArrayList;
import java.util.Scanner;

public class PersonMng {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		PersonDao dao = PersonDao.getInstance();
		String fn;
		ArrayList<PersonDto> dtos;
		do {
			System.out.println(
					"What would you like to do:\n 1: [ADD PERSON]  \t2: [FIND BY OCCUPATION NAME]\t 3: [PRINT ALL INFO] \t4: [EXIT]");
			fn = scanner.next();
			switch (fn) {
			case "1":
				System.out.print("Enter name: ");
				String pname = scanner.next();
				System.out.print("Enter job name: ");
				String jname = scanner.next();
				System.out.print("Enter Korean score: ");
				int kor = scanner.nextInt();
				System.out.print("Enter English score: ");
				int eng = scanner.nextInt();
				System.out.print("Enter Math score: ");
				int mat = scanner.nextInt();
				int result = dao.insertPerson(new PersonDto(pname, jname, kor, eng, mat));
				System.out.println(result == PersonDao.SUCCESS ? "INSERTED SUCCESSFULLY" : "INSERT FAILED");
				break;

			case "2":
				System.out.println(("Enter job name: (¹è¿ì/°¡¼ö/¿¥¾¾)"));
				jname = scanner.next();
				dtos = dao.selectJname(jname);
				if (dtos.isEmpty()) {
					System.out.println("Such job does not exist.");
				} else {
					System.out.println("RANK\tPNAME\t\tJNAME\tKOR\tENG\tMAT\tSUM");
					for (PersonDto d : dtos) {
						System.out.println(d);
					}
				}
				break;

			case "3":
				System.out.println("PRINT ALL");
				break;
			}
		} while (fn.equals("1") || fn.equals("2") || fn.equals("3"));
		scanner.close();
		System.out.println("BYE");
	}
}
