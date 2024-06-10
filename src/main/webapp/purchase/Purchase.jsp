<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.jiahong.purchase.model.PurchaseService"%>
<%@ page import="com.jiahong.purchase.model.PurchaseVO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.io.IOException"%>
<%@ page import="com.jiahong.product.model.*"%>
<%@ page import="com.jiahong.purchase.model.*"%>
<%
	ProductVO product = (ProductVO)request.getAttribute("product");
    PurchaseVO purchase = (PurchaseVO)request.getAttribute("purchase");
%>
<%
    // 獲取當前用戶的 ID，這裡假設用戶 ID 存儲在 session 中
    Integer userId = (Integer) session.getAttribute("userId");

    // 如果用戶未登錄，重定向到登錄頁面
    if (userId == null) {
        try {
            response.sendRedirect(request.getContextPath() + "/user/userLogin.jsp");
            return;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 創建 PurchaseService 實例並獲取當前購買記錄
    PurchaseService purchaseSvc = new PurchaseService();
 //   PurchaseVO purchase = purchaseSvc.getCurrentPurchase(userId); %>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購買記錄</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1>購買記錄</h1>
        <% if (purchase != null) { %>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">購買 ID: <%= purchase.getPurchaseId() %></h5>
                    <p class="card-text">用戶 ID: <%= purchase.getPurchaseUserId() %></p>
                    <p class="card-text">用戶真實姓名: <%= purchase.getPurchaseUserRealName() %></p>
                    <p class="card-text">用戶手機: <%= purchase.getPurchaseUserCellphone() %></p>
                    <p class="card-text">用戶地址: <%= purchase.getPurchaseUserAddress() %></p>
                    <p class="card-text">購買時間: <%= purchase.getPurchaseTimestamp() %></p>
                    <p class="card-text">購買狀態: <%= purchase.getPurchaseClosed() ? "已關閉" : "未關閉" %></p>
                </div>
            </div>
        <% } else { %>
            <p>沒有找到相關購買記錄。</p>
        <% } %>
    </div>
</body>
</html>
