<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.jiahong.comment.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    CommentService commentSvc = new CommentService();
    List<CommentVO> list = commentSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有評價資料 - listAllComment.jsp</title>

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
	width: 800px;
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

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有評價資料 - listAllComment.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>評價編號</th>
		<th>產品編號</th>
		<th>評價</th>
		<th>評價圖片</th>
		<th>評價時間戳</th>
		<th>評價星等</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="commentVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${commentVO.commentId}</td>
			<td>${commentVO.commentProductId}</td>
			<td>${commentVO.commentText}</td>
			<td>${commentVO.commentImg}</td>
			<td>${commentVO.commentTimestamp}</td>
			<td>${commentVO.commentRateStars}</td> 
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/comment/comment.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="commentId"  value="${commentVO.commentId}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/comment/comment.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="commentId"  value="${commentVO.commentId}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>