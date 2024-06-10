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
            height: 80px;
            position:fixed;
            top:70px;
            background-color: #E4D8D9;
            padding: 10px 20px;
            box-shadow:3px 3px 3px rgba(0, 0, 0, 0.3);
            margin-top:20px;
            z-index:900; 
        }
        .header div {
            cursor: pointer;
            width: 20%;
            height: 45px;
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
            
            margin-top: auto;
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
            height: 45px;
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
            
            top: 19px
        }
        .headerForm button:hover {
            background-color: #B39194;
        }
        #blockingContent{
        	height: 40px;
        }
    </style>
</head>
<body>
    <header class="header">
        <div id="gameList">討論區</div>
        <div id="artList">文章列表</div>
        
        <form class="headerForm" action="<%=request.getContextPath()%>/reurl" method="POST" >
        <button id="postButton" style = "${displayPost}" type = "submit">發文</button>
        <input type=hidden name="reurl" value = "toPostArt">
        </form>
        
        <form class="headerForm" action="<%=request.getContextPath()%>/reurl" method="POST" >
        <input type=hidden name ="reurl"   value = "toReplyArt">
        <input type=hidden name ="artTitle" >
        <input type=hidden name ="artReplyId" >
        <button id="replyButton" style = "${displayReply}" type = "submit" >回覆</button>
        </form>
    </header>
    <div id="blockingContent">
    </div>

    <script>
        document.getElementById('gameList').onclick = function() {
            window.location.href = '/oasis/game';
        };

        document.getElementById('artList').onclick = function() {
            window.location.href = '/oasis/forum'; 
        };
       
    </script>
</body>
</html>