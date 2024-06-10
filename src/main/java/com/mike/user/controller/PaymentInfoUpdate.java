package com.mike.user.controller;

import java.io.IOException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;

@MultipartConfig
@WebServlet(name = "PaymentInfoUpdate", urlPatterns = {"/paymentInfoUpdating"})
public class PaymentInfoUpdate extends HttpServlet{

	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		HttpSession session = req.getSession();
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		String realName = req.getParameter("realName");
		String cellphone = req.getParameter("cellphone");
		String address = req.getParameter("address");
		
		UserService userSvc = new UserService();
		UserVO user = userSvc.getByUserId(userId);
		user.setUserRealName(realName);
		user.setUserCellphone(cellphone);
		user.setUserAddress(address);

	    try {
	    	userSvc.userUpdate(userId, user);
	    	res.setContentType("text/plain");
			res.getWriter().write("successfully update user payment info!");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			try {
				res.sendError(HttpServletResponse.SC_BAD_REQUEST,e.getMessage());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
	    session.setAttribute("user",user);
	    
	}
}
