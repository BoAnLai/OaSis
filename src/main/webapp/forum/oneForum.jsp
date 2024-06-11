<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>討論區</title>
<link href="https://cdn.datatables.net/v/ju/dt-2.0.7/b-3.0.2/b-colvis-3.0.2/cr-2.0.2/fh-4.0.1/r-3.0.2/rr-1.5.0/sc-2.4.2/sl-2.0.1/datatables.min.css"
		rel="stylesheet">
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
</style>

</head>

<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%@ include file="/home/navbar.jsp" %>
    <%@ include file="/forum/forumHeader.jsp" %>
	
	<div class="artContainer">
	<table id="artTable" class="artTable">
		 <thead>
		<tr>
			<th>標題</th>
			<th>發文時間</th>
			<th>發文者</th>			
		</tr>
		</thead>
		<tbody>
		</tbody>

	</table>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
	<script src="https://cdn.datatables.net/v/ju/dt-2.0.7/b-3.0.2/b-colvis-3.0.2/cr-2.0.2/fh-4.0.1/r-3.0.2/rr-1.5.0/sc-2.4.2/sl-2.0.1/datatables.min.js"></script>
	<script>
    $(document).ready(function () {
    	$('.dataTables_filter input[type="search"]').css('background-color', '#f0f8ff');
      let gameId = ${sessionScope.gameId};
      $.ajax({
        url: "/oasis/art",
        type: "POST",
        data: { act: "getOneForumArt", gameId: gameId },
        dataType: "json",
        success: function (data) {
          $.each(data,function (index,artDTO) {
       	    let art = "";
            art += '<tr>' +
            		'<td>'+ '<a href ="/oasis/forum/artView.jsp?art='+ artDTO.artId + '">' + artDTO.artTitle + '</td>' +
            		'<td>' + artDTO.artTimestamp + '</td>' +
            		'<td>' + artDTO.userNickname + '</td>' +
        			'</tr>';
        			
            $("#artTable tbody").append(art);
          });
          
          $('#artTable').DataTable({
        	  "info": false,
        	  "lengthMenu": [ ] ,
        	  "columns": [
                  { "width": "60%" }, 
                  { "width": "20%" }, 
                  { "width": "20%" }, 
                  
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
          
        },
        error: function (xhr, status, error) {
          console.error('AJAX request failed:', error);
        }
      });
    });
    
  </script>

</body>

</html>