package com.jiahong.purchase.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jiahong.product.model.ProductService;
import com.jiahong.product.model.ProductVO;
import com.jiahong.purchase.model.PurchaseService;
import com.jiahong.purchase.model.PurchaseVO;
import com.mike.user.model.UserDTO;

@MultipartConfig
@WebServlet(name = "PurchaseServlet")
public class PurchaseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");

        if ("add_to_cart".equals(action)) {
            addToCart(req, res);
        } else if ("buyPurchase".equals(action)) {
            buyPurchase(req, res);
        } else if ("removePurchase".equals(action)) {
        	removePurchase(req, res);
        } else if ("purchaseClosing".equals(action)) {
        	closePurchase(req, res);
        } else if ("purchaseClosing".equals(action)) {
        	closePurchase(req, res);
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	HttpSession session = req.getSession();
       	UserDTO user = (UserDTO)session.getAttribute("user");
    	// 獲取商品ID
        int productId = Integer.parseInt(req.getParameter("productId"));
        
        // 透過purchaseService的insert方法去存一筆新的purchase(VO必須先建立好)
        PurchaseService purchaseService = new PurchaseService();
        PurchaseVO purchase = new PurchaseVO();
        purchase.setPurchaseProductId(productId);
        purchase.setPurchaseUserId(user.getUserId());
        purchase.setPurchaseUserRealName(user.getUserRealName());
        purchase.setPurchaseUserCellphone(user.getUserCellphone());
        purchase.setPurchaseUserAddress(user.getUserAddress());
        purchase.setPurchaseClosed(false);
        purchaseService.insert(purchase);

        // 重定向到購物車頁面
        req.getRequestDispatcher("/purchase/myCart.jsp").forward(req, res);
    }
    private void removePurchase(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int purchaseId = Integer.parseInt(req.getParameter("purchaseId"));
        PurchaseService purchaseService = new PurchaseService();
        purchaseService.removePurchase(purchaseId);
        

        // 重定向到購物車頁面
        req.getRequestDispatcher("/purchase/myCart.jsp").forward(req, res);
    }
    private void buyPurchase(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int purchaseId = Integer.parseInt(req.getParameter("purchaseId"));
        PurchaseService purchaseService = new PurchaseService();
        PurchaseVO purchase = purchaseService.getPurchaseByPurchaseId(purchaseId);
        purchase.setPurchaseClosed(true);
        purchaseService.updatePurchase(purchase);
        

        // 重定向到購物車頁面
        req.getRequestDispatcher("/purchase/myCart.jsp").forward(req, res);
    }
    private void closePurchase(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // 結帳的邏輯...
    }
}
