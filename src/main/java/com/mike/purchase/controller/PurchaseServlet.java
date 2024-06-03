package com.mike.purchase.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PurchaseServlet", urlPatterns = {"/myCart"})
public class PurchaseServlet extends HttpServlet{
	
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		
		try {
			req.getRequestDispatcher("/purchase/myCart.jsp").forward(req, res);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
