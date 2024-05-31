<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <title>產品列表</title>
</head>
<body>
    <h1>產品列表</h1>
    <table>
        <thead>
            <tr>
                <th>產品ID</th>
                <th>產品名稱</th>
                <th>產品價格</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${productList}">
                <tr>
                    <td>${product.productId}</td>
                    <td>${product.productName}</td>
                    <td>${product.productPrice}</td>
                    <td>
                        <a href="product/view?productId=${product.productId}">查看</a>
                        <a href="product/update?productId=${product.productId}">修改</a>
                        <a href="product/delete?productId=${product.productId}">刪除</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
