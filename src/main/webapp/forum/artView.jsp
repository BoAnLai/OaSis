<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>











<!DOCTYPE html>
<html lang="zh-TW">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>文章页面</title>
  <style>
    
    .article-container {
      display: flex;
      align-items: flex-start;
    }

    .user {
      height: 200px; 
      width: 200px;
      padding: 20px;
      border:5px solid blue;
      padding:10px;
      margin:5px;
      
	  height: 50vh; /* 视口高度 */
    }

    .user img {
      height: 50px; 
      width: 50px;
      border-radius: 50%;
      display: flex;
      justify-content: center; /* 水平居中 */
  	  align-items: center; 
    }
    .userNickname{
    	display: flex;
    	justify-content: center; /* 水平居中 */
  		align-items: center; 
    }

    .article-content {
      flex: 1;
      padding: 20px;
      
      
    }

    .article-title {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 20px;
     
    }

    .article-body {
      line-height: 1.6;
    }

    .comment {
      margin-bottom: 10px;
      border:5px solid pink;
      padding:10px;
      margin:5px,5px
    }
    .artTitle{
      border:5px solid lightgreen;
      padding:10px;
      margin:5px,5px
    }
    .artContent{
      border:5px solid red;
      padding:10px;
      margin:5px,5px
    }
  </style>
</head>

<body>
  <div class="article-container">
    <!-- 左侧作者信息 -->
    <div class="user">
      <img src="author-avatar.jpg" alt="作者头像">
      <p class="userNickname"></p>
    </div>
    <!-- 右侧文章内容 -->
    <div class="article-content">
      <!-- 文章标题 -->
      <h1 class="artTitle"></h1>
      <!-- 文章内容 -->
      <div class="article-body">
        <p class="artContent"></p>
      </div>
      
        <div class="comment">
          
        </div>
        
      </div>

  </div>
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
    $(document).ready(function () {

      $.ajax({
        url: "/oasis/forum",
        type: "POST",
        data: { act: "getArt", artId: "4" },
        dataType: "json",
        success: function (data) {
        	console.log(data);
          $(".userNickname").append(data.userNickname);
          $(".artTitle").append(data.artTitle);
          $(".artContent").append(data.artContent);
          $.each(data.messageDTO, function (index, message) {
              console.log(data.messageDTO);
        	  let comment = '<table>' +
                  '<tr>' +
                  '<td>' + message.userNickname + '</td>' +
                  '<td>' + message.messageContent + '</td>' +
                  '<td>' + message.messageTimestamp + '</td>' +
                  '</tr>' +
                  '</table>';
              $(".comment").append(comment);
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