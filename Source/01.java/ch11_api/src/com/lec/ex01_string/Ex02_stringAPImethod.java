package com.lec.ex01_string;

public class Ex02_stringAPImethod {
	public static void main(String[] args) {
		String str1 = "abcXabc";
		String str2 = new String("ABCXabc");
		String str3 = "     ja    va      ";
		String str4 = "æ»≥ÁHello";

		// CONCAT: LINKED THE TWO STRINGS
		System.out.println("1. " + str1.concat(str2)); // abcXabcABCXabc

		// SUBSTRING: PRINT ONLY A SPECIFIC PART OF THE STRING
		System.out.println("2. " + str1.substring(3)); // Xabc
		System.out.println("3. " + str1.substring(3, 5)); // Xa

		// LENGTH: FINDING LENGTH OF THE STRING
		System.out.println("4. " + str1.length()); // 7

		// UPPER or LOWER
		System.out.println("5. " + str1.toUpperCase()); // ABCXABC
		System.out.println("6. " + str1.toLowerCase()); // abcxabc

		// CHAR_AT: COUNTING FROM 0, FIND AND PRINT THE Xth CHARACTER
		System.out.println("7. " + str1.charAt(3)); // X

		// INDEX_OF: PRINTING POSITION OF A PARTICULAR CHARACTER:
		System.out.println("8. " + str1.indexOf('b')); // 1 (counts from the beginning)
		System.out.println("9. " + str1.indexOf('b', 3)); // 5 (counts from the third character)
		System.out.println("10. " + str1.indexOf("abc")); // 0
		System.out.println("11. " + str1.indexOf("abc", 3)); // 4
		System.out.println("12. " + str1.indexOf('z')); // -1 (if there is no such character in the String)
		System.out.println("13. " + str1.lastIndexOf('b')); // 5 (finds index of the last time 'b' appears)

		// EQUALS: RETURNS FALSE (NOT EQUAL) OR TRUE (EQUAL)
		System.out.println("14. " + str1.equals(str2)); // false
		System.out.println("15. " + str1.equalsIgnoreCase(str2)); // true

		// TRIM: DELETES SPACE IN FRONT AND BACK OF THE STRING
		System.out.println("16. " + str3.trim()); // ja va

		// REPLACE: CHANGING A CHAR/STRING TO A SPECIFIC VALUE
		System.out.println("17. " + str1.replace('a', '9')); // 9bcX9bc
		System.out.println("18. " + str1.replace("abc", "#")); // #X#
		System.out.println("19. " + str3.replace(" ", "")); // (deleting all spaces)
		System.out.println("20. " + str1.replace("abc", "Z")); // ZXZ

		// REPLACE ALL: CHANGING ALL CHAR'S THAT FIT A CERAIN CONIDTION
		System.out.println("21. " + str4.replaceAll("[a-zA-Z]", "")); // deleting all alphabets
		System.out.println("22. " + str4.replaceAll("[∞°-∆R]", " ")); // deleting all Korean characters
	}

}
