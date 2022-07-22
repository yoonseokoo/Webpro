package com.lec.ch14.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Dept {
	private int deptno;
	private String dname;
	private String loc;
	
	@Override
	public String toString() {
		return "EmpDto [deptno=" + deptno + ", dname=" + dname + ", loc=" + loc + "]";
	}
	
	
}