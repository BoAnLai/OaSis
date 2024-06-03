package com.shiyen.forum.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reurl")
public class ReurlServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String reurl = req.getParameter("reurl");
		
		switch(reurl) {
		case "toPostArt":{
			//回傳導向
			String url = "/forum/postArt.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
			break;
			}
		case "toReplyArt":{
			//接收參數
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			String artTitle = req.getParameter("artTitle");
			if (artTitle == null || artTitle.trim().length() == 0) {
				errorMsgs.add("內容請勿空白");
				}	
			Integer artReplyId = Integer.valueOf(req.getParameter("artReplyId").trim()) ;
			
			String url = "/forum/postArt.jsp";
			req.setAttribute("artTitle", artTitle);
			req.setAttribute("artReplyId", artReplyId);
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
			break;
			
			
			}
		}
	}
}