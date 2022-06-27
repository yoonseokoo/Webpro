package com.lec.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex3_gugudanOut extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int su = Integer.parseInt(request.getParameter("su"));
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head>");
		// <link href="/ch03_semiServlet/css/ex3.css" rel="stylesheet">
		out.println("<link href=\"/ch03_semiServlet/css/ex3.css\" rel=\"stylesheet\">");
		out.println("</head>");
		out.println("<body>");
		out.println("<h3>" + su + "단 구구단 입니다</h3>");
		for (int i = 1; i <= 9; i++) {
			out.printf("<p>%d * %d = %d</p>", su, i, su * i);
		}
		out.println("</body>");
		out.println("</html>");
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
