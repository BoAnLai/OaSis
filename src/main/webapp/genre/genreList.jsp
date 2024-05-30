<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mike.game.model.*"%>
<%@ page import="com.mike.genre.model.*"%>
<%@ page import="com.mike.label.model.*"%>

<%
    List<GenreVO> genreList = GenreService.listAll();
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
 	<% for(GenreVO genre:genreList){ %>
 		<h2><%= genre.getGenreName() %>:</h2>
 		<% List<GameVO> gameList = GenreService.getGameListByGenreId(genre.getGenreId()); %>
		<% for(GameVO game:gameList){ %>
			<p><%= game.getGameName() %></p>
		<% } %>
 		
 	<% } %>
</body>

</html>