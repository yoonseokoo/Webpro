package com.lec.ex11_jimjilbang;

public class Jimilbang {
	public static class Jimjilbang extends TotalCost {
		private String name;
		public static int inTime;

		public Jimjilbang() {
		}

		public Jimjilbang(String name, int inTime) {
			this.name = name;
			this.inTime = inTime;
			infoPrint();
		}

		public void infoPrint() {
			System.out.println("-----------------------------------------------------");
			System.out.println("Welcome, " + name + ". You have entered the facility at " + inTime);
			System.out.println("-----------------------------------------------------");

		}

		@Override
		public void totalCost(int outTime) {
			super.totalCost(outTime);
		}

		public static int getInTime() {
			return inTime;

		}

	}
}