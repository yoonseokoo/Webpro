package com.project.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.dao.MemberDao;
import com.project.dto.MemberDto;

public class MJoinService implements MService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("memberPhotoUp");
		int maxSize = 1024*1024;
		String mPhoto = "";
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize,
											"utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
				String param = params.nextElement();
				mPhoto = mRequest.getFilesystemName(param);
		
			String mId = mRequest.getParameter("mId");
			String mPw = mRequest.getParameter("mPw");
			String mName = mRequest.getParameter("mName");
			String mEmail = mRequest.getParameter("mEmail");
			mPhoto = mPhoto==null ? "NOIMG.JPG" : mPhoto;
			String mBirthStr = mRequest.getParameter("mBirth");
			Date mBirth = null;
			if(!mBirthStr.equals("")) {
				mBirth = Date.valueOf(mBirthStr);
			}
			String mAddress = mRequest.getParameter("mAddress");
			MemberDao mDao = MemberDao.getInstance();
			// mId DUPLICATE CHECK
			int result = mDao.mIdConfirm(mId);
			if(result == MemberDao.NONEXISTENT) {
				MemberDto member = new MemberDto(mId, mPw, mName, mEmail, 
						mPhoto, mBirth, mAddress, null);
				
				
				// SIGN-UP
				result = mDao.joinMember(member);
				if(result == MemberDao.SUCCESS) {
					HttpSession session = request.getSession(); 
					session.setAttribute("mId", mId);
					request.setAttribute("joinResult", "Sig Up successfully");
				}else {
					request.setAttribute("joinErrorMsg", "Sign up unsuccessful");
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
				
		// 서버에 업로드된 파일을 소스 폴더로 복사
		File serverFile = new File(path + "/" + mPhoto);
		if(serverFile.exists() && !mPhoto.equals("NOIMG.JPG")) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\Users\\user\\Desktop\\unie\\Source\\06.JSP\\model2ex\\WebContent\\memberPhotoUp\\"+mPhoto);
				byte[] bs = new byte[(int) serverFile.length()];
				while(true) {
					int readByteCnt = is.read(bs);
					if(readByteCnt==-1) break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (IOException e) {
				}
			}
		}
	}

}

