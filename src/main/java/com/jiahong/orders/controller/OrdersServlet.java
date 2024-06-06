//package com.jiahong.orders.controller;
//
//import java.io.IOException;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.jiahong.orders.model.OrdersService;
//import com.jiahong.orders.model.OrdersVO;
//
//import java.util.List;
//
//@WebServlet("/orders/*")
//public class OrdersServlet extends HttpServlet {
//
//    private OrdersService ordersService = new OrdersService();
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
//                listOrders(request, response);
//                break;
//            case "view":
//                viewOrder(request, response);
//                break;
//            case "add":
//                addOrder(request, response);
//                break;
//            case "update":
//                updateOrder(request, response);
//                break;
//            case "delete":
//                deleteOrder(request, response);
//                break;
//            default:
//                listOrders(request, response);
//                break;
//        }
//    }
//
//    private void listOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<OrdersVO> orderList = ordersService.listAllOrders();
//        request.setAttribute("orderList", orderList);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/orders/orderList.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    private void viewOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Integer orderId = Integer.valueOf(request.getParameter("orderId"));
//        OrdersVO order = ordersService.getOrderById(orderId);
//        request.setAttribute("order", order);
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/orders/orderView.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    private void addOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Implementation for adding a new order
//    }
//
//    private void updateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Implementation for updating an existing order
//    }
//
//    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        Integer orderId = Integer.valueOf(request.getParameter("orderId"));
//        ordersService.deleteOrder(orderId);
//
//        listOrders(request, response);
//    }
//}
