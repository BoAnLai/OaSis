package com.mike.msg.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mike.msg.model.MsgService;

@MultipartConfig
@WebServlet(name = "MsgController", urlPatterns = {"/msg", "/deleteMsg"})
public class MsgController extends HttpServlet {

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
	
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {

		int msgId = Integer.parseInt(req.getParameter("msgId"));
		
		MsgService msgSvc = new MsgService();
		msgSvc.removeMsgFromApplyForCompany(msgId);
		
	}
}
