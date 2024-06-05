<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mike.game.model.*"%>
<%@ page import="com.mike.genre.model.*"%>
<%@ page import="com.mike.label.model.*"%>

<%
    List<GameVO> gameList = GameService.listAll();
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	
	<%@ include file="/home/navbar.jsp" %>
    <div class="container">
	    <table class="table table-striped align-middle table-bordered text-center" id="datatable">
	    	<thead>
		    	<tr class="text-center">
		    		<th>id</th>
		    		<th>name</th>
		    		<th>img</th>
		    		<th>genre</th>
		    		<th>created timestamp</th>
		    	</tr>
	    	</thead>
			<tbody class="table-group-divider">
				
				<% for(GameVO game: gameList){ %>
				<tr class="">
					<th><%= game.getGameId() %></td>
					<th><%= game.getGameName() %></td>
	 				<td class="imgContainer"><img class="listImg" src="<%= game.getGameImg() %>"></td>
					<td>
						<% 
						   List<GenreVO> genreList = GameService.getGenresByGameId(game.getGameId());
						   for(GenreVO genre: genreList){ 
						%>
           					<%= genre.getGenreName() %> <br>
						<% } %>
					</td>
					<td><%= game.getGameCreatedTimestamp() %></td>
				</tr>
				<% }%>
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