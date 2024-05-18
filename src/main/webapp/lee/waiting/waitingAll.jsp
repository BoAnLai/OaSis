<%@page import="com.lee.waiting.model.WaitingVO"%>
<%@page import="com.lee.waiting.model.WaitingService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

		<%
		WaitingService waiSvc = new WaitingService();
	    List<WaitingVO> list = waiSvc.getAll();
	    pageContext.setAttribute("list",list);
		%>
	
		<%-- 此頁練習採用 EL 的寫法取值 --%>
		

		
<html>
<head>
<meta charset="UTF-8">
<title>Wait list table - com.Wait</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    
    <!-- 燈箱功能 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    
    <style type="text/css">
    body{margin-top:20px;
    background-color:#eee;
    }

    .project-list-table {
        border-collapse: separate;
        border-spacing: 0 12px
    }
    
    .project-list-table tr {
        background-color: #fff
    }
    
    .table-nowrap td, .table-nowrap th {
        white-space: nowrap;
    }
    .table-borderless>:not(caption)>*>* {
        border-bottom-width: 0;
    }
    .table>:not(caption)>*>* {
        padding: 0.75rem 0.75rem;
        background-color: var(--bs-table-bg);
        border-bottom-width: 1px;
        box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
    }
    
    .avatar-sm {
        height: 2rem;
        width: 2rem;
    }
    .rounded-circle {
        border-radius: 50%!important;
    }
    .me-2 {
        margin-right: 0.5rem!important;
    }
    img, svg {
        vertical-align: middle;
    }
    
    a {
        color: #3b76e1;
        text-decoration: none;
    }
    
    .badge-soft-danger {
        color: #f56e6e !important;
        background-color: rgba(245,110,110,.1);
    }
    .badge-soft-success {
        color: #63ad6f !important;
        background-color: rgba(99,173,111,.1);
    }
    
    .badge-soft-primary {
        color: #3b76e1 !important;
        background-color: rgba(59,118,225,.1);
    }
    
    .badge-soft-info {
        color: #57c9eb !important;
        background-color: rgba(87,201,235,.1);
    }
    
    .avatar-title {
        align-items: center;
        background-color: #3b76e1;
        color: #fff;
        display: flex;
        font-weight: 500;
        height: 100%;
        justify-content: center;
        width: 100%;
    }
    .bg-soft-primary {
        background-color: rgba(59,118,225,.25)!important;
    }
    
    
</style>
</head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous">
	




<body>


    <div class="container">
    	<div class="row align-items-center">
    		
	    			<div class="dropdown">
	    				<ul class="dropdown-menu dropdown-menu-end">
	    					<li><a class="dropdown-item" href="#">Action</a></li>
						    <li><a class="dropdown-item" href="#">Another action</a></li>
						    <li><a class="dropdown-item" href="#">Something else here</a></li>
	    				</ul>
    				</div>
    			
    		
    
    
    
    <table class="table project-list-table table-nowrap align-middle table-borderless">
    <tbody>
    
    
    
    <tr>
    <th scope="col" class="ps-4"  style="width: 50px; text-align: center;">
    </th>
    <th scope="col" style="text-align: center">創建者</th>
    <th scope="col" style="text-align: center">房間編號</th>
    <th scope="col" style="text-align: center">出發時間</th>
    <th scope="col" style="text-align: center">人數上限</th>
    <th scope="col" style="text-align: center">遊戲類型</th>
    <th scope="col" style="text-align: center">加入</th>
    <th scope="col" style="text-align: center">查看</th>
    </tr>
    
    
    <%@ include file="page1.file" %> 
	<c:forEach var="WaitingVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
    	<tr>
            <th scope="row" class="ps-4">
                <div class="form-check font-size-16"><input type="checkbox" class="form-check-input" id="contacusercheck7" /><label class="form-check-label" for="contacusercheck7"></label></div>
            </th>
            <td style="text-align: center"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-sm rounded-circle me-2" /><a href="#" class="text-body">${WaitingVO.waitingUserId}</a></td>
            <td style="text-align: center">${WaitingVO.waitingID}</td>
            <td style="text-align: center"><span class="badge badge-soft-success mb-0">${WaitingVO.waitingReserve}</td>
            <td style="text-align: center">${WaitingVO.waitingMaxPeople}</td>
            <td style="text-align: center">${WaitingVO.waitingGameName}</td>
            
                
                <td  style="text-align: center ">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/WaitingServlet" style="margin-bottom: 0px;">
			     	<input type="submit"  class="btn btn-secondary" value="加入">
			     	<input type="hidden" name="waino"  value="${WaitingVO.waitingID}">
			     	<input type="hidden" name="waimax"  value="${WaitingVO.waitingMaxPeople}">
			     	<input type="hidden" name="action"	value="add_Person"></FORM>
				</td>
				
				
				<td  style="text-align: center ">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/WaitingServlet" style="margin-bottom: 0px;">
			     	
			     	
			     	<input type="submit" class="btn btn-secondary" data-toggle="modal" data-target="#exampleModal" value="查看">
  

			     	<input type="hidden" name="check"  value="No">
			     	<input type="hidden" name="waino"  value="${WaitingVO.waitingID}">
			     	<input type="hidden" name="action"	value="select_waitingPerson"></FORM>
				</td>
				
          
    
                </ul>
            </td>
        </tr>
    </c:forEach>
    
    
    </tbody>
    </table>
    
    
    
    </div>
    </div>
    
    <%@ include file="page2.file" %>
   
   
     
    <div class="float-sm-end">
    <ul class="pagination mb-sm-0"> </ul>'
    </div>
    
    
    
    <!-- 模态框结构 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg"> <!-- 使用 modal-lg 类来增加模态框大小 -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">模态框标题</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 这里嵌入一个 iframe 来显示网页内容 -->
        <iframe src="https://www.youtube.com/" style="width: 100%; height: 400px; border: none;"></iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>

<!-- 引入jQuery和Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    

	
	<script>
	    function waitingPerson(){
	    	
	        // 打開新的小視窗，這裡替換成你想要打開的頁面的 URL
	        var newWindow = window.open('<%=request.getContextPath() %>/lee/waitingPerson/WaitingPersonAll.jsp');
	        
	        // 設置新視窗的大小和屬性
	        if (newWindow) {
	            newWindow.resizeTo(600, 400);
	            newWindow.focus();
	        } else {
	            alert('無法打開新視窗，請檢查瀏覽器設置。');
	        }
	    }
	    
	</script>
    
    
    
    </body>
    </html>