<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jiahong.product.model.*"%>

<%
    ProductService productService = new ProductService();
    List<ProductVO> productList = productService.listAllProducts();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>產品列表</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        /* Add your custom styles here */
    </style>
</head>
<body>
    <%@ include file="/home/navbar.jsp" %>
    <div class="container">
        <h1 class="text-center">產品列表</h1>
        <table class="table table-striped align-middle table-bordered text-center" id="productTable">
            <thead>
                <tr>
                    <th>產品ID</th>
                    <th>產品名稱</th>
                    <th>產品價格</th>
                    <!-- Add more table headers as needed -->
                </tr>
            </thead>
            <tbody>
                <% for(ProductVO product: productList){ %>
                    <tr>
                        <td><%= product.getProductId() %></td>
                        <td><%= product.getProductName() %></td>
                        <td><%= product.getProductPrice() %></td>
                        <!-- Add more table data as needed -->
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>

    <!-- Add your scripts here -->
</body>
</html>
