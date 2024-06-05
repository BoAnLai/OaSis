<%@page import="java.util.ArrayList"%>
<%@page import="com.mike.user.model.UserClientService"%>
<%@page import="com.mike.user.model.UserDTO"%>
<%@page import="com.lee.waitingperson.model.WaitingPersonVO"%>
<%@page import="java.util.List"%>
<%@page import="com.lee.waitingperson.model.WaitingPersonService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%Integer roomnum=(Integer)request.getAttribute("waiVO");%>


<%
WaitingPersonService wapSvc = new WaitingPersonService();
List<WaitingPersonVO> list = wapSvc.getAll(roomnum);
pageContext.setAttribute("list", list);

List<UserDTO> userList = new ArrayList<>();
for (WaitingPersonVO waitingpersonVO : list) {
    UserDTO userDTO = UserClientService.getUserById(waitingpersonVO.getWaitingPersonUserID());
    userList.add(userDTO);
}
pageContext.setAttribute("userList", userList);

%>

<html>
<head>
        <meta charset="utf-8">
        
        
        <title>OASIS ROOM</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
        body{margin-top:20px;
        background:rgb(238, 238, 238, 0.6);
        color: #9aa9c1;
       
        
        }
        a{
        text-decoration:none;
        }
        
        .team_area{background:#fbfafa;}
        .team_title {
            color: #000;
            margin-bottom: 60px;
            text-align: center;
            text-transform: capitalize;
            font-weight: 600;
        }
        
        
        .single-team{margin-bottom:10px;}
        .single-team img {
            margin-bottom:15px;
            border-radius:2px;
            border: 10px solid #fff;
        }
        .single-team h3 {
            margin-bottom:0px;
            font-size:18px;
            font-weight: 600;
        }
        .single-team p{margin-bottom:0px;}
        
        .our-team .social {
            list-style: none;
            padding: 0;
            margin: 0;
            text-align: center;
            -webkit-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
        }
        .our-team .social li{
        display: inline-block;
        }
        .our-team .social li a {
            display: block;
            width: 35px;
            height: 35px;
            line-height: 35px;
            font-size: 15px;
            color: #fff;
            position: relative;
            -webkit-transition: all 0.3s ease-in-out 0s;
            transition: all 0.3s ease-in-out 0s;
            border-radius: 30px;
            margin: 3px;
        }
        .our-team:hover .social li:nth-child(1) a{
            -webkit-transition-delay: 0.3s;
                    transition-delay: 0.3s;
        }
        .our-team:hover .social li:nth-child(2) a{
            -webkit-transition-delay: 0.2s;
                    transition-delay: 0.2s
        }
        .our-team:hover .social li:nth-child(3) a{
            -webkit-transition-delay: 0.1s;
                    transition-delay: 0.1s;
        }
        .our-team:hover .social li:nth-child(4) a{
            -webkit-transition-delay: 0s;
                    transition-delay: 0s;
        }
        .our-team .social li a:hover{
            -webkit-transition-delay: 0s;
                    transition-delay: 0s;
        }
        
        
        /*START BOARD DIRECTOR*/
        .bod_area {
            padding-bottom: 80px;
            background:#fbfafa;
        }
        
        .single-bod{margin-bottom:10px;}
        .single-bod img {
            margin-bottom:15px;
            width: 180px;
            border-radius:2px;
            height: 180px;
            border: 10px solid #fff;
        }
        .single-bod h3 {
            margin-bottom:0px;
            font-size:18px;
            font-weight: 600;
        }
        .single-bod p{margin-bottom:0px;}
        
        .our-bod .social {
            list-style: none;
            padding: 0;
            margin: 0;
            text-align: center;
            -webkit-transition: all 0.3s ease 0s;
            transition: all 0.3s ease 0s;
        }
        .our-bod .social li{
        display: inline-block;
        }
        .our-bod .social li a {
            display: block;
            width: 35px;
            height: 35px;
            line-height: 35px;
            font-size: 15px;
            color: #fff;
            position: relative;
            -webkit-transition: all 0.3s ease-in-out 0s;
            transition: all 0.3s ease-in-out 0s;
            border-radius: 30px;
            margin: 3px;
        }
        .our-bod:hover .social li:nth-child(1) a{
            -webkit-transition-delay: 0.3s;
                    transition-delay: 0.3s;
        }
        .our-bod:hover .social li:nth-child(2) a{
            -webkit-transition-delay: 0.2s;
                    transition-delay: 0.2s
        }
        .our-bod:hover .social li:nth-child(3) a{
            -webkit-transition-delay: 0.1s;
                    transition-delay: 0.1s;
        }
        .our-bod:hover .social li:nth-child(4) a{
            -webkit-transition-delay: 0s;
                    transition-delay: 0s;
        }
        .our-bod .social li a:hover{
            -webkit-transition-delay: 0s;
                    transition-delay: 0s;
        }
        .title_spectial {
            text-align: center;
            font-weight: 600;
            position: relative;
            margin-bottom: 60px;
            text-transform: uppercase;
            font-size: 24px;
        }
            </style>
</head>


<body>

            
            <section id="team" class="team_area section-padding">
            <div class="container">
            <h2 class="title_spectial">列隊內等待者</h2>
            
            
			<c:if test="${not empty errorMsgs2}">
				<ul>
				    <c:forEach var="message" items="${errorMsgs2}">
				   	
				    <div class="alert alert-danger" role="alert">
			  		${message}
					</div>
					</c:forEach>
				</ul>
			</c:if>
			<c:if test="${not empty successMsgs2}">
				<ul>
				    <c:forEach var="message" items="${successMsgs2}">	    
				    <div class="alert alert-success" role="alert">
			  		${successMsgs2}
					</div>
					</c:forEach>
				</ul>
			</c:if>   
            
            
            
            <div class="row text-center justify-content-center">
    <c:forEach var="waitingPersonVo" items="${list}" varStatus="status">
    	<c:if test="${status.index < userList.size()}">
    		<c:set var="userDTO" value="${userList[status.index]}" />
		        <div class="col-lg-2 col-sm-4 col-xs-6 wow fadeInUp">
		            <div class="our-team">
		                <div class="single-team">
		                    <img src="${userDTO.userAvatar}" class="img-fluid" alt="">
		                    <h3>等待者:${userDTO.userNickname}</h3>
		                    <p>房號:${waitingPersonVo.waitingPersonWaitingID}</p>
		                </div>
		                
		                
		                <c:if test="${check eq 'Yes'}">
		                
		                <form method="post" action="<%=request.getContextPath() %>/Waiting.do">
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group">	
				  				<input type="hidden" name="userno"  value="${waitingPersonVo.waitingPersonUserID}">
				  				<input type="hidden" name="waitId"  value="${waitingPersonVo.waitingPersonWaitingID}">
				  				<input type="hidden" name="waitpId"  value="${waitingPersonVo.waitingPersonID}">
				  				
				  				 				
				  				<input type="hidden" name="action" value="delect_roomPeople">
				  				<button type="submit" class="btn btn-secondary" aria-label="Close">踢出</button>
							</div>
							</form>
		                           
		                </c:if>
		            </div>
		        </div>
	        <%-- 在第五個卡片前插入一個空的 div，使第五個卡片出現在第二排 --%>
	        <c:if test="${loop.index == 4}"><div class="w-100"></div></c:if>
        </c:if>
    </c:forEach>
</div>

					<form method="post" action="<%=request.getContextPath() %>/Waiting.do">
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">	
			  				<input type="hidden" name="action" value="select_AllWait">
			  				<button type="submit" class="btn btn-info" aria-label="Close">回到首頁</button>
						</div>
					</form>
			

            </div>
            </section>
            
            
            
            
            <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
            <script type="text/javascript"></script>
            
            </body>




    
</html>