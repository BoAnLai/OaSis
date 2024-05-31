<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.InetAddress"%>
<%@ page import="java.net.UnknownHostException"%>
<%@ page import="com.mike.user.model.*"%>
<%@ page import="com.mike.tool.*"%>

<%
	UserService userSvc = new UserService();
    List<UserVO> list = userSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OaSis</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/avatar.css">
    <style>
	  table#table-1 {
		background-color: #CCCCFF;
	    border: 2px solid black;
	    text-align: center;
        width: 100%;
        max-width: 800px;
        margin: 0 auto;
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
	  table {
		max-width: 100%;
		background-color: white;
		margin-top: 5px;
		margin-bottom: 5px;
	  }
	  table, th, td {
	    border: 1px solid #CCCCFF;
	  }
	  th, td {
	    padding: 5px;
	    text-align: center;
	    max-width: 100px;
	    max-height: 20px;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	  }
	  tr th:first-child{
	  	width: 50px;
	  }
	  
	  @media (max-width: 800px) {
        table, th, td {
            font-size: 12px;
        }
    	}
    
	</style>
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%@ include file="../home/navbar.jsp" %>
    <div class="container">
	    <table class="table table-striped align-middle table-bordered text-center" id="datatable">
	    	<thead>
		    	<tr class="text-center">
		    		<th>ID</th>
		    		<th>信箱</th>
		    		<th>身份</th>
		    		<th>公司名稱</th>
		    		<th>暱稱</th>
		    		<th>頭像</th>
		    		<th>帳號管理</th>
		    	</tr>
	    	</thead>
	    	<tbody class="table-group-divider">
		    	<% for(UserVO listedUser: list){ %>
					<tr>
						<td><%= listedUser.getUserId() %></td>
						<td><%= listedUser.getUserEmail() %></td>
						<td><%= listedUser.getUserIdentity() %></td>
						<td><%= listedUser.getUserCompanyName() %></td>
						<td><%= listedUser.getUserNickname() %></td>
						
						<td>
							<div class="">
						<% if(listedUser.getUserAvatar()==null || listedUser.getUserAvatar().trim().isEmpty()){ %>
		 					<img class=imgPreviewPlaceholder src="/oasis/user/resources/avatarUploaded/unknown.jpg" style="object-fit: cover;">
						<% }else{ %>
		 					<img class="imgUpload" src="<%= StringProcessor.pathAddRandomQueryParams(listedUser.getUserAvatar()) %>" style="object-fit: cover;">
						<% } %>
							</div>
						</td>
						
						<td>
						  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/user/update" style="margin-bottom: 0px;">
						     <input type="submit" class="btn btn-outline-dark" value="查看">
						     <input type="hidden" name="updateUserId"  value="<%= listedUser.getUserId() %>"></FORM>
						</td>
					</tr>
		    	<% } %>
	    	</tbody>				
	    </table>
    </div>

	<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#datatable').DataTable();
        });
    </script>
</body>

</html>