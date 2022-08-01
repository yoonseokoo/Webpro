package com.lec.testSpace.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.testSpace.dto.Groups;


public interface GroupsService {
	public List<Groups> groupList();
	public Groups getGroup(int gid);
	}
