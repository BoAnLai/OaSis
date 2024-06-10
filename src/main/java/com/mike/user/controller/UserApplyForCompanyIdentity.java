package com.mike.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mike.msg.model.MsgService;
import com.mike.user.model.UserService;

@MultipartConfig
@WebServlet(name = "UserRegister", urlPatterns = {"/user/applyForCompanyIdentity","/user/applyingForCompanyIdentity"})
public class UserApplyForCompanyIdentity extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/user/applyCompanyIdentity.jsp").forward(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String companyName = req.getParameter("companyName");

		UserService userSvc = new UserService();
		userSvc.applyCompanyIdentity(userId, companyName);
		
		MsgService msgService = new MsgService();
		msgService.applyForCompany(userId);
	}
	
}
