<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ryan.subs.model.*"%>
<%@ page import="com.mike.user.model.*"%>
<%@ page import="com.mike.game.model.*"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<%@ include file="../home/navbar.jsp"%>
	
	
	<%
	//取得 userId
	Integer subsGameId = 2;

	//使用方法取得list
	SubsService subsService = new SubsService();

	List<SubsVO> subsList = subsService.findByGameId(subsGameId);
	%>
	
	<p><%= subsList %></p>
	
	<h1>Subscriptions List</h1>
<table border="1">
    <tr>
        <th>Subs User ID</th>
        <th>Subs Status</th>
    </tr>
    <%
        for (SubsVO subs : subsList) {
    %>
    <tr>
        <td><%= subs.getSubsUserId() %></td>
        <td><%= subs.getSubsStatus() %></td>
    </tr>
    <%
        }
    %>
</table>
	

</body>
</html>