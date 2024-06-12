<%@page import="com.mike.user.model.UserClientService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mike.user.model.UserDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@page import="java.util.List"%>
<%@page import="com.lee.waiting.model.WaitingService"%>
<%@page import="com.lee.waiting.model.WaitingVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%-- 此頁暫練習採用 Script 的寫法取值 --%>


<%Integer userID = (Integer)request.getAttribute("userID"); %>


<c:if test="${situation eq 'my'}">
<%
	WaitingService waiSvc = new WaitingService();
	List<WaitingVO> list = waiSvc.getMyRoom(userID);
	pageContext.setAttribute("list", list);
	
	List<UserDTO> userList = new ArrayList<>();
    for (WaitingVO waitingVO : list) {
        UserDTO userDTO = UserClientService.getUserById(waitingVO.getWaitingUserId());
        userList.add(userDTO);
    }
    pageContext.setAttribute("userList", userList);
%>


</c:if>

<c:if test="${situation eq 'in'}">
<%
	WaitingService waiSvc = new WaitingService();
	List<WaitingVO> list = waiSvc.getInRoom(userID);
	pageContext.setAttribute("list", list);
	
	List<UserDTO> userList = new ArrayList<>();
    for (WaitingVO waitingVO : list) {
        UserDTO userDTO = UserClientService.getUserById(waitingVO.getWaitingUserId());
        userList.add(userDTO);
    }
    pageContext.setAttribute("userList", userList);
%>

</c:if>




<html>
<head>
<title>組隊資料 - listOneEmp.jsp</title>

 <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

<style>
  .btn-close {
    background-color: red;
    border: none;
  }

  .btn-close:hover {
    background-color: darkred;
  }

  .btn-close:focus {
    outline: none;
    box-shadow: none;
  }
</style>
<link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>


<body>

<c:if test="${not empty successMsgs1}">
		<ul>
		    <c:forEach var="message" items="${successMsgs1}">	    
		    <div class="alert alert-success" role="alert">
	  		${successMsgs1}
			</div>
			</c:forEach>
		</ul>
	</c:if>


    <div class="container">
    	<div class="row align-items-center">
    		
   
    
    <table class="table project-list-table table-nowrap align-middle table-borderless">
    <tbody>
    
    
    <c:if test="${list.size() != 0}">
   
   	<c:if test="${situation eq 'my'}">
   		
    <tr>
    <th scope="col" class="ps-4"  style="width: 50px; text-align: center;">
    </th>
    <th scope="col" style="text-align: center">創建者</th>
    <th scope="col" style="text-align: center">房間編號</th>
    <th scope="col" style="text-align: center">出發時間</th>
    <th scope="col" style="text-align: center">人數上限</th>
    <th scope="col" style="text-align: center">遊戲類型</th>
    <th scope="col" style="text-align: center">修改內容</th>
    <th scope="col" style="text-align: center">查看玩家</th>
    
    </tr>
    </c:if>
    
    <c:if test="${situation eq 'in'}">	
    <tr>
    <th scope="col" class="ps-4"  style="width: 50px; text-align: center;">
    </th>
    <th scope="col" style="text-align: center">創建者</th>
    <th scope="col" style="text-align: center">房間編號</th>
    <th scope="col" style="text-align: center">出發時間</th>
    <th scope="col" style="text-align: center">人數上限</th>
    <th scope="col" style="text-align: center">遊戲類型</th>
    <th scope="col" style="text-align: center">離開房間</th>
    <th scope="col" style="text-align: center">查看玩家</th>
    
    </tr>
    </c:if>
    
	</c:if>
    <c:if test="${list.size() eq 0}">
   
   		<img src="<%=request.getContextPath() %>/waiting/img/size0_type.png" alt="Centered Image" width="500" height="500" >
	</c:if>
    
    <c:forEach var="waitingVO" items="${list}" varStatus="status">
    	<c:if test="${status.index < userList.size()}">
    		<c:set var="userDTO" value="${userList[status.index]}" />
    		
    	<tr>
    		<!-- *************************************以下為刪除房間按鈕 -->
            <th scope="row" class="ps-4">
            
            <form method="post" action="<%=request.getContextPath() %>/Waiting.do">
					<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
		  				
		  				<input type="hidden" name="waiNo"  value="${waitingVO.waitingID}">
		  				<input type="hidden" name="waiUserno"  value="${waitingVO.waitingUserId}">
		  				<input type="hidden" name="waiMax"  value="${waitingVO.waitingMaxPeople}">
		  				<input type="hidden" name="waiGame"  value="${waitingVO.waitingGameName}">
		  				<input type="hidden" name="action" value="delect_Allroom">
		  				<c:if test="${situation eq 'my'}">	
		  				<button type="submit" class="btn-close" aria-label="Close"></button>
		  				</c:if>
					</div>
				</form>	 
              
            </th>
            <!-- *************************************以上為刪除房間按鈕 -->
            <td style="text-align: left;width:80px;"><img src="${userDTO.userAvatar}" alt="" class="avatar-sm rounded-circle me-2" /><a href="#" class="text-body" style="text-decoration: none;">${userDTO.userNickname}</a></td>
            <td style="text-align: center">${waitingVO.waitingID}</td>
            <td style="text-align: center"><span class="badge badge-soft-success mb-0">${waitingVO.waitingReserve}</td>
            <td style="text-align: center">${waitingVO.waitingMaxPeople}</td>
            <td style="text-align: center">${waitingVO.waitingGameName}</td>
            
            <c:if test="${situation eq 'my'}">
   			<td  style="text-align: center ">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Waiting.do" style="margin-bottom: 0px;">
			     	<input type="submit"  class="btn btn-secondary" value="修改">
			     	<input type="hidden" name="waino"  value="${waitingVO.waitingID}">
			     	<input type="hidden" name="waimax"  value="${waitingVO.waitingMaxPeople}">
			     	<input type="hidden" name="action"	value="myRoom_Revise"></FORM>
			</td>
			
			
			<td  style="text-align: center ">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Waiting.do" style="margin-bottom: 0px;">
			     	<input type="submit"  class="btn btn-secondary" value="查看">
			     	<input type="hidden" name="waino"  value="${waitingVO.waitingID}">
			     	<input type="hidden" name="check"  value="Yes">
			     	<input type="hidden" name="action"	value="select_waitingPerson"></FORM>
			</td>
			</c:if>
			
			
			<c:if test="${situation eq 'in'}">
			
				<td  style="text-align: center ">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Waiting.do" style="margin-bottom: 0px;">
	     	
			     	<input type="hidden" name="check"  value="No">
			     	<input type="hidden" name="waino"  value="${waitingVO.waitingID}">
			     	<input type="hidden" name="action"	value="leave_waitingPerson">
			     	<input type="submit" class="btn btn-secondary"  value="離開"></FORM>
				</td>
			
				<td  style="text-align: center ">
			  		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/Waiting.do" style="margin-bottom: 0px;">
	     	
			     	<input type="hidden" name="check"  value="No">
			     	<input type="hidden" name="waino"  value="${waitingVO.waitingID}">
			     	<input type="hidden" name="action"	value="select_waitingPerson">
			     	<input type="submit" class="btn btn-secondary"  value="查看"></FORM>
				</td>
				</c:if>
    		</c:if>
                
        </tr>
   </c:forEach>
   
   
    
     
    
    </tbody>
    </table>
    
    </div>
    </div>
   
     
    <div class="float-sm-end">
    <ul class="pagination mb-sm-0"> </ul>
    </div>
   

</body>
</html>