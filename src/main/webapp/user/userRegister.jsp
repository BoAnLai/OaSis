<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<div id="content">
	    <h1 class="mx-5 my-2 fw-bold">新使用者註冊</h1>
	    <div class="mx-5">
	        <form action="registering" method="POST" enctype="multipart/form-data" class="border border-primary border-2 rounded p-4">
	        	<div class="mb-4">
			        <label for="email" class="form-label fs-4 fw-bold">輸入信箱</label>
			        <input name="email" id="email" class="form-control" type="text" placeholder="必填" required>
	        	</div>
	        	<div class="mb-4">
			        <label for="password" class="form-label fs-4 fw-bold">輸入密碼</label>
			        <input name="password" id="password" class="form-control" type="password" placeholder="必填" required>
	        	</div>
	        	<div class="mb-4">
			        <label for="confirm_password" class="form-label fs-4 fw-bold">再次輸入密碼</label>
			        <input name="confirm_password" id="confirm_password" class="form-control" type="password" placeholder="必填" required>
	        	</div>
	        	<div class="mb-4">
			        <label for="nickname" class="form-label fs-4 fw-bold">輸入暱稱</label>
			        <input name="nickname" id="nickname" class="form-control" type="text">
	        	</div>
	        	<div class="mb-4">
			        <label for="intro" class="form-label fs-4 fw-bold">自我介紹</label>
			        <textarea name="intro" id="intro" class="form-control" cols="30" rows="10"></textarea>
	        	</div>
	        	<div class="mb-4">
			        <label for="avatar" class="form-label fs-4 fw-bold">上傳圖片(大頭照)</label>
			        <input name="avatar" id="avatar" class="form-control" type="file">
			        <div class="imgPreviewDiv">
			            <img class="imgPreviewPlaceholder" src="https://via.placeholder.com/300x200" alt="">
			            <img class="imgUpload" src="" alt="" hidden>
			        </div>
	        	</div>
	        	<hr class="border border-primary border-3 opacity-75">
	        	<h3></h3>
	        	<div class="mb-4">
	            	<label for="realName" class="form-label fs-4 fw-bold">真實姓名</label>
	                <input name="realName" id="realName" class="form-control" value="" placeholder="購物核對身份"></input>
	        	</div>
	        	<div class="mb-4">
	                <label for="cellphone" class="form-label fs-4 fw-bold">手機號碼</label>
	                <input name="cellphone" id="cellphone" class="form-control" value="" placeholder="購物核對身份"></input>
	        	</div>
	        	<div class="mb-4">
	                <label for="address" class="form-label fs-4 fw-bold">地址</label>
	            	<textarea name="address" id="address" class="form-control" cols="30" rows="5" placeholder="購物商品寄送地址"></textarea>
	        	</div>
	            <input type="submit" value="註冊 to user/registering">
	            <input type="reset" value="清除資料">
	        </form>
	    </div>
	</div>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="js/userAvatar.js"></script>
    <script>
	    <c:forEach var="errorMsg" items="${requestScope.errorMsgs}">
	    	alert("${errorMsg}");
	  	</c:forEach>
    </script>
</body>

</html>