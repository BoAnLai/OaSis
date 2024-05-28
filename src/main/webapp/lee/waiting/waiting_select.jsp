<%@page import="com.lee.waiting.model.WaitingVO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<% //見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
	WaitingVO watVO = (WaitingVO) request.getAttribute("watVO");
%>


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

<form method="post" action="<%=request.getContextPath()%>/WaitingServlet">

<div class="input-group mb-3">
  <input type="text" name="waino" class="form-control" placeholder="查詢組隊編號:" aria-label="Recipient's username" aria-describedby="button-addon2">
  <input type="hidden" name="action" value="getOne_For_Display">
  <input type="submit" class="btn btn-secondary" type="button" id="button-addon2" value="送出">
</div>
</form>
	
	<div class="container text-center">
	    <div class="row row-cols-auto">
	    	<div>
	    	
		    	<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="button" name="sin" class="btn-check"  autocomplete="off">
		  				<input type="hidden" name="action" value="select_AllWait">
		  				<input type="submit" class="btn btn-danger" id="button-addon2" value="所有列隊">
					</div>
				</form>
	    	
	    	</div>
	    	<div>
	    	
	    	
	    		<!-- Button trigger modal -->
				<button type="button" class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
				  建立隊伍
				</button>
				
	    	
	    	</div>
	    	<div>
	    	
	    		<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="button" name="sin" class="btn-check"  autocomplete="off">
		  				<input type="hidden" name="action" value="select_MyRoom">
		  				<input type="submit" class="btn btn-success" id="button-addon2" value="我的隊伍">
					</div>
				</form>
	    	
	    	</div>
	    	<div>
	    	
	    		<form method="post" action="<%=request.getContextPath() %>/WaitingServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="button" name="sin" class="btn-check"  autocomplete="off">
		  				<input type="hidden" name="action" value="select_InRoom">
		  				<input type="submit" class="btn btn-primary" id="button-addon2" value="已加入的隊伍">
					</div>
				</form>
	    	
	    	</div>    	
	    	<div>
	    	
	    		<button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#chatter">
				  聊天大廳
				</button>
	    	
	    	</div>
	    </div>
	</div>
	


	<c:if test="${sin eq 'A' || sin eq null}">
	<jsp:include page="/lee/waiting/waitingAll.jsp" ></jsp:include> 	
	</c:if>
	
	
	<c:if test="${sin eq 'C'}">
	<jsp:include page="/lee/waiting/myRoom.jsp" ></jsp:include> 	
	</c:if>
	
	<c:if test="${sin eq 'D'}">
	<jsp:include page="/lee/waiting/waiting_selectOne.jsp" ></jsp:include> 	
	</c:if>
	
	
	


<!-- INSERT Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg"><!-- Modal的大小改變在這邊 -->
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">
        <a href="#" class="d-inline-flex focus-ring py-1 px-2 text-decoration-none border rounded-2" style="--bs-focus-ring-x: 10px; --bs-focus-ring-y: 10px; --bs-focus-ring-blur: 4px">
		  being generated
		</a>
		</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <!-- ===================表單內容===================== -->
      <table class="table project-list-table table-nowrap align-middle table-borderless">
	<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/WaitingServlet" name="form1">
	
	
	 <div class="container text-center">
	      <div class="row">
	        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	        <div class="input-group flex-nowrap">
	  		<span class="input-group-text" id="inputGroup-sizing-lg">NUMBER</span>
	  		<input type="text" class="form-control" name="userid" placeholder="您的編號ID" aria-label="Username" aria-describedby="addon-wrapping">
			</div>     
	        </font></font></div>
	      </div>
	      
	      <div class="row">
	        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	        <div class="input-group flex-nowrap">
	  		<span class="input-group-text" id="inputGroup-sizing-lg">RESERVE</span>
	  		<input type="text" id="f_date1" class="form-control" name="reserve" placeholder="預約出發時間" aria-label="Username" aria-describedby="addon-wrapping" required="required">
			</div>
	        </font></font></div>
	      </div>
	      
	      <div class="row">
	        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	        <div class="input-group flex-nowrap">
	  		<span class="input-group-text" id="inputGroup-sizing-lg">MAXPEOP</span>
	  		<input type="text" class="form-control" name="max" placeholder="列隊上限" aria-label="Username" aria-describedby="addon-wrapping" >
			</div>
	        </font></font></div>
	      </div>
	      
	      <div class="row">
	        <div class="col-6" style="padding: 0px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	        <div class="input-group flex-nowrap">
	  		<span class="input-group-text" id="inputGroup-sizing-lg">GAME</span>
	  		<input type="text" class="form-control" name="game" placeholder="遊戲類型" aria-label="Username" aria-describedby="addon-wrapping">
			</div>
	        </font></font></div>
	      </div>
	    </div>
	
	
		<jsp:useBean id="deptSvc" scope="page" class="com.lee.waiting.controller.WaitingServlet" />
			
	
	<br>
	<input type="hidden" name="action" value="insert">
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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
	
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
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">離開</button>
        
      </div>
    </div>
  </div>
</div>







<!--  LOBBYCHATTER Modal -->
<div class="modal fade" id="chatter" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="chatterLabel" aria-hidden="true">
  
		<style>
        /* 自定義模態框背景顏色和字體顏色 */
        .modal-content {
            background-color: #2c2c2c; /* 黑灰色背景 */
            color: #ffffff; /* 白色字體 */
        }
        .modal-header, .modal-footer {
            border-color: #444444; /* 黑灰色邊框 */
        }
        .btn-secondary, .btn-primary {
            color: #ffffff; /* 白色字體 */
        }
    	</style>

  
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="chatterLabel">聊天公約</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-dialog modal-dialog-scrollable">
       <body class="p-3 m-0 border-0 bd-example m-0 border-0">
    <!-- Example Code -->

    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >歡迎來到我們的聊天室！為了營造一個友好、安全和愉快的交流環境，請遵守以下規章：</font
        ></font
      >
    </p>

    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit">1.尊重他人：</font></font
      >
    </p>

    <p class="fw-normal">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >在聊天中保持禮貌和尊重，不使用冒犯或侮辱性的語言。<br />
          不進行人身攻擊、歧視或騷擾行為。</font
        ></font
      >
    </p>

    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit">2.合法行為：</font></font
      >
    </p>

    <p class="fw-normal">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >不分享非法內容，包括但不限於盜版軟件、成人內容或其他違法信息。<br />
          遵守當地法律和聊天室所在平台的使用條款。</font
        ></font
      >
    </p>

    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit">3.隱私保護：</font></font
      >
    </p>

    <p class="fw-normal">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >不分享他人的私人信息，如電話號碼、地址或個人身份信息。<br />保護自己的隱私，不輕易向他人透露個人敏感信息。</font
        ></font
      >
    </p>
    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit">4.避免垃圾信息：</font></font
      >
    </p>

    <p class="fw-normal">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >不進行垃圾郵件、廣告或過度重複信息的行為。<br />不惡意刷屏或故意干擾他人正常交流。</font
        ></font
      >
    </p>

    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit">5.有建設性：</font></font
      >
    </p>

    <p class="fw-normal">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >鼓勵有意義和建設性的討論，避免無意義的爭吵或引戰行為。<br />尊重管理員和版主的決定，若有異議，可以通過適當渠道提出。</font
        ></font
      >
    </p>

    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit">6.語言使用：</font></font
      >
    </p>

    <p class="fw-normal">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >儘量使用聊天室主要使用的語言，以便所有人都能理解和參與討論。<br />避免使用粗俗或不雅的詞語。</font
        ></font
      >
    </p>

    <p class="fw-bolder">
      <font style="vertical-align: inherit"
        ><font style="vertical-align: inherit"
          >違反上述規章的用戶可能會被警告、禁言或移出聊天室。我們希望每個人都能享受這個愉快的交流平台，謝謝你的合作！</font
        ></font
      >
    </p>

    <!-- End Example Code -->
  </body>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">算了</button>
        
        <form method="post" action="<%=request.getContextPath() %>/ChatterServlet">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				<input type="hidden" name="action" value="chatter">
		  				<input type="submit" class="btn btn-primary" id="button-addon2" value="確定進入">
					</div>
		</form>
        
      </div>
    </div>
  </div>
</div>
	


</body>
</html>