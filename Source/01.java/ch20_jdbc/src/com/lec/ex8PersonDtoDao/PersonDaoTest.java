package com.lec.ex8PersonDtoDao;

import java.util.ArrayList;
import java.util.Vector;

public class PersonDaoTest {
	public static void main(String[] args) {
		PersonDao dao = PersonDao.getInstance();
		PersonDto dto = new PersonDto("Jimmy", "가수", 80, 87, 55);
		// int result = dao.insertPerson(dto);
		// System.out.println(result == PersonDao.SUCCESS ? "SUCCESSFUL" : "FAILED");
		System.out.println("-----------------------------TEST 1-----------------------------");
		ArrayList<PersonDto> dtos = dao.selectJname("배우");
		if (!dtos.isEmpty()) {
			for (PersonDto d : dtos) {
				System.out.println(d);
			}
		} else {
			System.out.println("Such job does not exist");
		}
		System.out.println("-----------------------------TEST 2-----------------------------");
		dtos = dao.selectAll();
		if (dtos.size() != 0) {
			for (PersonDto d : dtos) {
				System.out.println(d);
			}
		} else {
			System.out.println("There is not person in this field");
		}
		System.out.println("-----------------------------TEST 3-----------------------------");
		Vector<String> jnames = dao.jnamelist();
		System.out.println(jnames);
	}
}