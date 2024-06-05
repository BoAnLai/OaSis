package com.mike.user.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.user.model.UserDTO;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;
import com.mike.user.model.exception.EmailNotFoundException;

@MultipartConfig
@WebServlet(name = "userLogin", urlPatterns = {"/login","/logging","/loggingout"})
public class UserLogin extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res){
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		UserService userSvc = new UserService();
		HttpSession session = req.getSession();
		
		
		
		
		if(req.getServletPath().equals("/login")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/user/userLogin.jsp");
			try {
				dispatcher.forward(req,res);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}			
		} // end of if(/login)
		
		
		
		
		if(req.getServletPath().equals("/logging")) {
			
			String inputEmail = req.getParameter("email");
			String inputPassword = req.getParameter("password");
			
			
			try {
				
				if(userSvc.identityConfirm(inputEmail, inputPassword)) {
					
					UserVO user = userSvc.findByEmail(inputEmail);
					UserDTO userDTO = new UserDTO(user);
					
					session.setAttribute("user",userDTO);
					String headingPath = null;
					headingPath = (String)session.getAttribute("headingPath");
					session.removeAttribute("headingPath");
					
					if(headingPath != null) {
						res.sendRedirect(headingPath);
					}else {	
						res.sendRedirect("/oasis");
					}
					
				}else {
					req.setAttribute("errorMsg", new String("密碼錯誤，請重新輸入"));
					try {
						req.getRequestDispatcher("login").forward(req,res);
					} catch (ServletException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
			} catch (EmailNotFoundException e) {
				req.setAttribute("errorMsg", new String("此信箱尚未註冊，請註冊或重新輸入"));
				try {
					req.getRequestDispatcher("login").forward(req,res);
				} catch (ServletException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			} catch (SQLException e) {
				req.setAttribute("errorMsg", new String("資料庫連線異常"));
				try {
					req.getRequestDispatcher("login").forward(req,res);
				} catch (ServletException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
						
		} //end of if(/logging)
		
		
		
		
		if(req.getServletPath().equals("/loggingout")) {
			session.removeAttribute("user");
			try {
				res.sendRedirect("/oasis");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
}
