package com.mega.lect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex2")
public class Ex2_restaurant extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] menu = request.getParameterValues("menu");
		String[] rest = request.getParameterValues("rest");
		String nation = request.getParameter("nation");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (menu != null) {
			out.println("<h4>The menu you have chosen is ");
			for (String m : menu) {
				out.println(m + " ");
			}
			out.println("</h4>");
		} else {
			out.println("<h4>Please choose a menu</h4>");
		}

		if (rest != null) {
			out.println(" ");
			out.println("<h4>The restaurant you have chosen is ");
			for (String r : rest) {
				out.println(r + " ");
			}
			out.println("</h4>");
		} else {
			out.println("<h4>Please choose a restaurant</h4>");
		}
		out.println("Your nationality is " + nation);
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
