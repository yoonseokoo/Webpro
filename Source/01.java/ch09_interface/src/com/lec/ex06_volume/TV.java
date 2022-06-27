package com.lec.ex06_volume;

public class TV implements IVolume {
	private final int TV_MAX_VOLUME = 50;
	private final int TV_MIN_VOLUME = 0;
	private int volumeLevel;
	public TV() {
	}
	public TV(int volumeLevel) {
		this.volumeLevel = volumeLevel;
	}
	@Override
	public void volumeUp() {
		if (volumeLevel < TV_MAX_VOLUME) {
			volumeLevel++;
			System.out.println(
					"Volume is increased by 1. Current Volume: " + volumeLevel);
		} else {
			System.out.println("Currently at the max volume");
		}
	}

	@Override
	public void volumeUp(int level) {
		if (volumeLevel + level <= TV_MAX_VOLUME) {
			volumeLevel += level;
			System.out.println("Volume is increased by " + level
					+ ". Current Volume: " + volumeLevel);

		} else {
			int tempLevel = TV_MAX_VOLUME - volumeLevel;
			volumeLevel = TV_MAX_VOLUME;
			System.out.println("TV volume could not be increased by " + level
					+ " but has been increased by " + tempLevel
					+ ", reaching max volume " + TV_MAX_VOLUME);
		}
	}

	@Override
	public void volumeDown() {
		if (volumeLevel > TV_MIN_VOLUME) {
			volumeLevel--;
			System.out.println(
					"Lower TV volume by 1. Current Volume: " + volumeLevel);
		} else {
			System.out.println("Currently at the min volume");
		}
	}

	@Override
	public void volumeDown(int level) {
		if (volumeLevel - level >= TV_MIN_VOLUME) {
			volumeLevel -= TV_MIN_VOLUME;
			System.out.println("TV volume has been lowered by " + level
					+ ". Current Volume: " + volumeLevel);
		} else {
			int tempLevel = volumeLevel - TV_MIN_VOLUME;
			volumeLevel = TV_MAX_VOLUME;
			System.out.println("TV volume could not be lowered by " + level
					+ " but has been lowered by " + tempLevel
					+ ", reaching min volume " + TV_MIN_VOLUME);
		}
	}
}
