<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.jiahong.product.model.*"%>
<%
	ProductVO product = (ProductVO)request.getAttribute("product");
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin-top: 20px;
            background: rgb(238, 238, 238, 0.6);
            color: #9aa9c1;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .table th, .table td {
            vertical-align: middle;
        }
        .table img {
            width: 100px;
            height: auto;
        }
    </style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%@ include file="../home/navbar.jsp" %>
    <div class="container mt-5">
        <h2>購物車</h2>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">產品圖片</th>
                            <th scope="col">產品名稱</th>
                            <th scope="col">產品價格</th>
                            <th scope="col">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                            <tr>
                                <td><img src="${product.productImg}" alt="${product.productName}"></td>
                                <td>${product.productName}</td>
                                <td>${product.productPrice}</td>
                                <td>
                                    <form method="post" action="${pageContext.request.contextPath}/removeFromCart">
                                        <input type="hidden" name="productId" value="${product.productId}">
                                        <button type="submit" class="btn btn-danger">移出購物車</button>
                                    </form>
                                    <form method="post" action="${pageContext.request.contextPath}/purchaseClosing">
                                        <input type="hidden" name="productId" value="${product.productId}">
                                        <button type="submit" class="btn btn-success">購買</button>
                                    </form>
                                </td>
                            </tr>
                    </tbody>
                </table>

                <button type="submit" class="btn btn-primary">完成購買</button>

        <form method="post" action="${pageContext.request.contextPath}/ProductServlet">
            <input type="hidden" name="action" value="select_all_product">
            <button type="submit" class="btn btn-warning" aria-label="Close">回到產品清單</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
