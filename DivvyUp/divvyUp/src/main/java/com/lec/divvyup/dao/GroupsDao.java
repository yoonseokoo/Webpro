package com.lec.divvyup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.divvyup.vo.Groups;
import com.lec.divvyup.vo.Member;

@Mapper
public interface GroupsDao {
	public List<Groups> groupList(Groups groups);
	public Groups groupInfo(int gid);
	public int nextGid();
	public List<Member> followList(String mid);
	public int groupInsert(Groups group);
	public int modify(Groups group);
	public int finalStepDeleteGroup(int gid);	
	public List<Groups> groupListforAdminSearch(String mid);
	public int countGroups(String mid);
}
