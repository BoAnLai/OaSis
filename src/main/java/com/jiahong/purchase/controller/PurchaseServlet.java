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
        } else if ("purchaseClosing".equals(action)) {
            closePurchase(req, res);
        }
    }

    private void addToCart(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // 獲取商品ID
        int productId = Integer.parseInt(req.getParameter("productId"));
        
        // 獲取商品詳細資料
        ProductService productService = new ProductService();
        ProductVO product = productService.getProductById(productId);

        req.setAttribute("product", product);

        // 重定向到購物車頁面
        req.getRequestDispatcher("/purchase/myCart.jsp").forward(req, res);
    }

    private void closePurchase(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // 結帳的邏輯...
    }
}
