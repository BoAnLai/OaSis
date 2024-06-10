package com.shiyen.forum.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.Case;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.ViewportUI;

import com.shiyen.art.model.ArtService;
import com.shiyen.art.model.ArtVO;
import com.shiyen.message.model.MessageService;
import com.shiyen.message.model.MessageVO;

@WebServlet("/post")
public class PostServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("act");
		
		switch (action) {
		
		//新增訊息
		case "addMessage":{
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			接收參數和錯誤驗證
			Integer artFirstId = Integer.valueOf(req.getParameter("artFirstId").trim());
			if (artFirstId == null) {
				errorMsgs.add("使用者錯誤");
			}
			Integer userId = Integer.valueOf(req.getParameter("userId").trim());
			if (userId == null) {
				errorMsgs.add("使用者錯誤");
			}
	        Integer artId = Integer.valueOf(req.getParameter("artId").trim());
	        if (userId == null) {
				errorMsgs.add("文章編號錯誤");
			}
	        Timestamp messageTimestamp =  Timestamp.valueOf(req.getParameter("messageTimestamp").trim());
	        if (userId == null) {
				errorMsgs.add("時間錯誤");
			}
	        String messageContent = req.getParameter("messageContent");
	        if (messageContent == null || messageContent.trim().length() == 0) {
				errorMsgs.add("內容請勿空白");
			}	
	        Integer messageStatus = 0;
	        
	        MessageVO messageVO = new MessageVO();
	        messageVO.setMessageUserId(userId);
	        messageVO.setMessageArtId(artId);
	        messageVO.setMessageContent(messageContent);
	        messageVO.setMessageTimestamp(messageTimestamp);
	        messageVO.setMessageStatus(messageStatus);
	        
	        //新增資料
			MessageService messageSvc = new MessageService();
			messageSvc.addMessage(messageVO);
			//回傳資料
			String url = "/forum/artView.jsp";
			req.setAttribute("artId", artFirstId);
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
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
			
			Integer artStatus = 0;
			
			
			ArtVO artVO = new ArtVO();
			artVO.setArtTitle(artTitle);
			artVO.setArtContent(artContent);
			artVO.setArtTimestamp(artTimestamp);
			artVO.setArtReply(artReply);
			artVO.setArtFavor(artFavor);
			artVO.setArtView(artView);
			artVO.setArtStatus(artStatus);
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
			System.out.println(artId);
			
//		回傳資料
			String url = "/forum/artView.jsp";
			req.setAttribute("artId", artId);
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
			break;
		}
//		新增回覆內容
		case "addReply":{
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
			
			Integer	artReply = Integer.valueOf(req.getParameter("artReply").trim());

			
			Integer	artFavor = 0;
			
			Integer	artView = 0;
			
			Integer artStatus = 0;
			
			ArtVO artVO = new ArtVO();
			artVO.setArtTitle(artTitle);
			artVO.setArtContent(artContent);
			artVO.setArtTimestamp(artTimestamp);
			artVO.setArtReply(artReply);
			artVO.setArtFavor(artFavor);
			artVO.setArtView(artView);
			artVO.setArtStatus(artStatus);
			artVO.setArtUserId(userId);
			artVO.setArtGameId(gameId);
			
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("artVO", artVO);// 含有輸入格式錯誤的ArtVO物件,也存入req
				req.setAttribute("artId", artVO.getArtReply() );
				RequestDispatcher failureView = req
						.getRequestDispatcher("/forum/artView.jsp");
				failureView.forward(req, res);
				return;
			}
			
//		     新增資料
				ArtService artSvc = new ArtService();
				 artSvc.addArt(artVO);
//			回傳資料
				String url = "/forum/artView.jsp";
				req.setAttribute("artId", artReply);
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);	
				break;
			}
		
		//修改文章
		case"updateArt":{
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			Integer artId = Integer.valueOf(req.getParameter("artId").trim());
			
			String artTitle = req.getParameter("artTitle");
			if (artTitle == null || artTitle.trim().length() == 0) {
				errorMsgs.add("文章標題: 請勿空白");
			}
			
			String artContent = req.getParameter("artContent").trim();
			System.out.println(artContent);
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
			
			ArtVO artVO = new ArtVO();
			artVO.setArtId(artId);
			artVO.setArtTitle(artTitle);
			artVO.setArtContent(artContent);
			artVO.setArtTimestamp(artTimestamp);
			
			ArtService artSvc = new ArtService();
			artSvc.updateArt(artVO);
			
			
			String url = "/forum/artList.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
			break;
		}
		//刪除文章
		case "delete" :{
			Integer artId = Integer.valueOf(req.getParameter("artId").trim());
			
			ArtService artSvc = new ArtService();
			artSvc.deleteArt(artId);
			
			String url = "/forum/artList.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
			break;
		}
		}
		
	}
}
