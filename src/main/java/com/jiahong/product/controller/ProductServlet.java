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

import com.jiahong.product.model.ProductService;
import com.jiahong.product.model.ProductVO;

@MultipartConfig
public class ProductServlet extends HttpServlet {

    private ProductService productService = new ProductService();

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        System.out.print("req URL:");
        System.out.println(req.getRequestURL());

        HttpSession session = req.getSession();
        String action = req.getServletPath();

        if (action.equals("/product/list")) {
            listProducts(req, res);
        } else if (action.equals("/product/view")) {
            viewProduct(req, res);
        } else if (action.equals("/product/add")) {
            addProduct(req, res);
        } else if (action.equals("/product/update")) {
            updateProduct(req, res);
        } else if (action.equals("/product/delete")) {
            deleteProduct(req, res);
        } else {
            listProducts(req, res);
        }
    }

    private void listProducts(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<ProductVO> productList = productService.listAllProducts();
        req.setAttribute("productList", productList);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/productList.jsp");
        dispatcher.forward(req, res);
    }

    private void viewProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Integer productId = Integer.valueOf(req.getParameter("productId"));
        ProductVO product = productService.getProductById(productId);
        req.setAttribute("product", product);

        RequestDispatcher dispatcher = req.getRequestDispatcher("/product/productView.jsp");
        dispatcher.forward(req, res);
    }

    private void addProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Implementation for adding a new product
    }

    private void updateProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // Implementation for updating an existing product
    }

    private void deleteProduct(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Integer productId = Integer.valueOf(req.getParameter("productId"));
        productService.deleteProduct(productId);

        listProducts(req, res);
    }
}
