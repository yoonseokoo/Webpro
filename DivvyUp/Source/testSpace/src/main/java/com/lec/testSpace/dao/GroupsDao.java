package com.lec.testSpace.dao;

import java.util.List;

import com.lec.testSpace.dto.Book;
import com.lec.testSpace.dto.Groups;

public interface GroupsDao {
	public List<Groups> groupList();
	public Groups getGroup(int gid);
}
