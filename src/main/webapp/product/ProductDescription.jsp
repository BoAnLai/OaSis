<%@page import="com.jiahong.product.model.ProductVO"%>
<%@page import="java.util.List"%>
<%@page import="com.jiahong.product.model.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Integer productId = (Integer)request.getAttribute("productId");
    ProductService productSvc = new ProductService();
    ProductVO vo = productSvc.getProductById(productId);
    pageContext.setAttribute("vo", vo, PageContext.REQUEST_SCOPE);
%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    
        body {
            margin-top: 20px;
            background: rgb(238, 238, 238, 0.6);
            color: #9aa9c1;
        }

        a {
            text-decoration: none;
        }

        .product-details {
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product-details h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .product-details .product-image img {
            width: 100%;
            border-radius: 10px;
            cursor: pointer;
        }

        .product-details .product-info {
            overflow: hidden;
        }

        .product-details .product-info h3 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .product-details .product-info h4 {
            font-size: 16px;
            margin-bottom: 10px;
        }

        .product-details .product-info p {
            font-size: 16px;
            line-height: 1.5;
        }

        /* 修改按鈕的高度和間距 */
        .btn {
            height: 50px; /* 設置按鈕高度 */
            margin-bottom: 10px; /* 設置按鈕間距 */
        }
    </style>
</head>

<body>

<section id="team" class="team_area section-padding">
    <div class="container">
        <div class="product-details">
            <h2>產品介紹</h2>

            <c:if test="${not empty errorMsgs2}">
                <ul>
                    <c:forEach var="message" items="${errorMsgs2}">
                        <div class="alert alert-danger" role="alert">
                            ${message}
                        </div>
                    </c:forEach>
                </ul>
            </c:if>
            <c:if test="${not empty successMsgs2}">
                <ul>
                    <c:forEach var="message" items="${successMsgs2}">
                        <div class="alert alert-success" role="alert">
                            ${successMsgs2}
                        </div>
                    </c:forEach>
                </ul>
            </c:if>

            <div class="row">
                <div class="col-md-6">
                    <div class="product-image">
                        <img src="<%= vo.getProductImg() %>" alt="產品圖片" class="img-fluid"
                             data-img-src="<%= vo.getProductImg() %>"
                             data-product-name="<%= vo.getProductName() %>">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="product-info">
                        <h3>產品名稱: <%= vo.getProductName() %></h3>
                        <h4>公司名稱: <%= vo.getProductUserCompanyName() %></h4>
                        <h4>產品價格: <%= vo.getProductPrice() %></h4>
                        <p>產品描述: <%= vo.getProductDescription() %></p>
                    </div>
                    <!-- 加入購物車按鈕 -->
                    <button class="btn btn-primary">加入購物車</button>
                    <!-- 購買按鈕 -->
                    <button class="btn btn-success">購買</button>
                    <!-- 回到產品清單按鈕 -->
                    <form method="post" action="<%=request.getContextPath() %>/ProductServlet">
                        <input type="hidden" name="action" value="select_all_product">
                        <button type="submit" class="btn btn-warning" aria-label="Close">回到產品清單</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
