package com.mike.genre.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;

import com.google.gson.Gson;
import com.mike.game.model.GameVO;
import com.mike.genre.model.GenreService;
import com.mike.genre.model.GenreVO;
import com.mike.tool.StringProcessor;

@WebServlet(name = "GenreAjaxController", urlPatterns = {"/genre/ajax/*"})
public class GenreAjaxController extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res){

		HttpSession session = req.getSession();
		res.setCharacterEncoding("UTF-8");

		int genreId = Integer.parseInt(StringProcessor.getUrlLastSegment(req.getRequestURL().toString()));
		res.setStatus(200);
		
		List<GameVO> gameList = GenreService.getGameListByGenreId(genreId);
		
		System.out.println(gameList);
		String gameListJson = new Gson().toJson(gameList);
		System.out.println(gameListJson);		
		
		try {
			res.setContentType("application/json");
			res.getWriter().write(gameListJson);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
