<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shiyen.art.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
ArtService artSvc = new ArtService();
List<ArtVO> list = artSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<title>所有文章 - listAllArt.jsp</title>

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
<body bgcolor='white'>


	
	<h3>所有文章 - listAllArt.jsp</h3>
	

	<table id="artTable">
		<thead>
		<tr>
			<th>文章編號</th>
			<th>文章標題</th>
			<th>文章內容</th>
			<th>發文時間</th>
			<th>回覆文章編號</th>
			<th>收藏數</th>
			<th>瀏覽數</th>
			<th>修改</th>
			<th></th>

		</tr>
		</thead>
		<tbody>
		<c:forEach var="artVO" items="${list}">
			
			<tr>
				<td>${artVO.artId}</td>
				<td><a href="<%=request.getContextPath()%>/forum/artView.jsp" >${artVO.artTitle}</a></td>
				<td>${artVO.artContent}</td>
				<td>${artVO.artTimestamp}</td>
				<td>${artVO.artReply}</td>
				<td>${artVO.artFavor}</td>
				<td>${artVO.artView}</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/forum"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="artId" value="${artVO.artId}"> <input type="hidden"
							name="act" value="update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>//forum"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="artId" value="${artVO.artId}"> <input type="hidden"
							name="act" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
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
            $('#artTable').DataTable();
        });
    </script>

</body>
</html>