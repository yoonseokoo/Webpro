package com.mega.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex3Test")
public class Ex3Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (name.equals("") || title.equals("") || content.equals("")) {
			out.println("<h4>Please insert all the information to post</h4>");
		} else {
			out.println("<html>");
			out.println("<link rel=\"stylesheet\" href=\"Ex3.css\">");
			out.println("<head>");
			out.println("<body>");
			out.println("<table><tr><td colspan=\"2\">반갑습니다 " + name + "님</td></tr>");
			out.println("<tr><td>글제목</td><td>" + title + "</td></tr>");
			out.println("<tr><td>글내용</td><td>" + content + "</td></tr></table>");
			out.println("</body>");
			out.println("</head>");
			out.println("</html>");
			out.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
