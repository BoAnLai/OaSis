<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mike.game.model.*" %>

<% 
	GameVO game = (GameVO) session.getAttribute("game");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>

	<h1>this gameInfo.jsp is for testing gameDropdown selection</h1>
	<h1><%= game.getGameName() %></h1>
	<img src="<%= game.getGameImg() %>">
</body>
</html>