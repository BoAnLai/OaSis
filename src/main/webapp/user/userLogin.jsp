<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OaSis - Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>

<body>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<%@ include file="../home/navbar.jsp" %>

	<div id="login-form-container"
		class="container w-100 h-50 d-flex justify-content-center">
		<form class="border border-primary border-2 rounded p-4"
			action="/oasis/logging" method="post">
			<div class="mb-3">
				<label for="email" class="form-label fs-5 fw-bold">信箱</label> <input
					type="email" class="form-control" id="email" name="email"
					aria-describedby="emailHelp" required>
			</div>
			<div class="mb-3">
				<label for="password" class="form-label fs-5 fw-bold">密碼</label> <input
					type="password" id="password" name="password" class="form-control"
					id="" required>
			</div>
			<div class="d-flex justify-content-between">
				<button type="submit" class="btn btn-primary">登入</button>
				<a type="button" href="<%=request.getContextPath()%>" class="btn btn-secondary">回到首頁</a>
			</div>
			<div class="text-end mt-3 ml-auto">
				<a href="<%= request.getContextPath() %>/user/register">註冊</a>
			</div>
		</form>
	</div>

</body>

</html>