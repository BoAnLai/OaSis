package com.jiahong.purchase.filter;
//package com.mike.purchase.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.mike.purchase.model.PurchaseService;
//import com.mike.purchase.model.PurchaseVO;
//import com.mike.user.model.UserDTO;
//
//@WebFilter("/LoginFilter")
//public class PurchaseFilter implements Filter{
//
//	 public PurchaseFilter() {
//	        super();
//	    }
//
////		public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
////
////			HttpSession session = req.getSession();
////			UserDTO user = (UserDTO)session.getAttribute("user");
////			
////			session.setAttribute("headingPath", req.getRequestURI());
////			
////			
////			if(user == null) {
////				req.getRequestDispatcher("/login").forward(req, res);
////			}else {
////				chain.doFilter(req, res);
////			}		
////		}
//
//		public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
//				throws IOException, ServletException {
//
//			HttpSession session = req.getSession();
//			UserDTO user = (UserDTO)session.getAttribute("user");
//			PurchaseService purchaseSvc = new PurchaseService();
//			PurchaseVO purchase = purchaseSvc.getCurrentPurchase(user.getUserId());
//			
//			if(purchase == null) {
//				purchaseSvc.createPurchase();
//			}
//			chain.doFilter(req, res);
//		}
//	
//}
