package com.lec.exSupermarket;

public class CustomerDto {
	private int cid;
	private String ctel;
	private String cname;
	private int cpoint;
	private int camount;
	private String levelName;
	private int forLevelUp;

	public CustomerDto(int cid, String ctel, String cname, int cpoint, int camount, String levelName, int forLevelUp) {
		super();
		this.cid = cid;
		this.ctel = ctel;
		this.cname = cname;
		this.cpoint = cpoint;
		this.camount = camount;
		this.levelName = levelName;
		this.forLevelUp = forLevelUp;
	}

	@Override
	public String toString() {
		return cid + "\t" + ctel + "\t\t" + cname + "\t" + cpoint + "\t" + camount + "\t" + levelName + "\t"
				+ forLevelUp;
	}

	public int getCid() {
		return cid;
	}

	public String getCtel() {
		return ctel;
	}

	public String getCname() {
		return cname;
	}

	public int getCpoint() {
		return cpoint;
	}

	public int getCamount() {
		return camount;
	}

	public String getLevelName() {
		return levelName;
	}

	public int getForLevelUp() {
		return forLevelUp;
	}

}
