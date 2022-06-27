package com.lec.frontcontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.*;
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
		String uri = request.getRequestURI();      // "/ch18/select.do"
		String conPath = request.getContextPath(); // "/ch18"
		String command = uri.substring(conPath.length()); // "/select.do"
		System.out.println("uri = " + uri); 
		System.out.println("conPath = " + conPath); 
		System.out.println("들어온 요청 = " + command);
		String viewPage = null; // 뷰단의 이름
		Service service = null;
		if(command.equals("/insert.do")) {
			// insert 로직을 수행할 객체 생성
			service = new InsertService();
			// 객체이름.메소드(request, response)
			service.execute(request, response);
			//request.setAttribute("result", "insert 결과");
			//viewPage = "ex2/select.jsp"; // list결과를 못 뿌림
			viewPage = "select.do";
		}else if(command.equals("/select.do")) {
			service = new SelectService();
			service.execute(request, response);
			viewPage = "ex2/select.jsp";
		}else if(command.equals("/delete.do")) {
			service = new DeleteService();
			service.execute(request, response);
			viewPage = "select.do";
		}else if(command.equals("/update.do")) {
			service = new UpdateService();
			service.execute(request, response);
			viewPage = "select.do";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}


