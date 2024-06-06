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

	public void doPost(HttpServletRequest req, HttpServletResponse res, Timestamp subsTimestamp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("subsGame".equals(action)) {// from game subs req
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			String strSubs = req.getParameter("subsId");

			Integer subsId = Integer.valueOf(strSubs);

			//  查詢有無訂閱資料
			SubsService subsSvc = new SubsService();
			SubsVO subsVO = subsSvc.findByPrimaryKey(subsId);
			if (subsVO == null) {
				
				Integer subsGameId = Integer.valueOf(req.getParameter("game_id"));
				Integer subsUserId = Integer.valueOf(req.getParameter("user_id"));
//				Timestamp subsTimestamp = new timestamp();
				Boolean subsStatus = true;
				
				SubsVO subsVOGame =  new SubsVO();
				subsVOGame.setSubsGameId(subsGameId);
				subsVOGame.setSubsUserId(subsUserId);
				subsVOGame.setSubsTimestamp(subsTimestamp);
				subsVOGame.setSubsStatus(subsStatus);
				
				subsSvc.insertGmaeSubsVO(subsUserId, subsGameId, subsTimestamp, subsStatus);
			} else {
			
				
				return;
			}
		}
		if ("subsArt".equals(action)) {// from art subs req
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			String strSubs = req.getParameter("subsId");
			
			Integer subsId = Integer.valueOf(strSubs);
			
			//  查詢有無訂閱資料
			SubsService subsSvc = new SubsService();
			SubsVO subsVO = subsSvc.findByPrimaryKey(subsId);
			if (subsVO == null) {
				
				Integer subsArtId = Integer.valueOf(req.getParameter("art_id"));
				Integer subsUserId = Integer.valueOf(req.getParameter("user_id"));
//				Timestamp subsTimestamp = new timestamp();
				Boolean subsStatus = true;
				
				SubsVO subsVOArt =  new SubsVO();
				subsVOArt.setSubsArtId(subsArtId);
				subsVOArt.setSubsUserId(subsUserId);
				subsVOArt.setSubsTimestamp(subsTimestamp);
				subsVOArt.setSubsStatus(subsStatus);
				
				subsSvc.insertArtSubsVO(subsUserId, subsArtId, subsTimestamp, subsStatus);
				
			} else {
				
				
				return;
			}
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
			
			SubsService subsSvc = new SubsService();
			List<SubsVO> subsList = subsSvc.findByUserId(user.getUserId());
			
			req.setAttribute("subsList", subsList);
			String url = "/subs/subsTest";
			RequestDispatcher successView = req.getRequestDispatcher(url);
            successView.forward(req, res);//導向到 我的訂閱 頁面
            return;
			
			
		}
	}

}
