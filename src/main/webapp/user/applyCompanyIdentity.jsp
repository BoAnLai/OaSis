<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OaSis - Apply Company Identity</title>
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
	<div class="d-flex justify-content-center align-items-center">
		<h1 class="mx-5 my-2 fw-bold">申請廠商身分</h1>
	</div>
	<div id="login-form-container"
		class="container w-100 h-50 d-flex justify-content-center">
		<form class="border border-primary border-2 rounded p-4"
			action="/oasis/logging" method="post">
			<div class="mb-3">
				<label for="companyName" class="form-label fs-5 fw-bold">公司名稱</label>
				<input type="text" class="form-control" id="companyName" name="companyName"
					aria-describedby="emailHelp" required>
			</div>
			<div class="d-flex justify-content-between">
				<button type="submit" class="btn btn-primary">申請</button>
				<a type="button" href="<%=request.getContextPath()%>" class="btn btn-secondary">回到首頁</a>
			</div>
		</form>
	</div>

</body>

</html>