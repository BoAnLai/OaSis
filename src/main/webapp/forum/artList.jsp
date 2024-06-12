<%@page import="com.shiyen.favor.model.FavorService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shiyen.art.model.*,com.shiyen.favor.model.*"%>





<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>所有文章 </title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
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

<style>
 .artTitle{
		color:black;
		 text-decoration: none
	}
	#artTable_wrapper {
    border: 1px solid #ccc; 
 
    overflow: auto; 
}
 .dataTables_wrapper {
            width: 80%; 
            margin: auto; 
        }
	.artContainer{
	width:100%;   
    height: auto; 
    margin: 0 auto; 
    overflow: auto; 
    border: 1px solid #ccc;
    padding: 20px; 
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color:#D7D8EF;
    }
    .table thead th {
    background-color: #51A1B4; 
}
.dt-layout-row {
    background-color: #4B92AF; 
}
.dt-search-0{
	background-color: light-gray;
}
.table tr:nth-child(even) {
    background-color: #f2f2f2; 
}


.table tr:hover {
    background-color: #ddd;
}
label{
	font-size: 20px;
}
label[for="dt-length-0"] {
    display: none;
}
select{
display: none;
}
#dt-search-0 {
	background-color: lightgray;
}
.title{
	fontsize:30px;
	 font-weight: bolder;
	 fpnt-family:Roboto;
	 color:#660000;
}
</style>
</head>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<%@ include file="../home/navbar.jsp"%>
<%
ArtService artSvc = new ArtService();
List<ArtVO> list = artSvc.getAllByUserId(user.getUserId());
pageContext.setAttribute("list", list);

FavorService favorSvc = new FavorService();
List<FavorDTO> favorList = favorSvc.getFavorByuserId(user.getUserId());
pageContext.setAttribute("favorList", favorList);
%>
<body bgcolor='white'>


	<div class="artContainer">
	<h1 class="title">發表文章</h1>
	

	<table id="artTable">
		<thead>
		<tr>
			<th>文章標題</th>
			<th>發文時間</th>
			<th>修改</th>
			<th>刪除</th>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="artVO" items="${list}">
			
			<tr>
				<td><a href="<%=request.getContextPath()%>/forum/artView.jsp?art=${empty artVO.artReply ? artVO.artId:artVO.artReply }" >${artVO.artTitle}</a></td>
				<td>${artVO.artTimestamp}</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reurl"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> 
						<input type="hidden"name="artId" value="${artVO.artId}"> 						
						<input type="hidden"name="reurl" value="update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="artId" value="${artVO.artId}"> 
						<input type="hidden" name="act" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="artContainer">
	<h1 class = title>收藏文章</h1>
	

	<table id="favorTable">
		<thead>
		<tr>
			<th>文章標題</th>
			<th>收藏時間</th>
			<th>刪除</th>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="favorDTO" items="${favorList}">
			
			<tr>
				<td><a href="<%=request.getContextPath()%>/forum/artView.jsp?art=${favorDTO.artId}" >${favorDTO.artTitle}</a></td>
				<td>${favorDTO.favorTimestamp}</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/post"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> 
						<input type="hidden" name="artId" value=" ${favorDTO.artId}"> 
						<input type="hidden" name="userId" value=" ${sessionScope.user.userId}"> 
						<input type="hidden" name="act" value="deleteFavor2">
					</FORM>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link
		href="https://cdn.datatables.net/v/ju/dt-2.0.7/b-3.0.2/b-colvis-3.0.2/cr-2.0.2/fh-4.0.1/r-3.0.2/rr-1.5.0/sc-2.4.2/sl-2.0.1/datatables.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.datatables.net/v/ju/dt-2.0.7/b-3.0.2/b-colvis-3.0.2/cr-2.0.2/fh-4.0.1/r-3.0.2/rr-1.5.0/sc-2.4.2/sl-2.0.1/datatables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#artTable').DataTable({
            	"info": false,
          	 	 "lengthMenu": [ ] ,
            	"columns": [
                    { "width": "60%" }, 
                    { "width": "20%" }, 
                    { "width": "10%" }, 
                    { "width": "10%" }, 
                    
                ],
            "columnDefs": [{
                "targets": "_all", 
                "render": function (data, type, row, meta) {
                    if (type === 'display' && typeof data === 'string' && data.includes('<a ')) {
                        return data.replace(/<a /, '<a class="artTitle" ');
                    }
                    return data;
                }
            }],
            "order": [[1, 'asc']],
            autoWidth: false
            
            });
        });
        $(document).ready(function() {
            $('#favorTable').DataTable({
                "columns": [
                    { "width": "70%" }, 
                    { "width": "15%" }, 
                    { "width": "15%" },  
                    
                ],
            "columnDefs": [{
                "targets": "_all", 
                "render": function (data, type, row, meta) {
                    if (type === 'display' && typeof data === 'string' && data.includes('<a ')) {
                        return data.replace(/<a /, '<a class="artTitle" ');
                    }
                    return data;
                }
            }],
            "order": [[1, 'asc']],
            autoWidth: false
            
            });
        });
    </script>

</body>
</html>