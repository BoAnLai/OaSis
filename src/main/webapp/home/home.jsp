<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OaSis Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
        html, body {
            height: 100%%;
            margin: 0;
        }
        .full-height {
            height: 100%;
        }
        .left-column{
        	padding: 0px 10px;
        }
        .half-height {
            height: calc(50% - 12px); /* Adjust for gaps */
        }
        .gap {
            margin-bottom: 20px; /* Adjust for gaps */
        }
        
        .card{
			overflow: hidden;
		}
		.card-img{
			height:100%;
			width:100%;
			max-height:100%;
			max-width:100%;
			object-fit: contain;
		}
		.card-img-top, .card-img-left{
			height:100%;
			width:100%;
			max-height:100%;
			max-width:100%;
			object-fit: contain;
		}
		#cardImgContainer{
			width: 100%;
			height: 280px;
		   	overflow: hidden;
		   	background-color: LightGray;
		}
		.cardImgContainer-hr{
		   	overflow: hidden;
		   	background-color: LightGray;
		   	text-align: center;
		}
		h5{
			text-align: center;
		}
		p{
			text-align: right;
		}
		
		.image-container{
			height: 100%;
		}
		
		#btn-container{
			display: flex;
            justify-content: flex-end;
		}
		.card-right{
			min-width: 510px;
		}
    </style>
    <link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<%@ include file="/home/navbar.jsp" %>
	
    <div class="container full-height">
        <div class="row full-height">
            <!-- Left part -->
            <div class="col-md-6 d-flex align-items-center justify-content-center full-height left-column">
            
	            <div class="col mb-3 first-container">
				<div class="card h-100">
					<div id="cardImgContainer" class="col-md-4">
					  <img src="" class="card-img-top famous-img" alt="...">
					</div>
				  <div class="card-body">
				  	<div class="h-75">
					    <h5 class="card-title fw-bold famous-title">gamename</h5>
					    <p class="card-text famous-article-count">
			    			genre<br>
			    			genre<br>
				    	</p>
				  	</div>
				  	<div id="btn-container" class="mb-1">
				  		
				  					  			  		
				  		<form action="/oasis/game/forum/3" method="POST" class="famous-path">
						  <button type="submit" class="btn btn-primary">文章列表</button>
						</form>
				  	</div>
				  </div>
				  
				</div>
			</div>
			
			
            </div>
            <!-- Right part -->
            <div class="col-md-6 full-height right-column">
                <div class="row full-height">
                    <div class="col-12 half-height d-flex align-items-center justify-content-center mb-4">
                        <!-- <p>Top Right Block</p>  -->
                        
                        
                        <div class="second-container card mb-3" style="max-width: 540px; max-height:200px;">
						  <div class="card-right row g-0">
						    <div class="col-md-8 cardImgContainer-hr">
						      <img src="" class="famous-img img-fluid rounded-start" alt="">
						    </div>
						    <div class="col-md-4">
						      <div class="card-body">
						        <h5 class="famous-title card-title">Card title</h5>
						        <p class="card-text famous-article-count"></p>
						        <div id="btn-container" class="mb-1">
							  		<form action="/oasis/game/forum/3" method="POST" class="famous-path">
									  <button type="submit" class="btn btn-primary">文章列表</button>
									</form>
							  	</div>
						      </div>
						    </div>
						  </div>
						</div>
                        
                        
                        
                        
                        
                        
                    </div>
                    <div class="col-12 half-height d-flex align-items-center justify-content-center">
                        <!-- <p>Bottom Right Block</p> -->
                        
                        <div class="third-container card mb-3" style="max-width: 540px; max-height:200px;">
						  <div class="card-right row g-0">
						    <div class="col-md-8 cardImgContainer-hr">
						      <img src="" class="famous-img img-fluid rounded-start" alt="">
						    </div>
						    <div class="col-md-4">
						      <div class="card-body">
						        <h5 class="famous-title card-title">Card title</h5>
						        <p class="card-text famous-article-count"></p>
						        <div id="btn-container" class="mb-1">
							  		<form action="/oasis/game/forum/3" method="POST" class="famous-path">
									  <button type="submit" class="btn btn-primary">文章列表</button>
									</form>
							  	</div>
						      </div>
						    </div>
						  </div>
						</div>
                        
                        
                        
                        
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
		
	
	
	<script>
   $(document).ready(function () {
	   $.ajax({
	        url: "/oasis/art",
	        type: "POST",
	        data: { act: "getFamousForum" },
	        dataType: "json",
	        success: function (data) { 
	        	console.log(data);
	        	const containers = $('.first-container, .second-container, .third-container');

            containers.each(function(index) {
                if (index < data.length) {
                    const container = $(this);
                    const img = container.find('.famous-img');
                    const title = container.find('.famous-title');
                    const articleCount = container.find('.famous-article-count');
                    const form = container.find('.famous-path');

                    img.attr('src', data[index].gameImg);
                    title.text(data[index].gameName);
                    articleCount.text("文章數(含回文): " + data[index].artCounts);
                    form.attr('action', "/oasis/game/forum/"+data[index].gameId)
                }
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