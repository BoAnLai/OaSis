<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Comment: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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
<link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Comment: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Comment: Home</p>

<h3>資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='listAllComment.jsp'>List</a> all Comments.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="comment.do" >
        <b>輸入評價編號 (如1):</b>
        <input type="text" name="commentId">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="CommentSvc" scope="page" class="com.jiahong.comment.model.CommentService" />
   
  <li>
     <FORM METHOD="post" ACTION="comment.do" >
       <b>選擇評價編號:</b>
       <select size="1" name="commentId">
         <c:forEach var="CommentVO" items="${CommentSvc.all}" > 
          <option value="${CommentVO.commentId}">${CommentVO.commentId}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
</ul>


<h3>員工管理</h3>

<ul>
  <li><a href='addComment.jsp'>Add</a> a new Comment.</li>
</ul>

</body>
</html>