package com.mike.home.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HomeController", urlPatterns = {"/home","/home/article"})
public class HomeController extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res){
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		
		if(req.getServletPath().equals("/home")) {		
			try {
				req.getRequestDispatcher("/home/home.jsp").forward(req, res);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		if(req.getServletPath().equals("/home/article")) {
			
			req.setAttribute("reurl", "toArtList");
			try {
				res.sendRedirect("/oasis/reurl");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
}
