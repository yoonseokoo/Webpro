package com.lec.ch19.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor 
public class Member {
	String mid;
	String mpw;
	String mname;
	String mmail;
	String mpost;
	String maddr;
}
