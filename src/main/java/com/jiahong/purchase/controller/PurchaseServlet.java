package com.jiahong.purchase.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jiahong.purchase.model.PurchaseService;
import com.jiahong.purchase.model.PurchaseVO;
import java.util.List;

@WebServlet("/purchase/*")
public class PurchaseServlet extends HttpServlet {

    private PurchaseService purchaseService = new PurchaseService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo().substring(1);

        switch (action) {
            case "list":
                listPurchases(request, response);
                break;
            case "view":
                viewPurchase(request, response);
                break;
            case "add":
                addPurchase(request, response);
                break;
            case "update":
                updatePurchase(request, response);
                break;
            case "delete":
                deletePurchase(request, response);
                break;
            default:
                listPurchases(request, response);
                break;
        }
    }

    private void listPurchases(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<PurchaseVO> purchaseList = purchaseService.listAllPurchases();
        request.setAttribute("purchaseList", purchaseList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/purchase/purchaseList.jsp");
        dispatcher.forward(request, response);
    }

    private void viewPurchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer purchaseId = Integer.valueOf(request.getParameter("purchaseId"));
        PurchaseVO purchase = purchaseService.getPurchaseById(purchaseId);
        request.setAttribute("purchase", purchase);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/purchase/purchaseView.jsp");
        dispatcher.forward(request, response);
    }

    private void addPurchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 待實現：添加新訂單的邏輯
    }

    private void updatePurchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 待實現：更新現有訂單的邏輯
    }

    private void deletePurchase(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer purchaseId = Integer.valueOf(request.getParameter("purchaseId"));
        purchaseService.deletePurchase(purchaseId);

        listPurchases(request, response);
    }
}
