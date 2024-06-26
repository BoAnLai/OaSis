<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mike.user.model.*"%>

<%
	UserDTO user = (UserDTO) session.getAttribute("user");
%>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OaSis</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        nav.navbar {
            padding-top: 0;
            padding-bottom: 0;
            background-color: #e3f2fd;
        }
        div.blocking-nav{
        	margin-top: 150px;
        }
    </style>
</head>

<body>
    <div class="root">
        <header>
            <nav class="navbar navbar-expand-lg fixed-top">
                <div class="container-fluid fs-4">
                    <a class="navbar-brand" href="<%=request.getContextPath()%>">
                        <img src="/oasis/home/resources/oasis.png"
                            alt="" height="100">
                    </a>
                    
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item mx-3">
                                <a class="nav-link active" aria-current="page" href="<%= request.getContextPath()%>">首頁</a>
                            </li>
                            <li class="nav-item mx-3">
                                <a class="nav-link" href="<%= request.getContextPath()%>/game">論壇入口</a>
                            </li>
                            <li class="nav-item mx-3">
                                <a class="nav-link" href="<%= request.getContextPath()%>/waiting/waiting_select.jsp">組隊聊天</a>
                            </li>
                            <li class="nav-item mx-3">
                                <a class="nav-link" href="<%= request.getContextPath()%>/product/resources/productList.jsp">瀏覽商品</a>
                            </li>
                            <li class="nav-item mx-3">
                                <a class="nav-link" href="<%= request.getContextPath()%>/subs/mySubs.jsp">訂閱訊息</a>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
					        <li><a href="/oasis/login" class="btn btn-primary" id="login-btn">登入</a></li>
					        <li>
	                            <div class="dropdown" id="login-dropdown">
								  <a class="btn btn-secondary dropdown-toggle" id="user-name" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								    <% if(user!=null){ %>
								    	<%= user.getUserName() %>
								    <% } %>
								  </a>
								
								  <ul class="dropdown-menu dropdown-menu-end">
								    <li><a class="dropdown-item" href="<%= request.getContextPath()%>/personalUpdate">修改個人資料</a></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath()%>/msg">系統訊息</a></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath()%>/home/article">我的文章</a></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/myCart">我的購物車</a></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/subs/mySubs.jsp">我的訂閱</a></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/loggingout">登出</a></li>
								    
								    <%
								    String identity = "REGULAR";
								    if(user!=null){							    	
									    identity = user.getUserIdentity().toString(); 
								    }
								    switch(identity) { 
								     	case "ADMINISTRATOR": 
								    %>
								    <li><hr class="dropdown-divider"></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath()%>/user/list">會員列表</a></li>
								    <%
								    		break; 
								     	case "COMPANY":	
								    		break; 
								     	case "REGULAR": 
								    %>
								    <li><hr class="dropdown-divider"></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath()%>/user/applyForCompanyIdentity">申請廠商身份</a></li>
								    <% 
								    		break; 
								    } 
								    %>
								  </ul>
								</div>
							</li>
					    </ul>
                    </div>
                </div>
            </nav>
        </header>
    </div>
    
    <div class="blocking-nav"></div>
    
	<script>
		if($("#user-name").text().trim()){
			$("#login-btn").hide();
		}else{
			$("#login-dropdown").hide();
		}
	</script>
</body>

</html>