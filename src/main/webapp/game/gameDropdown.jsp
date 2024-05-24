<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mike.genre.model.*"%>
<%@ page import="com.mike.game.model.*"%>
	
<% List<GenreVO> genreList = GenreService.listAll(); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gameSelectTemplate</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
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

	<%@ include file="/home/navbar.jsp" %>
	
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


    <div class="d-flex justify-content-center">

        <div>
            <h1>Genre Name:</h1>
            <p>Game1</p>
            <p>Game2</p>
        </div>

    </div>
    <script>
    $(document).ready(function() {
    	
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
   		});
    });
    
    /*
    $(document).ready(function() {
        $(".select-genre").click(function() {
            $.get("/ajax/get-data", function(response) {
                $("#data-container").html(response);
            });
        });
    });
    */
    </script>


</body>
</html>