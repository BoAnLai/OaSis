package com.jiahong.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jiahong.product.model.ProductVO;
import com.jiahong.purchase.model.PurchaseVO;

@MultipartConfig
public class ProductServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    	
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
    	if ("select_product".equals(action)) {			
				Integer productId = Integer.valueOf(req.getParameter("productId"));				
				
				String url = "product/ProductDescription.jsp";
				
				
				req.setAttribute("productId", productId);
				
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}

    	if ("select_all_product".equals(action)) {
				String url = "product/ProductList.jsp";

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
		}
    }
}
