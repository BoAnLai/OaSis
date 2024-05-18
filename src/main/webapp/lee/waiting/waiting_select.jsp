<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>

	
<head>


<title>OASIS Room</title>

	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

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
<body class="p-3 m-0 border-0 bd-example m-0 border-0 bd-example-row">

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
		    
		    <div class="alert alert-danger" role="alert">
	  		${message}
			</div>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${not empty successMsgs}">
		<ul>
		    <c:forEach var="message" items="${successMsgs}">	    
		    <div class="alert alert-success" role="alert">
	  		${successMsgs}
			</div>
			</c:forEach>
		</ul>
	</c:if>

	
	<div class="container text-center">
	    <div class="row row-cols-auto">
	    	<div>
	    	
		    	<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="button" name="sin" class="btn-check"  autocomplete="off">
		  				<input type="hidden" name="action" value="select_AllWait">
		  				<input type="submit" class="btn btn-danger" type="button" id="button-addon2" value="列隊查詢">
					</div>
				</form>
	    	
	    	</div>
	    	<div>
	    	
		    	<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="button" name="sin" class="btn-check"  autocomplete="off">
		  				<input type="hidden" name="action" value="select_AddWait">
		  				<input type="submit" class="btn btn-warning" type="button" id="button-addon2" value="建立隊伍">
					</div>
				</form>
	    	
	    	</div>
	    	<div>
	    	
	    		<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="button" name="sin" class="btn-check"  autocomplete="off">
		  				<input type="hidden" name="action" value="select_MyRoom">
		  				<input type="submit" class="btn btn-success" type="button" id="button-addon2" value="我的房間">
					</div>
				</form>
	    	
	    	</div>
	    	<div>
	    	
	    		<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="button" name="sin" class="btn-check"  autocomplete="off">
		  				<input type="hidden" name="action" value="select_AllWait">
		  				<input type="submit" class="btn btn-primary" type="button" id="button-addon2" value="我的列隊">
					</div>
				</form>
	    	
	    	</div>
	    </div>
	</div>
	
	
	
	
	
	


	<c:if test="${sin eq 'A' || sin eq null}">
	<jsp:include page="/lee/waiting/waitingAll.jsp" ></jsp:include> 	
	</c:if>
	
	<c:if test="${sin eq 'B'}">
	<jsp:include page="/lee/waiting/waitAdd.jsp" ></jsp:include> 	
	</c:if>
	
	<c:if test="${sin eq 'C'}">
	<jsp:include page="/lee/waiting/myRoom.jsp" ></jsp:include> 	
	</c:if>
	
	
	
	


</body>
</html>