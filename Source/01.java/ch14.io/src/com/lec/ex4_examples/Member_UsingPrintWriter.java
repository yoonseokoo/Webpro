package com.lec.ex4_examples;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Scanner;
import java.util.StringTokenizer;

public class Member_UsingPrintWriter {
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		String answer, name, phone, birth, address;
		int year, month, day;
		Date birthday;
		ArrayList<Member> members = new ArrayList<Member>();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String today = sdf.format(now); // "04-06"
		do {
			System.out.print("Would you like to register(Y/N)?");
			answer = scanner.next();
			if (answer.equalsIgnoreCase("n"))
				break;
			System.out.print("NAME: ");
			name = scanner.next();
			System.out.print("TEL: ");
			phone = scanner.next();
			System.out.print("BIRTHDAY(yyyy-MM-dd): ");
			birth = scanner.next();
			StringTokenizer token = new StringTokenizer(birth, "-");
			if (token.countTokens() == 3) {
				year = Integer.parseInt(token.nextToken());
				month = Integer.parseInt(token.nextToken());
				day = Integer.parseInt(token.nextToken());
				// birthday = new Date(year-1900, month-1, day);
				birthday = new Date(new GregorianCalendar(year, month - 1, day).getTimeInMillis());
			} else {
				System.out.println("PLEASE CHECK YOUR BIRTHDAY");
				continue;
			}
			if (birth.equals(today)) {
				System.out.println(name + ", its your birthday today. Happy birthday");
			}
			System.out.print("ADDRESS: ");
			scanner.nextLine();
			address = scanner.nextLine();
			members.add(new Member(name, phone, birthday, address));
		} while (true);
		scanner.close();

		// PRINTING USING PRINTWRITER
		PrintWriter printWriter = null;
		try {
			printWriter = new PrintWriter("src/com/lec/ex5_homework/member.txt");
			for (Member member : members) {
				System.out.print(member);
				printWriter.print(member.toString());
			}
			String msg = String.format("\n...%d person has registered\n\n", members.size());
			System.out.println(msg);
			printWriter.write(msg);
		} catch (FileNotFoundException e) {
			System.out.println("File could not be found" + e.getMessage());
		} catch (IOException e) {
			System.out.println("Exception" + e.getMessage());
		} finally {
			try {
				if (printWriter != null)
					printWriter.close();
			} catch (Exception ignore) {
				System.out.println(ignore.getMessage());
			}
		} // try-catch-finally
	}
}
