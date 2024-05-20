package com.mike.user.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.user.model.UserService;
import com.mike.user.model.exception.EmailNotFoundException;

@MultipartConfig
@WebServlet(name = "userLogin", urlPatterns = {"/login","/logging"})
public class UserLogin extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res){
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
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
		}
		
		if(req.getServletPath().equals("/logging")) {
			
			String inputEmail = req.getParameter("email");
			String inputPassword = req.getParameter("password");
			
			UserService userSvc = new UserService();
			try {
				if(userSvc.identityConfirm(inputEmail, inputPassword)) {
					System.out.println(inputEmail+" identity confirm");
					session.setAttribute("userEmail",inputEmail);
					
					res.sendRedirect("/oasis");
				}else {
					req.setAttribute("errorMsg", new String("the password is wrong"));
					System.out.println("password is wrong");
					res.sendRedirect("login");
				}
			} catch (EmailNotFoundException e) {
				req.setAttribute("errorMsg", new String("this email is not register yet"));
				System.out.println("email not found exception");
			} catch (SQLException e) {
				req.setAttribute("errorMsg", new String("something error when connect to database, try again later"));
				System.out.println("sql exception");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				System.out.println(inputEmail);
				System.out.println(inputPassword);
				System.out.println("in logging servlet");				
			}
			
			
			
		}
	}
	
}
