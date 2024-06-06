package com.mike.purchase.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mike.purchase.model.PurchaseService;
import com.mike.purchase.model.PurchaseVO;

@MultipartConfig
@WebServlet(name = "PurchaseServlet", urlPatterns = {"/myCart", "/purchaseClosing"})
public class PurchaseServlet extends HttpServlet{
	
	
	
	// /myCart
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
	
	
	
	// /purchaseClosing
	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		
		
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int purchaseId = Integer.parseInt(req.getParameter("purchaseId"));
		String realName = req.getParameter("realName");
		String cellphone = req.getParameter("cellphone");
		String address = req.getParameter("address");
		
		PurchaseService purchaseSvc = new PurchaseService();
		PurchaseVO purchase = purchaseSvc.getPurchaseByPurchaseId(purchaseId);
		
		purchase.setPurchaseUserRealName(realName);
		purchase.setPurchaseUserCellphone(cellphone);
		purchase.setPurchaseUserAddress(address);
		
		purchaseSvc.updatePurchase(purchase);
		purchaseSvc.closePurchase(purchase);
		
		try {
			req.getRequestDispatcher("/").forward(req, res);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
