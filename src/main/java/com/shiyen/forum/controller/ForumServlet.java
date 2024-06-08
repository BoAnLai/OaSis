package com.shiyen.forum.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForumServlet  extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		if(req.getServletPath().equals("/forum")) {
			req.setAttribute("displayReply","display:none");
			
			RequestDispatcher dispatcher = req.getRequestDispatcher("/forum/oneForum.jsp");
			dispatcher.forward(req,res);
			
		}
		}
}
