package com.mega.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Ex2Test")
public class Ex2Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (!name.equals("")) {
			out.println("<h4>Your name: ");
			out.println(name);
			out.println("</h4>");
		} else {
			out.println("<h4>You have not entered your name</h4>");
		}

		if (!address.equals("")) {
			out.println("<h4>Your address: ");
			out.println(address);
			out.println("</h4>");
		} else {
			out.println("<h4>Please insert your address</h4>");
		}
		out.close();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
