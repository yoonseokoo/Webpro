package com.mega.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex1Test")
public class Ex1Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] numbers = request.getParameterValues("num");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<link rel=\"stylesheet\" href=\"Ex1.css\">");
		out.println("<head>");
		out.println("<body>");
		out.println("<table>");
		for (int i = 0; i <= numbers.length; i++) {
			out.println("<tr><td>");
			out.println("<h3>" + numbers[i] + "단 구구단 입니다</h3>");
			for (int j = 1; j <= 9; j++) {
				out.printf("%s * %d = %d<br>", numbers[i], j, Integer.parseInt(numbers[i]) * j);
			}
			out.println("</td></tr>");
		}
		out.println("</table>");
		out.println("</body>");
		out.println("</head>");
		out.println("</html>");
		out.close();

	}

	private int parseInt(String string) {
		// TODO Auto-generated method stub
		return 0;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
