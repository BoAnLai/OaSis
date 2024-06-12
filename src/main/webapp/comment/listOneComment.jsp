<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.jiahong.comment.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
CommentVO commentVO = (CommentVO) request.getAttribute("commentVO"); //CommentServlet.java(Concroller), 存入req的commentVO物件
%>

<html>
<head>
<title>評價資料 - listOneComment.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
<link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>
<body bgcolor='white'>

	<h4>此頁暫練習採用 Script 的寫法取值:</h4>
	<table id="table-1">
		<tr>
			<td>
				<h3>員工資料 - listOneComment.jsp</h3>
				<h4>
					<a href="select_page.jsp"><img src="images/back1.gif"
						width="100" height="32" border="0">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>評價編號</th>
			<th>產品編號</th>
			<th>評價</th>
			<th>評價圖片</th>
			<th>評價時間戳</th>
			<th>評價星等</th>
		</tr>
		<tr>
			<td><%=commentVO.getCommentId()%></td>
			<td><%=commentVO.getCommentProductId()%></td>
			<td><%=commentVO.getCommentText()%></td>
			<td><%=commentVO.getCommentImg()%></td>
			<td><%=commentVO.getCommentTimestamp()%></td>
			<td><%=commentVO.getCommentRateStars()%></td>
		</tr>
	</table>

</body>
</html>