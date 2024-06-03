<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.Timestamp,java.util.Date,java.text.SimpleDateFormat"%>
<%
//獲取當前時間
	Date currentDate = new Date();
	// 將當前時間轉換為 Timestamp 對象
	Timestamp currentTimestamp = new Timestamp(currentDate.getTime());
	 // 定義時間戳格式
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String formattedTimestamp = sdf.format(currentTimestamp);
%>

<!DOCTYPE html>
<html lang="zh-TW">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>文章页面</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<style>
* {
	box-sizing: border-box;
}

body {
	top: 0;
    left: 0;
    width: 100%;
    height: 100%;
	background:url("${pageContext.servletContext.contextPath}/forum/image/background.jpg")
		no-repeat center center;
	background-size: cover;
	z-index:3000;

	
}
  p{
 	position:relative;
 	
 }
.artContainer {
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	position: relative;
	top: 20px;
	margine-top: 10px;
	margin-bottom: 10px;
}
.artReplyContainer{
	display:flex;
	position:absolute;
	right:5px;
	width:75%;
	height:100px;
	background-color: white;
	margin: 10px;
	padding:5px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);
}

.user {
	position: sticky;
	height: 200px;
	width: 200px;
	top: 150px;
	padding: 20px;
	background-color: white;
	margin: 10px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);
}

.user img {
	height: 50px;
	width: 50px;
	border-radius: 50%;
	display: flex;
	justify-content: center; /* 水平居中 */
	align-items: center;
}

.userNickname {
	width: fit-content;
	top: 100px;
	left: 100px;
}

.art {
	background-color: white;
	flex-grow: 1;
	flex-direction: column;
	gap: 10px;
	position: relative;
	margin: 10px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);
}

.artTitle {
	
}

.artContent {
	min-height: 300px;
	height: auto;
	max-height: 100%;
	overflow-wrap: break-word;
	margin: 10px;
}
.commentContainer {
	background-color: #F4DAD0;
	margin: 1px;
	opcaity: 0.5;
}

.messageTop {
	display: flex;
	justify-content: space-between;
}

.messageUser {
	width: fit-content;
	font-weight: bold;
	flex-shrink: 0;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
}

.messageContent {
	flex-grow: 1;
	margin-top: 5px;
}

.messageContent:hovor {
	 transform: scale(1.1);
}

.messageTimestamp {
	font-size: 0.9em;
	color: #777;
	text-align: left;
	margin-left: 10px;
	margin-bottom: 5px;
}
#messageForm{
	display: flex;
	justify-content: space-between;
	
}
input[type="text"] {
	width: 100%;
}

img.image_resized {
	max-width: 100%;
	height: auto;
}
</style>
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
		integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<%@ include file="/home/navbar.jsp"%>
	<%@ include file="/forum/forumHeader.jsp"%>
	<div class="artContainer">
		<!-- 左侧作者信息 -->
		<aside id="user" class="user">
			<img src="author-avatar.jpg" alt="作者头像">
			<div id="userNickname" class="userNickname"></div>
		</aside>
		<!-- 右侧文章内容 -->
		<div class="art">
			<!-- 文章标题 -->
			<div>
				<h1 id="artTitle" class="artTitle"></h1>
			</div>
			<hr>
			<!-- 文章内容 -->
			<div>
				<div id="artContent" class="artContent"></div>
			</div>
			<div id="commentContainer" class="commentContainer">
				<div id="comment" class="comment"></div>
			</div>
		</div>
	</div>
	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
  function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    let regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    let results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
  }
  function getCurrentTimestamp() {
	  let now = new Date();
	  let timestamp = now.toISOString().slice(0, 19).replace('T', ' ');
	  return timestamp;
	}
  
  let artId = getUrlParameter('art');
  if (!artId) {
    artId = '<%=request.getAttribute("artId")%>';
  }
  '
  let messageTimestamp = getCurrentTimestamp();
  $(document).ready(function () {
    $.ajax({
      url: "/oasis/forum",
      type: "POST",
      data: {
        act: "getArt",
        artId: artId
      },
      dataType: "json",
      success: function (data) {

        $("#userNickname").append(data.userNickname);
        $("#artTitle").append(data.artTitle);
        $("#artContent").append(data.artContent);
        $('input[name="artTitle"]').val(data.artTitle);
        $('input[name="artReplyId"]').val(artId);
        $.each(
            data.messageDTO,function (index,message) {
              let comment = '<div class="messageTop">'
                + '<span class = "messageUser">' + message.userNickname + '</span>'
                + '<span class = "messageContent">' + message.messageContent + '</span>'
                + '</div>'
                + '<div>'
                + '<div class = "messageTimestamp">' + message.messageTimestamp + '</div>'
                + '</div>';
              $("#comment").prepend(comment);});
       let input = '<form id="messageForm" action="<%=request.getContextPath()%>/message " method="POST" >' 
        		+ '<input type=text class = "message" name="messageContent" placeholder="留言...">'
        		+ '<input type=hidden name= "artId" value="' + artId + '" >'
        		+ '<input type=hidden name= "userId" value="  " >'
        		+ '<input type=hidden name= "messageTimestamp" value="' + messageTimestamp + '" >'
        		+ '<button class="messageBtn" type = "submit">留言</button>'
        		+ '</div>'
        		+ '</form>';
        $("#commentContainer").append(input);}
      	
      ,
      error: function (xhr, status, error) {
        console.error(
          'AJAX request failed:',
          error);
      }
    });

    $.ajax({
        url: "/oasis/forum",
        type: "POST",
        data: {
          act: "getReply",
          artId: artId
        },
        dataType: "json",
        success: function (data) {

          $.each(data,function (index, art) {
                let artReply = '<div class="artContainer">'
                  + '<aside class="user">'
                  + '<img src="author-avatar.jpg" alt="作者头像">'
                  + '<div class="userNickname">'+ art.userNickname + '</div>'
                  + '</aside>'
                  + '<div class="art">'
                  + '<div class="artContent">' + art.artContent + ' </div>'
                  + '<div id="commentContainer' + index + '" class="commentContainer">'
                  + '<div id=' + 'comment' + index + ' class = comment>'
                  + '</div>'
                  + '</div>'
                  + '</div>'
                  + '</div>';

                $('body').append(artReply);

                $.each(
                    art.messageDTO,
                    function (index1,message) {
                      let comment = '<div class="messageTop">'
                        + '<span class = "messageUser">'
                        + message.userNickname
                        + '</span>'
                        + '<span class = "messageContent">'
                        + message.messageContent
                        + '</span>'
                        + '</div>'
                        + '<div>'
                        + '<div class = "messageTimestamp">'
                        + message.messageTimestamp
                        + '</div>'
                        + '</div>';
                      $('#comment'+ index)
                        .append(comment);
                    });
                input = '<input type=text class = "message" name=message data-artId =' + art.artId + ' placeholder="留言...">';
                $('#comment'+ index).append( input);
              })
        },
        error: function (xhr, status, error) {
          console.error(
            'AJAX request failed:',
            error);
        }
      });
  });
</script>
</body>
</html>
	
										