<%@page import="com.mike.game.model.GameService"%>
<%@page import="com.mike.game.model.GameVO"%>
<%@page import="com.lee.waiting.model.WaitingVO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
//見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
WaitingVO watVO = (WaitingVO) request.getAttribute("watVO");
%>

<%
    List<GameVO> gameList = null;
    try {
        gameList = GameService.listAll();
    } catch (Exception e) {
        e.printStackTrace(); //
    }
    request.setAttribute("gameList", gameList);
%>


<html>


<head>


<title>OASIS Room</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<title>Bootstrap Example</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">	


<style>
body {
	margin-top: 20px;
	background-color: #eee;
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

<body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
	
<%@ include file="/home/navbar.jsp" %>
	

	<%-- 錯誤表列 --%>

	<c:if test="${not empty errorMsgs}">
		<ul>
			<c:forEach var="message" items="${errorMsgs}">

				<div class="alert alert-danger" role="alert">${message}</div>
			</c:forEach>
		</ul>
	</c:if>
	<c:if test="${not empty successMsgs}">
		<ul>
			<c:forEach var="message" items="${successMsgs}">
				<div class="alert alert-success" role="alert">${successMsgs}</div>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post"
		action="<%=request.getContextPath()%>/Waiting.do">

		<div class="input-group mb-3">
			<input type="text" name="waino" class="form-control"
				placeholder="查詢組隊編號:" aria-label="Recipient's username"
				aria-describedby="button-addon2"> <input type="hidden"
				name="action" value="getOne_For_Display"> <input
				type="submit" class="btn btn-secondary" type="button"
				id="button-addon2" value="送出">
		</div>
	</form>

	<div class="container text-center">
		<div class="row row-cols-auto">
			<div>

				<form method="post"
					action="<%=request.getContextPath()%>/Waiting.do">
					<div class="btn-group" role="group"
						aria-label="Basic radio toggle button group">
						<input type="button" name="sin" class="btn-check"
							autocomplete="off"> <input type="hidden" name="action"
							value="select_AllWait"> <input type="submit"
							class="btn btn-danger" id="button-addon2" value="所有列隊">
					</div>
				</form>

			</div>
			<div>


				<!-- Button trigger modal -->
				<button type="button" class="btn btn-warning" data-bs-toggle="modal"
					data-bs-target="#staticGroup">建立隊伍</button>


			</div>
			<div>

				<form method="post"
					action="<%=request.getContextPath()%>/Waiting.do">
					<div class="btn-group" role="group"
						aria-label="Basic radio toggle button group">
						<input type="button" name="sin" class="btn-check"
							autocomplete="off"> <input type="hidden" name="action"
							value="select_MyRoom"> <input type="submit"
							class="btn btn-success" id="button-addon2" value="我的隊伍">
					</div>
				</form>

			</div>
			<div>

				<form method="post"
					action="<%=request.getContextPath()%>/Waiting.do">
					<div class="btn-group" role="group"
						aria-label="Basic radio toggle button group">
						<input type="button" name="sin" class="btn-check"
							autocomplete="off"> <input type="hidden" name="action"
							value="select_InRoom"> <input type="submit"
							class="btn btn-primary" id="button-addon2" value="已加入的隊伍">
					</div>
				</form>

			</div>
			<div>

				<button class="btn btn-dark" type="button"
					data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
					aria-controls="offcanvasScrolling">聊天大廳</button>

			</div>
		</div>
	</div>

	<c:if test="${sin eq 'A' || sin eq null}">
		<jsp:include page="/waiting/waitingAll.jsp"></jsp:include>
	</c:if>


	<c:if test="${sin eq 'C'}">
		<jsp:include page="/waiting/myRoom.jsp"></jsp:include>
	</c:if>

	<c:if test="${sin eq 'D'}">
		<jsp:include page="/waiting/waiting_selectOne.jsp"></jsp:include>
	</c:if>





	<!-- INSERT Modal -->
	<div class="modal fade" id="staticGroup" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticGroupLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<!-- Modal的大小改變在這邊 -->
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="staticGroupLabel">
						<a href="#"
							class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2"
							style="--bs-focus-ring-x: 10px; --bs-focus-ring-y: 10px; --bs-focus-ring-blur: 4px">
							being generated </a>
					</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<!-- ===================表單內容===================== -->
				<table
					class="table project-list-table table-nowrap align-middle table-borderless">
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Waiting.do" name="form1">


						<div class="container text-center">
							
							<input class="form-control" type="text" placeholder="隊伍創建人:${user.userNickname}" aria-label="Disabled input example" disabled>

							<div class="row">
								<div class="col-6" style="padding: 0px">
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">
											<div class="input-group flex-nowrap">
												<span class="input-group-text" id="inputGroup-sizing-lg">RESERVE</span>
												<input type="text" id="f_date1" class="form-control"
													name="reserve" placeholder="預約出發時間" aria-label="Username"
													aria-describedby="addon-wrapping" required="required">
											</div>
									</font></font>
								</div>
							</div>

							<div class="row">
								<div class="col-6" style="padding: 0px">
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">
											<div class="input-group flex-nowrap">
												<span class="input-group-text" id="inputGroup-sizing-lg">MAXPEOP</span>
												<input type="text" class="form-control" name="max"
													placeholder="列隊上限" aria-label="Username"
													aria-describedby="addon-wrapping">
											</div>
									</font></font>
								</div>
							</div>

							<div class="row">
								<div class="col-6" style="padding: 0px">
								<font style="vertical-align: inherit;">
							        <div class="input-group flex-nowrap">
									  <label class="input-group-text" for="inputGroupSelect01">遊戲類型:</label>
									  <select class="form-select" id="inputGroupSelect01" name="game">
									    <c:forEach var="GameVO" items="${gameList}">
							                <option value="${GameVO.gameName}" ${GameVO.gameName == param.game ? 'selected' : ''}>${GameVO.gameName}</option>
							            </c:forEach>
							          
							        </select></div></font>
									</div>
							</div>
							
						</div>


						<jsp:useBean id="deptSvc" scope="page"
							class="com.lee.waiting.controller.WaitingServlet" />


						<br> <input type="hidden" name="action" value="insert">
						<input type="submit" class="btn btn-info" value="送出新增">
					</FORM>

				</table>

<%
Timestamp reserve = null;
try {
reserve = watVO.getWaitingReserve();
} catch (Exception e) {
reserve = new Timestamp(System.currentTimeMillis());
}
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/waiting/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/waiting/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/waiting/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:true,       //timepicker:true,
	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
	       format:'Y-m-d H:i',         //format:'Y-m-d H:i:s',
		   value: '<%=reserve%>', // value:   new Date(),
					//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
					//startDate:	            '2017/07/10',  // 起始日
					//minDate:               '-1970-01-01', // 去除今日(不含)之前
					//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
					});
</script>

				<!-- ===================表單內容===================== -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">離開</button>

				</div>
			</div>
		</div>
	</div>

	<!-- ================帆布部分======================= -->
	<div class="offcanvas offcanvas-start" data-bs-scroll="true"
		data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling"
		aria-labelledby="offcanvasScrollingLabel" style="width: 700px;">
		<div class="offcanvas-header">
			<h3 class="offcanvas-title" id="offcanvasScrollingLabel">OASIS CHATTER</h5>
			<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
				aria-label="Close"></button>
		</div>
		<jsp:include page="/chatter/index.jsp"></jsp:include>
		
	</div>



</body>
</html>