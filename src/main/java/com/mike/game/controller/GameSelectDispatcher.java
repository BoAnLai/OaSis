package com.mike.game.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.game.model.GameService;
import com.mike.game.model.GameVO;

@MultipartConfig
@WebServlet(name = "gameServlet", urlPatterns = {"/game/gameInfo"})
public class GameSelectDispatcher extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		HttpSession session = req.getSession();
		
		// for testing gameDropdown
		if(req.getServletPath().equals("/game/gameInfo")) {			
			Integer gameId = Integer.parseInt(req.getParameter("gameId"));
			String forwardPath = req.getParameter("forwardPath");			
			
			GameVO game = null;
			try {
				game = GameService.getGameByGameId(gameId);
			} catch (Exception e) {
				e.printStackTrace();
			}
			session.setAttribute("game", game);
			req.getRequestDispatcher(forwardPath).forward(req, res);
		}
		
	} //doPost
	
} //Class
