package com.lec.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.MLogoutService;
import com.lec.service.MAllViewService;
import com.lec.service.MJoinService;
import com.lec.service.MLoginService;
import com.lec.service.MService;
import com.lec.service.ModifyService;


@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean write_view = false;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		MService service = null;
		String viewPage = null;
		System.out.println("uri="+uri +" com ="+com);
		if(com.equals("/loginView.do")) {
			viewPage = "member/login.jsp";
		}else if(com.equals("/login.do")) {
			service = new MLoginService();
			service.execute(request, response);
			viewPage = "member/main.jsp";
		}else if(com.equals("/logout.do")) {
			service = new MLogoutService();
			service.execute(request, response);
			viewPage = "member/login.jsp";
		}else if(com.equals("/joinView.do")) {
			viewPage = "member/join.jsp";
		}else if(com.equals("/join.do")) { 
			service = new MJoinService();
			service.execute(request, response); 
			viewPage = "member/login.jsp"; 
		}else if(com.equals("/modifyView.do")) {
			viewPage = "member/modifyView.jsp";
		}else if(com.equals("/modify.do")){
			service = new ModifyService();
			service.execute(request, response);
			viewPage = "member/main.jsp";
		 } else if(com.equals("/mAllView.do")) { 
			service = new MAllViewService();
			service.execute(request, response); 
			viewPage = "member/mAllView.jsp"; 
		 }
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		}
	}

