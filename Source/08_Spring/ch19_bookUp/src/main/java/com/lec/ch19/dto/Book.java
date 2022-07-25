package com.lec.ch19.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
	int bnum;
	String btitle;
	String bwriter;
	Date brdate;
	String bimg1;
	String bimg2;
	String binfo;
	int startRow;
	int endRow;
}
