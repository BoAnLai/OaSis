<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ryan.subs.model.*"%>
<%@ page import="com.mike.user.model.*"%>

<%
	@SuppressWarnings("unchecked")
    List<SubsVO> list = (List<SubsVO>) session.getAttribute("subsList");
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>我的訂閱</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<style>
body {
	padding: 20px;
}

.card {
	border: 2px solid #ddd;
	margin-bottom: 20px;
}

.my-button {
	background-color: #4CAF50; /* 按鈕背景色 */
	border: none; /* 無邊框 */
	color: white; /* 文字顏色 */
	padding: 10px 5px; /* 內邊距 */
	text-align: center; /* 文字居中 */
	text-decoration: none; /* 無下劃線 */
	display: inline-block; /* 行內塊元素 */
	font-size: 16px; /* 字體大小 */
	margin: 4px 2px; /* 外邊距 */
	cursor: pointer; /* 鼠標樣式 */
	border-radius: 8px; /* 圓角 */
}

.my-button:hover {
	background-color: #45a049; /* 滑鼠懸停背景色 */
}
</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<%@ include file="../home/navbar.jsp" %>




<h2>遊戲訂閱</h2>
    <%
    int count = 1;
    for (SubsVO subs : list) {
        if (subs.getSubsGameId() != null) {
    %>
        <table border="1">
            <tr>
                <th>訂閱編號</th>
                <th>遊戲</th>
                <th>訂閱日期</th>
                <th>訂閱狀態</th>
            </tr>

                <tr>
                    <td><%= subs.getSubsId() %></td>
                    <td><%= subs.getSubsGameId() %></td>
                    <td><%= subs.getSubsTimestamp() %></td>
                    <td><%= (subs.getSubsStatus() ? "已訂閱" : "未訂閱") %></td>
                </tr>
            <%
                
            %>
        </table>
    <%
        } else if(count <= 1){
    %>
        <p>您還沒有訂閱 喜歡的遊戲 !</p>
    <%
    		count += 1;
    		}
		}
    %>
    
    
<h2>文章訂閱</h2>
    <%
    int count2 = 1;
    for (SubsVO subs : list) {
    	
        if (subs.getSubsArtId() != null && subs.getSubsArtId() != 0) {
    %>
        <table border="1">
            <tr>
                <th>訂閱編號</th>
                <th>文章</th>
                <th>訂閱日期</th>
                <th>訂閱狀態</th>
            </tr>

                <tr>
                    <td><%= subs.getSubsId() %></td>
                    <td><%= subs.getSubsArtId() %></td>
                    <td><%= subs.getSubsTimestamp() %></td>
                    <td><%= (subs.getSubsStatus() ? "已訂閱" : "未訂閱") %></td>
                </tr>
        </table>
    <%
        } else if(count2 <= 1){ 
        	
    %>
        <p>您還沒有訂閱 喜歡的文章 !</p>
    <%
        	count2 += 1;
        	}
        }
    %>

	<form id="subscribeForm" action="/your-endpoint" method="post">
		<input type="hidden" name="subsUserId" value="userId"> <input
			type="hidden" name="subsGameId" value="gameId">
		<!-- 如果是遊戲訂閱 -->
		<input type="hidden" name="subsArtId" value="artId">
		<!-- 如果是文章訂閱 -->
		<input type="hidden" name="subsTimestamp" value="2023-05-29T00:00:00Z">
		<input type="hidden" name="subsStatus" value="true"> <input
			type="hidden" name="type" value="game">
		<!-- 或 "art" -->
		<button type="submit">訂閱</button>
	</form>

	<!-- 
		<% if(user != null){ %>
			<h2><%= user.getUserIdentity() %></h2>
		<% }else{ %>
			<h2>not login yet</h2>
		<% } %>
	 -->

</body>
</html>