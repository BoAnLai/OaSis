<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mike.user.model.*"%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="css/avatar.css">
    <style>
    	#content{
    		margin: 30px 150px;
    	}
    </style>
</head>

<body>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<%@ include file="../home/navbar.jsp" %>

	<%
		UserVO userDisplayed = (UserVO) session.getAttribute("userDisplayed");
	%>
	<div id="content">
	    <h1 class="mx-5 my-2 fw-bold">修改使用者資料 - <span><%=userDisplayed.getUserEmail()%></span></h1>
	    	<div class="mx-5">
	    	
		        <form action="updating" method="POST" enctype="multipart/form-data" class="border border-primary border-2 rounded p-4">
		        	<div class="mb-3" hidden>
		      			<input name="id" type="number" class="form-control" value="<%=userDisplayed.getUserId()%>">
		        	</div>
		        	<div class="mb-4">
                  		<label for="email" class="form-label fs-4 fw-bold">信箱</label>
	                  	<input name="email" id="email" class="form-control" type="text" placeholder="必填" required disabled value="<%=userDisplayed.getUserEmail()%>" readonly>
		        	</div>
		        	<div class="mb-4">
	                  	<label for="password" class="form-label fs-4 fw-bold">密碼</label>
	                  	<input name="password" id="password" class="form-control" type="password" placeholder="必填" value="<%=userDisplayed.getUserPassword()%>">
		                <label for="confirm_password" class="form-label fs-5 mt-1">確認新密碼</label>
		                <input name="confirm_password" id="password" class="form-control" type="password" placeholder="必填" value="<%=userDisplayed.getUserPassword()%>">
		        	</div>
		        	<div class="mb-4">
	                  <label for="nickname" class="form-label fs-4 fw-bold">暱稱</label>
	                  <input name="nickname" id="nickname" class="form-control" type="text" value="<%=userDisplayed.getUserNickname()%>">
		        	</div>
		        	<div class="mb-4">
	                  <label for="intro" class="form-label fs-4 fw-bold">自我介紹</label>
	                  <textarea name="intro" id="intro" class="form-control" cols="30" rows="10"><%=userDisplayed.getUserIntro()%></textarea>
		        	</div>
		        	<div class="mb-4">
	                  <label for="avatar" class="form-label fs-4 fw-bold">圖片(大頭照)</label>
	                  <input name="avatar" id="avatar" class="form-control" type="file">
	                  <div class="imgPreviewDiv" >
	                      <img class="imgPreviewPlaceholder" src="<%=userDisplayed.getUserAvatar()%>" alt="">
	                      <img class="imgUpload" src="" alt="" hidden>
	                  </div>
		        	</div>
		        	<div class="mb-4">
	                  <label for="realName" class="form-label fs-4 fw-bold">真實姓名</label>
	                  <input name="realName" id="realName" class="form-control" value="<%=userDisplayed.getUserRealName()%>"></input>
		        	</div>
		        	<div class="mb-4">
	                  <label for="cellphone" class="form-label fs-4 fw-bold">手機號碼</label>
	                  <input name="cellphone" id="cellphone" class="form-control" value="<%=userDisplayed.getUserCellphone()%>"></input>
		        	</div>
		        	<div class="mb-4">
	                  <label for="address" class="form-label fs-4 fw-bold">地址</label>
	                  <textarea name="address" id="address" class="form-control" cols="30" rows="5"><%=userDisplayed.getUserAddress()%></textarea>
		        	</div>
		            <input type="submit" value="修改">
		        </form>
		        
	    	</div>
		    
	</div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="js/userAvatar.js"></script>
</body>

</html>