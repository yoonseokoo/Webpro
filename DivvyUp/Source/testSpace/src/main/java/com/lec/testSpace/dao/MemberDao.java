package com.lec.testSpace.dao;

import org.apache.ibatis.annotations.Mapper;

import com.lec.testSpace.dto.Member;

@Mapper
public interface MemberDao {
	public int idConfirm(String mid);
	public int joinMember(Member member);
	public Member getDetailMember(String mid);
	public int modifyMember(Member member);
}