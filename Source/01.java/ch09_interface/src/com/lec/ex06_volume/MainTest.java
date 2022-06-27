package com.lec.ex06_volume;

public class MainTest {
	public static void main(String[] args) {
		IVolume[] volumes = {new TV(3), new Speaker(5), new TV(10),
				new Speaker(17)};

		for (IVolume temp : volumes) {
			temp.volumeDown();
			temp.volumeDown(20);
			temp.volumeUp(10);
			temp.volumeUp(45);
			System.out.println(
					"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");

		}
	}
}