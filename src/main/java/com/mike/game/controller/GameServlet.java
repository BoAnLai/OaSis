package com.mike.game.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class GameServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		System.out.print("req URL:");
		System.out.println(req.getRequestURL());
		
//		String saveDirectory = "/user/resources/avatarUploaded";
//		String realPath = getServletContext().getRealPath(saveDirectory);
//		File fsaveDirectory = new File(realPath);
//		if (!fsaveDirectory.exists()) {				
//			fsaveDirectory.mkdirs();
//		}
		
		HttpSession session = req.getSession();
		
		if(req.getServletPath().equals("/game/list")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/game/gameList.jsp");
			dispatcher.forward(req,res);
		}
	} //doPost
	
} //Class
