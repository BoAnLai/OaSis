package com.mike.msg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.msg.model.Msg;
import com.mike.msg.model.MsgAdminService;
import com.mike.msg.model.MsgUserService;
import com.mike.user.model.UserDTO;

@MultipartConfig
@WebServlet(name = "MsgController", urlPatterns = {"/msg", "/deleteMsg"})
public class MsgController extends HttpServlet {

	// /msg
	public void doGet(HttpServletRequest req, HttpServletResponse res) {
		try {
			req.getRequestDispatcher("/home/msg.jsp").forward(req, res);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	// /deleteMsg
	public void doPost(HttpServletRequest req, HttpServletResponse res) {

		MsgAdminService msgAdminSvc = new MsgAdminService();
		MsgUserService msgUserSvc = new MsgUserService();
		HttpSession session = req.getSession();
		int userId = ((UserDTO)session.getAttribute("user")).getUserId();
		
		int msgId = Integer.parseInt(req.getParameter("msgId"));
		String msgType = req.getParameter("msgType");
		
		switch (msgType) {
			case Msg.TYPE_REGULAR_APPLY_FOR_COMPANY:
				msgAdminSvc.removeMsgFromAdmin(msgId,msgType);
				break;
			case Msg.TYPE_GAME_SUBSCRIBE_NOTIFY:
				msgUserSvc.removeMsgFromUser(userId, msgId, msgType);
				break;
		}
		
		
	}
}
