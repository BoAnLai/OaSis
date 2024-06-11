<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>OaSis Home</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style type="text/css">
		.card{
			max-width: 250px;
		}
		div.card-body{
			height:300px;
		}
		#btn-container{
			display: flex;
            justify-content: flex-end;
		}
		
		body{
		 box-sizing: border-box;
		  background-image: url('${pageContext.servletContext.contextPath}/forum/image/background2.jpg');
		  background-size: cover;
		  background-position: center;
		}
	.container {
		width:800px;
		height: 300px;
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin: 5px;
        
    }
    
    .first-container, .second-container, .third-container {
    border: 1px solid #ccc;
     margin: 0 10px;
    padding: 10px;
    flex: 1;
    display: flex;
    flex-direction: column;
    background-color:#C8C8E7;
    height:500px;
     max-width: calc(100% / 3 - 10px);
}
.image-container img {
	width:100%;
    height: auto;
    
     object-fit: cover;
}
  .image-container {
     flex: 1;
    display: flex;
    align-items: center;
    justify-content: center;
    overflow: hidden;
    top:auto;
    width:200px;
      max-width: 100%;
        }
.name-container {
    margin-top: 10px;
    text-align: center;
    
}
.second-container, .third-container {
    flex-direction: column; 
}
.article-count-container {
    margin: 0;
    text-align: center;
}
    
   .title{
   	text-align: center;
   	font-weight: bolder;
   	font-size:50px;
   	font-family:Roboto;
   	color: #990000;
   }
   h1{
    background-color:#C8C8E7;
    width:300px;
    
   }
   p{
   	text-align: center;
   	font-weight: bold;
   	font-size:20px;
   	font-family:Lato;
   	color:#556B2F;
   	
   }
   .first,.second,.third{
   	  width:100px;
   	  height:100px;
   	  margin:10px;
   }
	</style>
</head>
<body>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<%@ include file="/home/navbar.jsp" %>
	<h1>熱門討論區</h1>
	<div class="container">
    
        <div class="first-container">
          <img class="first" src="${pageContext.servletContext.contextPath}/forum/image/1.png" alt="第一名">
            <div class="image-container">
                <img src="" alt="遊戲圖片">
            </div>
            <div class="name-container">
                <h2 id="first" class="title"></h2>
            </div>
            <div class="article-count-container">
                <p>文章數: </p>
            </div>
        </div>
        <div class="second-container">
        <img class="second" src="${pageContext.servletContext.contextPath}/forum/image/2.png" alt="第二名">
            <div class="image-container">
                <img src="" alt="遊戲圖片">
            </div>
            <div class="name-container">
                <h2 id="second" class="title"></h2>
            </div>
            <div class="article-count-container">
                <p>文章數: </p>
            </div>
        </div>
        <div class="third-container">
            <img class="third" src="${pageContext.servletContext.contextPath}/forum/image/3.png" alt="第三名">
            <div class="image-container">
                
                <img src="" alt="遊戲圖片">
            </div>
            <div class="name-container">
                <h2 id="third" class="title"></h2>
            </div>
            <div class="article-count-container">
                <p>文章數: </p>
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
                    const img = container.find('.image-container img');
                    const title = container.find('.name-container .title');
                    const articleCount = container.find('.article-count-container p');

                    img.attr('src', data[index].gameImg);
                    title.text(data[index].gameName);
                    articleCount.text("文章數: " + data[index].artCounts);
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