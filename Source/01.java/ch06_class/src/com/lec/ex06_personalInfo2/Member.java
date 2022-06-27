package com.lec.ex06_personalInfo2;

public class Member { //NO METHOD
	private String id;
	private String name;
	private String email;
	private String address;
	private String birthday;
	private String gender;
	
	public Member () {} //CONSTRUCTOR
	public Member (String id, String name, String email, String address, String birthday, String gender) { //CONSTRUCTOR WITH 6 PARAMETERS
		this.id = id;
		this.name = name;
		this.email = email;
		this.address = address;
		this.birthday = birthday;
		this.gender = gender; 
	}
	
	//GETTERS & SETTERS
		public String getId() {
			return id;
		}
		public String getName() {
			return name;
		}
		public String getEmail() {
			return email;
		}
		public String getAddress() {
			return address;
		}
		public String getBirthday() {
			return birthday;
		}
		public String getGender() {
			return gender;
		}
	}