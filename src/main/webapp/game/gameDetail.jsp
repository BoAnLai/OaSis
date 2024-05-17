<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mike.game.model.*"%>
<%@ page import="com.mike.genre.model.*"%>

<%
    GameService gameSvc = new GameService();
	GameVO game = gameSvc.getGameByGameId(6);
	List<GenreVO> genreList = gameSvc.getGenresByGameId(game.getGameId());
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
	<link rel="stylesheet" href="css/list.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <div class="container">
	    <table class="table table-striped align-middle table-bordered text-center">
	    	<thead>
		    	<tr class="text-center">
		    		<th>id</th>
		    		<th>name</th>
		    		<th>img</th>
		    		<th>created timestamp</th>
		    		<th>genre</th>
		    	</tr>
	    	</thead>
			<tbody class="table-group-divider">
					
				<tr class="">
					<th><%=game.getGameId()%></td>
					<td><%=game.getGameName()%></td>
	 				<td class="imgContainer"><img class="listImg" src="<%=game.getGameImg()%>"></td>
					<td><%=game.getGameCreatedTimestamp()%></td>
					<td>
					<% for(GenreVO genre:genreList){ %>
						<%=genre.getGenreName()%><br>
					<% } %>
					</td>
				</tr>
			</tbody>
    </table>
    </div>
    <!-- 
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
     -->
</body>

</html>