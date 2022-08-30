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
import com.project.dao.BoardDao;
import com.project.dto.MemberDto;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.dao.BoardDao;



public class BReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String path = request.getRealPath("boardPhotoUp");
		int maxSize = 1024*1024*10;
		String bImage = "";
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			bImage = mRequest.getFilesystemName(param);
			HttpSession httpSession = request.getSession();
			String mId = ((MemberDto)httpSession.getAttribute("member")).getmId();
			String bTitle = mRequest.getParameter("bTitle");
			String bContent = mRequest.getParameter("bContent");
			int bGroup = Integer.parseInt(mRequest.getParameter("bGroup"));
			int bStep = Integer.parseInt(mRequest.getParameter("bStep"));
			int bIndent = Integer.parseInt(mRequest.getParameter("bIndent"));
			BoardDao bDao = BoardDao.getInstance();
			int result = bDao.reply(mId, bTitle, bContent, bImage, bGroup, bStep, bIndent);
			request.setAttribute("replyResult", result);
			if(result == BoardDao.SUCCESS) { // 회원가입 진행
				request.setAttribute("replyResult", "답글쓰기 성공");
			}else {
				request.setAttribute("replyErrorMsg", "답글쓰기 실패");
			}
			request.setAttribute("pageNum", mRequest.getParameter("pageNum"));
		} catch (IOException e) {
			System.out.println(e.getMessage());
			request.setAttribute("replyResult", "답글쓰기 실패");
		}
		// 서버에 올라간 fileboardUp 파일을 소스폴더에 filecopy
		if(bImage!=null) {
			InputStream  is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+bImage);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\Users\\admin\\Desktop\\Mine\\webPro\\Project\\source\\GWSproject2\\WebContent\\boardPhotoUp\\"+bImage);
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

	