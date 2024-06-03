<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<title>討論區</title>

</head>

<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <%@ include file="/home/navbar.jsp" %>
    <%@ include file="/forum/forumHeader.jsp" %>
	<table id="artTable" class="display">
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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link
		href="https://cdn.datatables.net/v/ju/dt-2.0.7/b-3.0.2/b-colvis-3.0.2/cr-2.0.2/fh-4.0.1/r-3.0.2/rr-1.5.0/sc-2.4.2/sl-2.0.1/datatables.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.datatables.net/v/ju/dt-2.0.7/b-3.0.2/b-colvis-3.0.2/cr-2.0.2/fh-4.0.1/r-3.0.2/rr-1.5.0/sc-2.4.2/sl-2.0.1/datatables.min.js"></script>
	<script>
    $(document).ready(function () {
      
      $.ajax({
        url: "/oasis/forum",
        type: "POST",
        data: { act: "getOneForumArt", gameId: "1" },
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
          // 初始化 DataTables 插件
          $('#artTable').DataTable();

        },
        error: function (xhr, status, error) {
          console.error('AJAX request failed:', error);
        }
      });
    });
    
  </script>

</body>

</html>