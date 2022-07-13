package com.project.service;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.project.dao.BoardDao;
import com.project.dto.MemberDto;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class BWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String path = request.getRealPath("boardPhotoUp");
		int maxSize = 1024*1024*10; // 최대업로드 사이즈는 10M
		MultipartRequest mRequest = null;
		String bImage = "";
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			bImage = mRequest.getFilesystemName(param);
			HttpSession httpSession = request.getSession();
			MemberDto member = (MemberDto)httpSession.getAttribute("member");
			if(member!=null) {
				String mId = member.getmId();
				String bTitle = mRequest.getParameter("bTitle");
				String bContent = mRequest.getParameter("bContent");
				BoardDao bDao = BoardDao.getInstance();
				int result = bDao.insertBoard(mId, bTitle, bContent, bImage);
				if(result == BoardDao.SUCCESS) { 
					request.setAttribute("boardResult", "글쓰기 성공");
				}else {
					request.setAttribute("boardErrorMsg", "글쓰기 실패");
				}
			}
		}catch (IOException e) {
				System.out.println(e.getMessage());
				request.setAttribute("boardErrorMsg", "글쓰기 실패");
			}
			if(bImage!=null) {
				InputStream  is = null;
				OutputStream os = null;
				try {
					File serverFile = new File(path+"/"+bImage);
					is = new FileInputStream(serverFile);
					os = new FileOutputStream("C:\\Users\\admin\\Desktop\\Mine\\webPro\\Project\\source\\GWSproject\\WebContent\\boardPhotoUp\\"+bImage);
					byte[] bs = new byte[(int)serverFile.length()];
					while(true) {
						int nByteCnt = is.read(bs);
						if(nByteCnt==-1) break;
						os.write(bs, 0, nByteCnt);
					}
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} finally {
					try {
						if(os!=null) os.close();
						if(is!=null) is.close();
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}
				} // try
			}// 파일 복사 if
		}
	}
