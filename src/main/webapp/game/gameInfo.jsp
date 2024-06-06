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

	<h1>this is gameInfo.jsp</h1>
	<p>This is forwarded page</p>
	<hr>
	<h3>Below show your selection</h3>
	<p>GameId: <%= game.getGameId() %></p>
	<p>GameName: <%= game.getGameName() %></p>
	<img src="<%= game.getGameImg() %>">
	<a href=""></a>
</body>
</html>