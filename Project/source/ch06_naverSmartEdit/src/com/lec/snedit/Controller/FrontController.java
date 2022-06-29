package com.lec.snedit.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.snedit.service.*;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri     = request.getRequestURI();
		String conPath = request.getContextPath();
		String com     = uri.substring(conPath.length()); //들어온 요청
		String viewPage = null;
		Service service = null;
		
		if(com.equals("/naverSmartEditList.do")) {
			service = new ListService();
			service.execute(request, response);
			viewPage = "naverSmartEdit/list.jsp";
		}else if(com.equals("/naverSmartEditcontent.do")) {
			service = new ContentService();
			service.execute(request, response);
			viewPage = "naverSmartEdit/content.jsp";
		}else if(com.equals("/naverSmartEditwriteView.do")) {
			viewPage = "naverSmartEdit/write.jsp";
		}else if(com.equals("/naverSmartEditwrite.do")) {
			service = new WriteService();
			service.execute(request, response);
			viewPage = "naverSmartEditList.do";
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
