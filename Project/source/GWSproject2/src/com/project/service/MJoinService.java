package com.project.service;


import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.dao.MemberDao;
import com.project.dto.MemberDto;

public class MJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			String mId = request.getParameter("mId");
			String mPw = request.getParameter("mPw");
			String mName = request.getParameter("mName");
			String mPhone = request.getParameter("mPhone");
			String mAddress = request.getParameter("mAddress");
			String mAddressDetail = request.getParameter("mAddressDetail");
			Date mBirth = Date.valueOf(request.getParameter("mBirth"));
			String mEmail = request.getParameter("mEmail");
			String mGender = request.getParameter("mGender");
			int mCumPurchase = 0;
			int mGrade = 1;			
			MemberDao mDao = MemberDao.getInstance();
			MemberDto member = new MemberDto( mId, mPw, mName, mPhone, mAddress, mAddressDetail,  mBirth, mEmail, mGender, mCumPurchase, null, mGrade);

				// SIGN-UP
				int result = mDao.joinMember(member);
				if(result == MemberDao.SUCCESS) {
					HttpSession session = request.getSession(); 
					session.setAttribute("mId", mId);
					request.setAttribute("joinResult", "회원가입 완료");
				}else {
					request.setAttribute("joinErrorMsg", "회원가입 실패.");
				}
		}catch (Exception e) {
				System.out.println(e.getMessage() + "MJoinService 에러");
			}
		}
	}
