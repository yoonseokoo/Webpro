package com.project.service;


import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.project.dao.MemberDao;
import com.project.dto.MemberDto;

public class ModifyService implements Service {

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
			int mCumPurchase = request.getParameter("mCumPurchase") == null? 0 : Integer.parseInt(request.getParameter("mCumPurchase"));
			int mGrade = request.getParameter("mGrade") == null ? 0 : Integer.parseInt(request.getParameter("mGrade"));
			MemberDao mDao = MemberDao.getInstance();
			
			//MODIFYING
			MemberDto member = new MemberDto( mId, mPw, mName, mPhone, mAddress, mAddressDetail,  mBirth, mEmail, mGender, mCumPurchase, null, mGrade);
			int result = mDao.memberModify(member);
			if(result == MemberDao.SUCCESS) {
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("member", member);
				request.setAttribute("modifyResult", "회원정보 수정 성공");
			}else {
				request.setAttribute("modifyErrorMsg", "회원정보 수정 실패");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
	}
}
