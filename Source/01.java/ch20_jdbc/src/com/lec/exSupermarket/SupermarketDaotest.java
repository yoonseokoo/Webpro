package com.lec.exSupermarket;

import java.util.ArrayList;
import java.util.Vector;

public class SupermarketDaotest {
	public static void main(String[] args) {
		CustomerDao dao = CustomerDao.getInstance();

		// [0]
		System.out.println("\n[0] Searching level name");
		Vector<String> levelNames = dao.getLevelNames();
		System.out.println(levelNames);

		// [1]
		System.out.println("\n[1] Search user through CID");
		CustomerDto dto = dao.cIdGetCustomer(3);
		System.out.println(dto);

		// [2]
		System.out.println("\n[2] Search through the last 4 digits of telephone");
		ArrayList<CustomerDto> customers = dao.cTelGetCustomer("010-2345-8765");
		System.out.println(customers);

		// [3]
		System.out.println("\n[3] Search customer name");
		customers = dao.cNameGetCustomer("홍길동");
		System.out.println(customers);

		// [4]
		System.out.println("\n[4] Buy using CPOINT");
		int result = dao.buyWithPoint(2, 1000);
		System.out.println(result == CustomerDao.SUCCESS ? "포인트 구매성공" : "포인트 구매실패");

		// [5]
		System.out.println("\n[5] Buy product");
		result = dao.buy(20000, 4);
		System.out.println(result == CustomerDao.SUCCESS ? "구매성공" : "구매실패");

		// [6]
		System.out.println("\n[6] Print by level");
		customers = dao.levelNameGetCustomer("GOLD");
		System.out.println(customers);

		// [7]
		System.out.println("\n[7] Print all info");
		customers = dao.getCustomers();
		System.out.println(customers);

		// [8]
		System.out.println("\n[8] Register new Account");
		result = dao.insertCustomer("010-4321-6364", "정길동");
		System.out.println(result == CustomerDao.SUCCESS ? "입력성공" : "입력실패");

		// [9]
		System.out.println("\n[9] Edit phone number");
		result = dao.updateCustomer(2, "장길동");
		System.out.println(result == CustomerDao.SUCCESS ? "수정성공" : "수정실패");

		// [10]
		System.out.println("\n[10] Delete account");
		result = dao.deleteCustomer("010-4321-6364");
		System.out.println(result == CustomerDao.SUCCESS ? "삭제성공" : "삭제실패");
	}
}