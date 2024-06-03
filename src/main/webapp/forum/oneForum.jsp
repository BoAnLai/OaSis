<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>討論區</title>

</head>

<body>
	<table id="artTable" class="display">
		 <thead>
		<tr>
			<th>標題</th>
			<th>發文時間</th>
		</tr>
		</thead>
		<tbody>
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
    $(document).ready(function () {
     
      $.ajax({
        url: "/oasis/forum",
        type: "POST",
        data: { act: "getOneForumArt", gameId: "1" },
        dataType: "json",
        success: function (data) {
          
          console.log(data);
          $.each(data,function (index,artVO) {
       	    let art = "";
       	 console.log("artTitle:", artVO.artTitle);
         console.log("artTimeStamp:", artVO.artTimestamp);
            art += '<tr>' +
            		'<td>' + artVO.artTitle + '</td>' +
            		'<td>' + artVO.artTimestamp + '</td>' +
        			'</tr>';;
            console.log("Adding row for art title:", artVO.artTitle);
         // 將表格內容插入到表格中
            $("#artTable tbody").append(art);
            console.log("Table content updated with new rows.");
          });
          
          
          
          console.log("Table content updated with new rows.");
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