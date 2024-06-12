<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ryan.subs.model.*"%>
<%@ page import="com.mike.user.model.*"%>
<%@ page import="com.mike.game.model.*"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>我的訂閱</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<style>
html{
	height: 100%;
}
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
.container {
            display: flex;
        }
.left, .right {
            flex: 1;
            padding: 20px;
        }
        th {
        border: 10px solid black;
        padding: 10px;
        text-align: center;
        min-width: 100px; /* 設置最小寬度，可以根據需要調整 */
      
    	}

   		td {
        border: 1px solid black;
        padding: 10px;
        text-align: center;
        min-width: 100px; /* 設置最小寬度，可以根據需要調整 */

    	}
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .message {
            margin-top: 20px;
            color: red;
        }
</style>
<link rel="stylesheet" href="/oasis/home/resources/background.css">
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

	<%@ include file="../home/navbar.jsp"%>
	<%
	//取得 userId
	Integer userId = user.getUserId();


	//使用方法取得list
	SubsService subsService = new SubsService();

	List<SubsVO> subsList = subsService.findByUserId(userId);

	%>
	


	<%if (subsList == null || subsList.isEmpty()){ %>
	<p class="lead fw-bold">
		您還沒有訂閱喜歡的內容，歡迎到
		<span><a href="<%=request.getContextPath()%>/game">遊戲頁面</a></span>訂閱喜歡的遊戲 !!
	</p>

	<%} else { %>
	
	<div class="card">
<div class="container">
	<div class="left">
	<h2>遊戲訂閱</h2>
	<%
    int count = 1;
    for (SubsVO subs : subsList) {
        if (subs.getSubsGameId() != null && subs.getSubsGameId() != 0) {
        	
    %>
	<table border="1">
		<tr>
			<th>訂閱編號</th>
			<th>遊戲</th>
			<th>訂閱狀態</th>
		</tr>
		
		<tr>
			<td><%= subs.getSubsId() %></td>
			<td><%= GameService.getGameByGameId(subs.getSubsGameId()).getGameName() %></td>
			<td><%= ((subs.getSubsStatus()==true) ? "已訂閱" : "已取消訂閱") %></td>
				<% if (!subs.getSubsStatus()) {%>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/subs.do" style="margin-bottom: 0px;">
					<input type="submit" class="btn btn-outline-dark" value="恢復訂閱">
					<input type="hidden" name="action" value="subsupdate">
					<input type="hidden" name="subsId" value="<%= subs.getSubsId() %>">
					<input type="hidden" name="subsId" value="<%= subs.getSubsGameId() %>">
				</FORM>
			</td>
			<% }  if (subs.getSubsStatus()){%>
				<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/subs.do" style="margin-bottom: 0px;">
					<input type="submit" class="btn btn-outline-dark" value="取消訂閱">
					<input type="hidden" name="action"  value="subsupdate">
					<input type="hidden" name="subsId" value="<%= subs.getSubsId() %>">
					<input type="hidden" name="subsId" value="<%= subs.getSubsGameId() %>">
				</FORM>
			</td>
			<% } %>
		</tr>
	
	</table>
	<%
        } else if(count <= 1){
    %>
	<p>您還沒有訂閱 喜歡的遊戲 ! 歡迎到
	<span><a href="<%=request.getContextPath()%>/game">遊戲頁面</a></span>訂閱遊戲 !!
	</p>
	<%
    		count += 1;
    		}
		}
    %>
	</div>
	
	
	<div class="right">
	<h2>文章訂閱</h2>
	<%
    int count2 = 1;
    for (SubsVO subs : subsList) {
    	
        if (subs.getSubsArtId() != null && subs.getSubsArtId() != 0) {
    %>
	<table boder="1">
		<tr>
			<th>訂閱編號</th>
			<th>文章</th>
			<th>訂閱狀態</th>
		</tr>

		<tr>
			<td><%= subs.getSubsId() %></td>
			<td><%= subs.getSubsArtId() %></td>
			<td><%= (subs.getSubsStatus() ? "已訂閱" : "已取消訂閱") %></td>
			<% if (!subs.getSubsStatus()) {%>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/subs.do" style="margin-bottom: 0px;">
					<input type="submit" class="btn btn-outline-dark" value="恢復訂閱">
					<input type="hidden" name="action"  value="subsupdate">
					<input type="hidden" name="subsId" value="<%= subs.getSubsId() %>">
					<input type="hidden" name="subsId" value="<%= subs.getSubsArtId() %>">
				</FORM>
			</td>
			<% } else {%>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/subs.do" style="margin-bottom: 0px;">
					<input type="submit" class="btn btn-outline-dark" value="取消訂閱">
					<input type="hidden" name="action"  value="subsupdate">
					<input type="hidden" name="subsId" value="<%= subs.getSubsId() %>">
					<input type="hidden" name="subsId" value="<%= subs.getSubsArtId() %>">
				</FORM>
			</td>
			<% } %>
			
		</tr>
	</table>
	<%
        } else if(count2 <= 1){ 
        	
    %>
	<p>您還沒有訂閱 喜歡的文章 ! 歡迎到
		<span><a href="<%=request.getContextPath()%>/game">文章頁面</a></span>訂閱文章 !!
	</p>
	<%
        	count2 += 1;
        	}
        }
	}
    %>

	</div>
</div>
<%-- 	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/subs.do" > --%>
   
<!--         <input type="hidden" name="action" value="mysubs"> -->
        
<!--         <input type="submit" value="送出"> -->
<!--     </FORM> -->



	<!-- 
		<% if(user != null){ %>
			<h2><%= user.getUserIdentity() %></h2>
		<% }else{ %>
			<h2>not login yet</h2>
		<% } %>
	 -->

	</div>
</body>
</html>