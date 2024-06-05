package com.jiahong.item.controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jiahong.item.model.ItemService;
import com.jiahong.item.model.ItemVO;
import java.util.List;

@WebServlet("/item/*")
public class ItemServlet extends HttpServlet {

    private ItemService itemService = new ItemService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getPathInfo().substring(1);

        switch (action) {
            case "list":
                listItems(request, response);
                break;
            case "view":
                viewItem(request, response);
                break;
            case "add":
                addItem(request, response);
                break;
            case "update":
                updateItem(request, response);
                break;
            case "delete":
                deleteItem(request, response);
                break;
            default:
                listItems(request, response);
                break;
        }
    }

    private void listItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ItemVO> itemList = itemService.listAllItems();
        request.setAttribute("itemList", itemList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/item/itemList.jsp");
        dispatcher.forward(request, response);
    }

    private void viewItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer itemId = Integer.valueOf(request.getParameter("itemId"));
        ItemVO item = itemService.getItemById(itemId);
        request.setAttribute("item", item);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/item/itemView.jsp");
        dispatcher.forward(request, response);
    }

    private void addItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 待實現：添加新項目的邏輯
    }

    private void updateItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 待實現：更新現有項目的邏輯
    }

    private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer itemId = Integer.valueOf(request.getParameter("itemId"));
        itemService.deleteItem(itemId);

        listItems(request, response);
    }
}
//package com.jiahong.item.controller;
//
//import java.io.IOException;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import com.jiahong.item.model.ItemService;
//import com.jiahong.item.model.ItemVO;
//import java.util.List;
//
//@WebServlet("/item/*")
//public class ItemServlet extends HttpServlet {
//
//    private ItemService itemService = new ItemService();
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doPost(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getPathInfo().substring(1);
//
//        switch (action) {
//            case "list":
//                listItems(request, response);
//                break;
//            case "view":
//                viewItem(request, response);
//                break;
//            case "add":
//                addItem(request, response);
//                break;
//            case "update":
//                updateItem(request, response);
//                break;
//            case "delete":
//                deleteItem(request, response);
//                break;
//            default:
//                listItems(request, response);
//                break;
//        }
//    }
//
//    private void listItems(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<ItemVO> itemList = itemService.listAllItems();
//        request.setAttribute("itemList", itemList);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/item/itemList.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    private void viewItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Integer itemId = Integer.valueOf(request.getParameter("itemId"));
//        ItemVO item = itemService.getItemById(itemId);
//        request.setAttribute("item", item);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/item/itemView.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    private void addItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Implementation for adding a new item
//    }
//
//    private void updateItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Implementation for updating an existing item
//    }
//
//    private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Integer itemId = Integer.valueOf(request.getParameter("itemId"));
//        itemService.deleteItem(itemId);
//
//        listItems(request, response);
//    }
//}