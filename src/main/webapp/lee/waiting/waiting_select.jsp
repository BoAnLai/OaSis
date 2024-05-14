<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>

	
<head>


<title>IBM Emp: Home</title>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>

  body{margin-top:20px;
    background-color:#eee;
    }


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

</head>
<body bgcolor='white'>

<form method="post" action="<%=request.getContextPath()%>/WaitingServlet">

<div class="input-group mb-3">
  <input type="text" name="waino" class="form-control" placeholder="查詢組隊編號:" aria-label="Recipient's username" aria-describedby="button-addon2">
  <input type="hidden" name="action" value="getOne_For_Display">
  <input type="submit" class="btn btn-secondary" type="button" id="button-addon2" value="送出">
</div>
</form>

<%-- 錯誤表列 --%>

	<c:if test="${not empty errorMsgs}">
		<ul>
		    <c:forEach var="message" items="${errorMsgs}">
		    
		    <div class="alert alert-dark" role="alert">
	  		${message}
			</div>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
	  <input type="button" name="sin" class="btn-check"  autocomplete="off">
	  <input type="hidden" name="action" value="select_AllWait">
	  <input type="submit" class="btn btn-secondary" type="button" id="button-addon2" value="列隊查詢">
	</div>
	</form>
	
	<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
	<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
	  <input type="button" name="sin" class="btn-check"  autocomplete="off">
	  <input type="hidden" name="action" value="select_AddWait">
	  <input type="submit" class="btn btn-secondary" type="button" id="button-addon2" value="建立隊伍">
	</div>
	</form>


	<c:if test="${sin eq true || sin eq null}">
	<jsp:include page="/lee/waiting/waitingAll.jsp" ></jsp:include> 	
	</c:if>
	
	<c:if test="${sin eq false}">
	<jsp:include page="/lee/waiting/waitAdd.jsp" ></jsp:include> 	
	</c:if>
	
	
	


</body>
</html>