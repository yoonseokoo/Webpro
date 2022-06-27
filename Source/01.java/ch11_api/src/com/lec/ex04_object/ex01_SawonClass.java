package com.lec.ex04_object;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class ex01_SawonClass {
	private String num;
	private String name;
	private String dept;
//	private Dept dept; //USING ENUM
	private Date hiredate;

	public ex01_SawonClass(String num, String name, String dept) {
//	public Sawon(String num, String name, Dept dept) { //USING ENUM
		this.num = num;
		this.name = name;
		this.dept = dept;
		hiredate = new Date();
	}

	public ex01_SawonClass(String num, String name, String dept, int y, int m, int d) {
//	public Sawon(String num, String name, Dept dept, int y, int m, int d) {
		this.num = num;
		this.name = name;
		this.dept = dept;
		hiredate = new Date(new GregorianCalendar(y, m - 1, d).getTimeInMillis());
	}

	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy³âM¿ùdÀÏ(E)");
		String hiredateStr = sdf.format(hiredate);
		if (dept.length() > 10) {
			return "[EMPNO]" + num + "\t[NAME]" + name + "\t[DEPTARTMENT]" + dept + "\t[HIREDATE]" + hiredateStr;
		} else {
			return "[EMPNO]" + num + "\t[NAME]" + name + "\t[DEPTARTMENT]" + dept + "\t\t[HIREDATE]" + hiredateStr;
		}
	}
}