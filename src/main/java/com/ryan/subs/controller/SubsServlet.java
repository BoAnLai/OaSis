package com.ryan.subs.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.user.model.UserDTO;
import com.ryan.subs.model.SubsService;
import com.ryan.subs.model.SubsVO;

public class SubsServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		
		
		if ("subsupdate".equals(action)) {
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			HttpSession session = req.getSession();
			
			UserDTO user = (UserDTO)session.getAttribute("user");
			Integer subsId = Integer.valueOf(req.getParameter("subsId"));
			
			SubsService subsSvc = new SubsService();
			
			subsSvc.updateSubsVO(subsId);
			
			if (user == null) {
				req.getRequestDispatcher("/login").forward(req, res);
				return;
			}
			
			String url = "/subs/mySubs.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);//導向到 我的訂閱 頁面
            return;
            
		}
		
		if ("mysubs".equals(action)) { // from homepage mysubs req(button)
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			HttpSession session = req.getSession();
			UserDTO user = (UserDTO)session.getAttribute("user");
			SubsVO subsId = (SubsVO)session.getAttribute("subsId");

			if (user == null) {
				req.getRequestDispatcher("/login").forward(req, res);
			}
			if (subsId == null) {
				
			}
			
			SubsService subsSvc = new SubsService();
			List<SubsVO> subsList = subsSvc.findByUserId(user.getUserId());
			
			req.setAttribute("subsList", subsList);
			String url = "/subs/mySubs.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);//導向到 我的訂閱 頁面
            return;
			
			
		}
		
		String subsId = req.getParameter("subsId");
		String userId = req.getParameter("userId");
	    String gameId = req.getParameter("gameId");
	    String articleId = req.getParameter("articleId");
	    String subsType = req.getParameter("subsType");
	    System.out.println(subsType);
	    
	   
	    if ("game".equals(subsType)) {
            // 處理遊戲訂閱邏輯
	    	SubsService subsSvc = new SubsService();
//			SubsVO subsVO = subsSvc.findByPrimaryKey(subsId);
//			
			System.out.println("subsVO");
			
			if (subsId == null || subsId.isEmpty()) {
				
				
				Integer subsGameId = Integer.valueOf(gameId);
				Integer subsUserId = Integer.valueOf(userId);
				Boolean subsStatus = true;
				
				SubsVO subsVOGame =  new SubsVO();
				subsVOGame.setSubsGameId(subsGameId);
				subsVOGame.setSubsUserId(subsUserId);
				subsVOGame.setSubsStatus(subsStatus);
				
				subsSvc.insertGmaeSubsVO(subsUserId, subsGameId, subsStatus);
				
			}else {
				
				Integer subsIdNew = Integer.valueOf(req.getParameter("subsId"));
				SubsVO subsVO = subsSvc.findByPrimaryKey(subsIdNew);
				// 如果訂閱存在，更新訂閱狀態為false
			    subsSvc.updateSubsVO(subsVO.getSubsId());
			}
				
//        } else if ("article".equals(subsType)) {
//            // 處理文章訂閱邏輯
//            handleArticleSubscription(userId, articleId);
//        }
	    
	    }
	    
	   
	    
	}
	
}
