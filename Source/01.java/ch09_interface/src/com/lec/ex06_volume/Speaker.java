package com.lec.ex06_volume;

public class Speaker implements IVolume {
	private final int SPEAKER_MAX_VOLUME = 0;
	private final int SPEAKER_MIN_VOLUME = 0;
	private int volumeLevel;
	public Speaker() {
	}
	public Speaker(int volumeLevel) {
		this.volumeLevel = volumeLevel;
	}
	@Override
	public void volumeUp() {
		if (volumeLevel < SPEAKER_MAX_VOLUME) {
			volumeLevel++;
			System.out.println(
					"Volume is increased by 1. Current Volume: " + volumeLevel);
		} else {
			System.out.println("Currently at the max volume");
		}
	}

	@Override
	public void volumeUp(int level) {
		if (volumeLevel + level <= SPEAKER_MAX_VOLUME) {
			volumeLevel += level;
			System.out.println("Volume is increased by " + level
					+ ". Current Volume: " + volumeLevel);

		} else {
			int tempLevel = SPEAKER_MAX_VOLUME - volumeLevel;
			volumeLevel = SPEAKER_MAX_VOLUME;
			System.out.println("TV volume could not be increased by " + level
					+ " but has been increased by " + tempLevel
					+ ", reaching max volume " + SPEAKER_MIN_VOLUME);
		}
	}

	@Override
	public void volumeDown() {
		if (volumeLevel > SPEAKER_MAX_VOLUME) {
			volumeLevel--;
			System.out.println("Lower speaker volume by 1. Current Volume: "
					+ volumeLevel);
		} else {
			System.out.println("Currently at the min volume");
		}
	}

	@Override
	public void volumeDown(int level) {
		if (volumeLevel - level >= SPEAKER_MIN_VOLUME) {
			volumeLevel -= SPEAKER_MIN_VOLUME;
			System.out.println("Speaker volume has been lowered by " + level
					+ ". Current Volume: " + volumeLevel);
		} else {
			int tempLevel = volumeLevel - SPEAKER_MIN_VOLUME;
			volumeLevel = SPEAKER_MIN_VOLUME;
			System.out.println("TV volume could not be lowered by " + level
					+ " but has been lowered by " + tempLevel
					+ ", reaching min volume " + SPEAKER_MIN_VOLUME);
		}
	}
}
