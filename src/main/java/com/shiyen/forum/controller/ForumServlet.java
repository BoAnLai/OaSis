package com.shiyen.forum.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.Gson;
import com.shiyen.art.model.ArtDTO;
import com.shiyen.art.model.ArtService;
import com.shiyen.art.model.ArtVO;


public class ForumServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json; charset=UTF-8");
		String action = req.getParameter("act");
		
		
		
		switch (action) {
		
		case "getOneForumArt": {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			接收參數和錯誤驗證
			String gameId = req.getParameter("gameId");
			if (gameId == null || (gameId.trim()).length() == 0) {
				errorMsgs.add("遊戲編號錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/game/gameList.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
			
//			查詢資料
			ArtService artSvc = new ArtService();
			List<ArtVO> artVO = artSvc.getAllArt(Integer.valueOf(gameId));
			if (artVO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/game/gameList.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
//			傳送資料
			Gson gson = new Gson();
			String json = gson.toJson(artVO);
			System.out.println(json);
			res.getWriter().write(json);
			
			break;
		}
//獲取首篇文章
		case "getArt":{
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			接收參數和錯誤驗證
			String artId = req.getParameter("artId");
			if (artId == null || (artId.trim()).length() == 0) {
				errorMsgs.add("遊戲編號錯誤");
			}
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum/oneForum.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
//			查詢資料
			ArtService artSvc = new ArtService();
			ArtDTO  artDTO = artSvc.getOneArt(Integer.valueOf(artId));
			if (artDTO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum/oneForum.jsp");
				failureView.forward(req, res);
				return;//程式中斷
			}
//			傳送資料
			Gson gson = new Gson();
			String json = gson.toJson(artDTO);
			System.out.println(json);
			res.getWriter().write(json);
			
			break;
			
		}
//		新增文章
		case "addArt":{
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			接收參數和錯誤驗證
			Integer gameId = Integer.valueOf(req.getParameter("gameId").trim());
			if (gameId == null)  {
				errorMsgs.add("遊戲編號錯誤");
			}
			Integer userId = Integer.valueOf(req.getParameter("userId").trim());
			if (userId == null)  {
				errorMsgs.add("遊戲編號錯誤");
			}
			String artTitle = req.getParameter("artTitle");
			
			if (artTitle == null || artTitle.trim().length() == 0) {
				errorMsgs.add("文章標題: 請勿空白");
			} 
			
			String artContent = req.getParameter("artContent").trim();
			if (artContent == null || artContent.trim().length() == 0) {
				errorMsgs.add("內容請勿空白");
			}	
			
		Timestamp artTimestamp = null;
			try {
				artTimestamp = Timestamp.valueOf(req.getParameter("artTimestamp").trim());
			} catch (IllegalArgumentException e) {
				artTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
			}
			
			Integer	artReply = null;
			
			Integer	artFavor = 0;
			
			Integer	artView = 0;
			
			
			ArtVO artVO = new ArtVO();
			artVO.setArtTitle(artTitle);
			artVO.setArtContent(artContent);
			artVO.setArtTimestamp(artTimestamp);
			artVO.setArtReply(artReply);
			artVO.setArtFavor(artFavor);
			artVO.setArtView(artView);
			artVO.setArtUserId(userId);
			artVO.setArtGameId(gameId);
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("artVO", artVO); // 含有輸入格式錯誤的ArtVO物件,也存入req
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum/postArt.jsp");
				failureView.forward(req, res);
				return;
			}
//	     新增資料
			ArtService artSvc = new ArtService();
			Integer artId = artSvc.addArt(artVO);
			
//		回傳資料
			String url = "/forum/artView.jsp";
			req.setAttribute("artId", artId);
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
			break;
		}
	}
		
	}

}
