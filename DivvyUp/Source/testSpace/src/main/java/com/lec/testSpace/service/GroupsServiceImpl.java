package com.lec.testSpace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.testSpace.dao.GroupsDao;
import com.lec.testSpace.dto.Groups;
@Service
public class GroupsServiceImpl implements GroupsService {

@Autowired
private GroupsDao groupsDao;
	@Override
	public Groups getGroup(int gid) {
		return groupsDao.getGroup(gid);
	}
	@Override
	public List<Groups> groupList() {
		return groupsDao.groupList();
	}

}
