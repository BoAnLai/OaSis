<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <style>
        .header {
            display: flex;
            justify-content: flex-start;
            align-items: center;
            width: 100vw;
            height: 60px;
            position:fixed;
            top:70px;
            background-color: #E4D8D9;
            padding: 10px 20px;
            box-shadow:3px 3px 3px rgba(0, 0, 0, 0.3);
            margin-top:20px;
            z-index:3000; 
        }
        .header div {
            cursor: pointer;
            width: 20%;
            height: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-right: 10px;
            flex-shrink: 0;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            box-shadow:3px 3px 3px rgba(0, 0, 0, 0.3);
            
        }
        .header div:hover {
            background-color: #B39194;
        }
        .header form {
            cursor: pointer;
            width: 20%;
            height: 90%;
            position: absolute;
            right:30px;
            top:5px;
            
        }
        
        .headerForm button {
        	position: absolute;
        	cursor: pointer;
             width: 100%;
            height: 80%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s;
            margin-right: 10px;
            flex-shrink: 0;
            font-size: 20px;
            font-weight: bold;
            text-align: center;
            background-color: #E4D8D9;
            box-shadow:3px 3px 3px rgba(0, 0, 0, 0.3);
            z-index:2;
        }
        .headerForm button:hover {
            background-color: #B39194;
        }
    </style>
</head>
<body>
    <header class="header">
        <div id="gameList">討論區</div>
        <div id="artList">文章列表</div>
        <form class="headerForm" action="<%=request.getContextPath()%>/reurl" method="POST" >
        <button id="postButton" type = "submit">發文</button>
        <input type=hidden name="reurl" value = "toPostArt">
        </form>
        <form class="headerForm" action="<%=request.getContextPath()%>/reurl" method="POST" >
        <input type=hidden name ="reurl"   value = "toReplyArt">
        <input type=hidden name ="artTitle" >
        <input type=hidden name ="artReplyId" >
        <button id="replyButton">回復</button>
        </form>
    </header>

    <script>
        document.getElementById('gameList').onclick = function() {
            window.location.href = '/oasis/game/list';
        };

        document.getElementById('artList').onclick = function() {
            window.location.href = '/oasis/forum/oneForum.jsp'; 
        };
        window.onload = function() {
        	  var postButton = document.getElementById('postButton');
        	  var replyButton = document.getElementById('replyButton');

        	  if (window.location.pathname === '/oasis/forum/oneForum.jsp') {
        	    postButton.style.display = 'block';
        	    replyButton.style.display = 'none';
        	  } else if (window.location.pathname === '/oasis/forum/artView.jsp') {
        	    postButton.style.display = 'none';
        	    replyButton.style.display = 'block';
        	  }else {
        	        postButton.style.display = 'none';
        	        replyButton.style.display = 'none';
        	    }
        	};
    </script>
</body>
</html>