package com.shiyen.message.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shiyen.message.model.MessageService;
import com.shiyen.message.model.MessageVO;

@WebServlet("/message")
public class MessageServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("application/json; charset=UTF-8");
		String action = req.getParameter("act");
		
		switch (action) {
		
		case "addMessage":
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
//			接收參數和錯誤驗證
			Integer userId = Integer.valueOf(req.getParameter("userId").trim());
			if (userId == null) {
				errorMsgs.add("使用者錯誤");
			}
	        Integer artMessageId = Integer.valueOf(req.getParameter("artMessageId").trim());
	        if (userId == null) {
				errorMsgs.add("文章編號錯誤");
			}
	        Integer artId = Integer.valueOf(req.getParameter("artId").trim());
	        if (userId == null) {
				errorMsgs.add("文章編號錯誤");
			}
	        Timestamp messageTimestamp =  Timestamp.valueOf(req.getParameter("messageTimestamp").trim());
	        if (userId == null) {
				errorMsgs.add("時間錯誤");
			}
	        String messageContent = req.getParameter("message");
	        if (messageContent == null || messageContent.trim().length() == 0) {
				errorMsgs.add("內容請勿空白");
			}	
	        
	        MessageVO messageVO = new MessageVO();
	        messageVO.setMessageUserId(userId);
	        messageVO.setMessageArtId(artId);
	        messageVO.setMessageContent(messageContent);
	        messageVO.setMessageTimestamp(messageTimestamp);
	        
	        //新增資料
			MessageService messageSvc = new MessageService();
			messageSvc.addMessage(messageVO);
			//回傳資料
			String url = "/forum/artView.jsp";
			req.setAttribute("artId", artId);
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);	
			break;
			

			
		}
	}
}
