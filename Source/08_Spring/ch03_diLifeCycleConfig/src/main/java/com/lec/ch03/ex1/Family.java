package com.lec.ch03.ex1;

import lombok.Data;

@Data
public class Family {
	private String dadName;
	private String mumName;
	private String sisterName;
	private String brotherName;
	
	public Family(String dadName, String mumName) {
		super();
		this.dadName = dadName;
		this.mumName = mumName;
	}
}
