<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.mike.genre.model.*"%>
<%@ page import="com.mike.game.model.*"%>
	
<% List<GenreVO> genreList = GenreService.listAll(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gameSelectTemplate</title>

 <style>
 	#iframe-container{
 		height: calc(100vh - 170px);
 	}
 </style>
</head>
<body>

	    <div class="d-flex p-2 justify-content-center">

	        <div class="dropdown mx-5">
	            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
	                aria-expanded="false" id="genre-dropdown-btn" style="width: 200px; text-align: center;">
	                -- Select Genre --
	            </button>
	            <ul class="dropdown-menu select-genre">
	            <% for(GenreVO genre:genreList){ %>            
	                <li><button class="dropdown-item" type="button" data-genre-id="<%= genre.getGenreId()%>"><%= genre.getGenreName()%></button></li>
	            <% } %>
	            </ul>
	        </div>
	
	        <div class="dropdown mx-5">
	            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown"
	                aria-expanded="false" id="game-dropdown-btn" style="width: 200px; text-align: center;">
	                -- Select Game --
	            </button>
	            
	            <ul class="dropdown-menu select-game">
				<% for(GenreVO genre:genreList){ %>
					<% 	List<GameVO> gameList = GenreService.getGameListByGenreId(genre.getGenreId()); %>            
	        	    <div class="game-dropdown-container" data-from-genre-id="<%= genre.getGenreId() %>">
            			<% for(GameVO game:gameList){ %>
                			<li><button class="dropdown-item" type="button" data-game-id="<%= game.getGameId() %>"><%= game.getGameName() %></button></li>
		            	<% } %>
		            </div>
	            <% } %>
	            </ul>
	        </div>
    	</div>
	</div>

	<div id="iframe-container" class="">
		<iframe src="/oasis/game/list" width=100% height=100%></iframe>
	</div>
    
    <script>
	    $(document).ready(function() {
	    	
	    	let getFrontPagePath = $('#game-select-front-page').attr('data-game-select-front-page');
	    	let frontPagePath = (getFrontPagePath)?getFrontPagePath:"";
	    	$('#iframe-container iframe').attr('src',frontPagePath);
	    	
	    	$('.game-dropdown-container').hide();
	    	
	   		$('.select-genre').on('click', '.dropdown-item', function() {
	        	$('.game-dropdown-container').hide(); 
	        	$('#game-dropdown-btn').text("-- Select Game -- ");
	        	
	        	let name = $(this).text();
	    	    $('#genre-dropdown-btn').text(name);
	
	        	
	    	    let genreId = $(this).attr('data-genre-id');
	    	    let selector = `[data-from-genre-id="` + genreId + `"]`;
	    	    $(selector).show();
	    	});
	   		
	   		$('.select-game').on('click', '.dropdown-item', function() {
	   			let name = $(this).text();
	    	    $('#game-dropdown-btn').text(name);
	    	    
	    	    let gameId = $(this).attr('data-game-id');
	    	    let getForwardPath = $('#game-select-info').attr('data-forward-path');
	    	    let forwardPath = (getForwardPath)?getForwardPath:"";

	    	    let path = '/oasis/game/gameInfo?gameId=' + gameId + '&forwardPath=' + forwardPath;
	    	    
	    	    $('#iframe-container iframe').attr('src',path);
	   		});
	    });    
    </script>



</body>
</html>