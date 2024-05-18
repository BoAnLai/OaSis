package com.mike.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
@WebServlet(name = "userLogin", urlPatterns = {"/login","/logging"})
public class UserLogin extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res){
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
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
			
		}
	}
	
}
