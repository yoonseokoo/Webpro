package com.lec.ex03_phone;

public class TestMain {
	public static void main(String[] args) {
		// IAcorporation[] phone = {new Amodel(), new Bmodel(), new Cmodel()};

		Amodel a = new Amodel();
		Bmodel b = new Bmodel();
		Cmodel c = new Cmodel();

		IAcorporation[] phone = {a, b, c};
		for (IAcorporation p : phone) {
			System.out.println("\n" + p.getClass().getName());
			p.dmbReceive();
			p.lte();
			p.tvRemoteControl();
		}
	}
}
