package com.lec.ex06_personalInfo2;

public class Main {
	public static void main(String[] args) {
		Member member = new Member ("uniekoo", "Unie", "unie@company.com" , "Milan, Italy", "2000-01-01" , "F" );
		System.out.println("ID = " + member.getId()
						+ "\nNAME= " + member.getName() 
						+ "\nEMAIL= " + member.getEmail() 
						+ "\nADDRESS= " + member.getAddress() 
						+ "\nBDAY= " + member.getBirthday() 
						+"\nSEX=" + member.getGender());
		}
	}
