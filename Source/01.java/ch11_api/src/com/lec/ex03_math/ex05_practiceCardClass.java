package com.lec.ex03_math;

public class ex05_practiceCardClass {
	private char kind; // ¢¼ ¡ß ¢À ¢¾
	private int num; // 1~13

	public ex05_practiceCardClass(char kind, int num) {
		this.kind = kind;
		this.num = num;
	}

	@Override
	public String toString() {
		return "Card is " + kind + ", " + num;
	}

	@Override
	public boolean equals(Object obj) {

		if (obj != null && obj instanceof ex05_practiceCardClass) {
			boolean kindChk = (kind == ((ex05_practiceCardClass) obj).kind);
			boolean numChk = (num == ((ex05_practiceCardClass) obj).num);
			return kindChk && numChk;
		}
		return false;
	}
}