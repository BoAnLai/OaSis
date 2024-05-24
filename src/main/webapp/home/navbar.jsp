<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mike.user.model.*"%>

<%
	UserVO user = (UserVO) session.getAttribute("user");
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
    </style>
</head>

<body>
    <div class="root">
        <header>
            <nav class="navbar navbar-expand-lg sticky-top">
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
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="<%= request.getContextPath()%>">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="<%= request.getContextPath()%>/game/list">Game List</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                                    aria-expanded="false">
                                    Dropdown
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Action</a></li>
                                    <li><a class="dropdown-item" href="#">Another action</a></li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li><a class="dropdown-item" href="#">Something else here</a></li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
					        <li><a href="/oasis/login" class="btn btn-primary" id="login-btn">login</a></li>
					        <li>
	                            <div class="dropdown" id="login-dropdown">
								  <a class="btn btn-secondary dropdown-toggle" id="user-email" role="button" data-bs-toggle="dropdown" aria-expanded="false">
								    <% if(user!=null){ %>
								    	<% if(user.getUserNickname().trim() != ""){ %>
								    		<%= user.getUserNickname()%>
								    	<% }else{ %>
									    	<%=user.getUserEmail()%>
									    <% } %>
								    <% } %>
								  </a>
								
								  <ul class="dropdown-menu">
								    <li><a class="dropdown-item" href="#">會員中心</a></li>
								    <li><a class="dropdown-item" href="<%= request.getContextPath() %>/loggingout">登出</a></li>
								  </ul>
								</div>
							</li>
					    </ul>
                    </div>
                </div>
            </nav>
        </header>

    </div>
	<script>
		if($("#user-email").text().trim()){
			$("#login-btn").hide();
		}else{
			$("#login-dropdown").hide();
		}
	</script>
</body>

</html>