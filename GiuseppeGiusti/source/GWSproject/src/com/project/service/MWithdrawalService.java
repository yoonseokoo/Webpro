package com.project.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.BoardDao;
import com.project.dao.MemberDao;
import com.project.dto.MemberDto;

public class MWithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDto member = (MemberDto)session.getAttribute("member");
		if(member!=null) {
			String mId = member.getmId();
			BoardDao  bDao = BoardDao.getInstance();
			MemberDao mDao = MemberDao.getInstance();
			bDao.withdrawalDeleteBoard(mId); // 회원탈퇴전 쓴 글 모두 삭제되어야 회원삭제 가능(외래키로 연결)
			int result = mDao.withdrawal(mId);
			if(result == MemberDao.SUCCESS) {
				request.setAttribute("withdrawalResult", "회원탈퇴가 성공되었습니다. 작성하신 모든 글도 다 지워집니다");
			}else {
				request.setAttribute("withdrawalErrorMsg", "회원탈퇴가 실패되었습니다");
			}
		}else {
			request.setAttribute("withdrawalErrorMsg", "로그인 된 회원이 아닙니다");
		}
		session.invalidate();
	}

}