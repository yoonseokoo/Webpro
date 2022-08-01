package com.lec.testSpace.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Groups {
	private int gid;
	private String gname;
	private Date grdate;
	private String dimg;
	private String gcontent;
	private String mid;
}
