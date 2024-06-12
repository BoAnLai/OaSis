<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.sql.Timestamp,java.util.Date,java.text.SimpleDateFormat,com.shiyen.favor.model.*"%>
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
.user {
	display: flex;
	flex-direction: column;
	position: sticky;
	height: 200px;
	width: 200px;
	top: 150px;
	flex-shrink: 0;
	background-color: white;
	padding:10px;
	margin: 10px;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, 0.3);
}
.userAvatar{
	flex:8;
    border-radius: 50%;  
   	display:flex;
     overflow: hidden;
    justify-content: center;
    align-items: center;
    
}
.userAvatar img {
	 display: block;
 	 width: 100%;
 	 height: auto;
 	 max-width:150px;
 	 max-height:130px;
 	 
        }

.userNickname {
    flex:2;
	width: fit-content;
	display: flex;
    align-items: center; 
    justify-content: center; 
    text-align: center;
   
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
	margin-top:10px;
	margin-left:10px;
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
	opcaity: 0.3;
	z-index:0;
}
.oneMessage {
  display: flex;
  flex-direction: column;
  position: relative;
  
}
.oneMessage:hover{
	background-color: #D8D3D3;
	opcaity:0.8;
	z-index:1;
}
.imageContainer{
	position: absolute;
  	top: 0;
    right: 0;
	 }
.message{
	 display: flex;
	 flex-direction: column;
  	

}
.messageTop {
	display: flex;
  flex-direction: row;
	
}

.messageUser {
	width: fit-content;
	display: inline-block;
	font-weight: bold;
	flex-shrink: 0;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 5px;
	margin-bottom: 5px;
}
#artContent{
	position:relative;
}
.messageContent {
	display: inline-block;
	flex-grow: 1;
	margin-top: 5px;
}

.messageTimestamp {
	font-size: 0.9em;
	color: #777;
	text-align: left;
	margin-left: 10px;
	margin-top: 5px;
	
}
#messageForm{
	display: flex;
	justify-content: space-between;
	
}
input[type="text"] {
	width: 100%;
}


.image img{
width:100%
}
#markContainer {
    position: absolute;
    bottom: 10px;
    right: 10px;
    cursor: pointer;
    padding: 10px;
    width:50px;
    height:50px;
}
#markContainer img{
	display: block;
 	 width: 100%;
 	 height: auto;
 	 max-width:50px;
 	 max-height:50px;
}
.unMarked {
	
    background-color: transparent;
}
.marked {
    background-color: #ffcc00;
}

</style>
<link rel="stylesheet" href="/oasis/home/resources/background.css">
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
			<div class = "userAvatar">
			<img src="" alt="使用者頭像" id = "firstUser">
			</div>
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
				<div id="artContent" class="artContent">
				<div id="markContainer" class="unmarked">
        		<img id="markImage" src="${pageContext.servletContext.contextPath}/forum/image/favor.png" alt="收藏">
    			</div>
				</div>
			</div>
			<div id="commentContainer" class="commentContainer">
				<div id="comment" class="comment"></div>
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
  
  let artFirstId = getUrlParameter('art');
  if (!artFirstId) {
    artFirstId = '<%=request.getAttribute("artId")%>';
  }
  
  let messageTimestamp = getCurrentTimestamp();
  
  $(document).ready(function () {
    $.ajax({
      url: "/oasis/art",
      type: "POST",
      data: {
        act: "getFirstArt",
        artId: artFirstId
      },
      dataType: "json",
      success: function (data) {
    	$('#firstUser').attr('src', data.userAvatar);
        $("#userNickname").append(data.userNickname);
        $("#artTitle").append(data.artTitle);
        $("#artContent").append(data.artContent);
        $('input[name="artTitle"]').val(data.artTitle);
        $('input[name="artReplyId"]').val(artFirstId);
        $.each(
            data.messageDTO,function (index,message) {
              let comment =
            	  '<div class ="oneMessage" >'
            	+ '<div class="message">' 
            	+ '<div class="messageTop">'
                + '<span class = "messageUser">' + message.userNickname + '</span>'
                + '<span class = "messageContent">' + message.messageContent + '</span>'
                + '</div>'
                + '<div>'
                + '<div class = "messageTimestamp">' + message.messageTimestamp + '</div>'
                + '</div>'
                + '</div>'
                + '</div>';
              $("#comment").prepend(comment);});
       			let input = '<form id="messageForm" action="<%=request.getContextPath()%>/post " method="POST" >' 
        		+ '<input type=text class = "message" name="messageContent" required placeholder="留言...">'
        		+ '<input type=hidden name= "artFirstId" value="' + artFirstId + '" >'
        		+ '<input type=hidden name= "artId" value="' + artFirstId + '" >'
        		+ '<input type=hidden name= "userId" value="'+ ${sessionScope.user.userId} + '" >'
        		+ '<input type=hidden name= "messageTimestamp" value="' + messageTimestamp + '" >'
        		+ '<input type=hidden name= "act" value="addMessage" >'
        		+ '<button class="messageBtn" type = "submit">留言</button>'
        		+ '</div>'
        		+ '</form>';
        $("#commentContainer").append(input);}
      	
      ,
      error: function (xhr, status, error) {
        console.error(
          'AJAX request failed:',
          error);
      },
      
    });

    $.ajax({
        url: "/oasis/art",
        type: "POST",
        data: {
          act: "getReply",
          artId: artFirstId
        },
        dataType: "json",
        success: function (data) {
			console.log(data);
          $.each(data,function (index, art) {
                let artReply = '<div class="artContainer">'
                  + '<aside class="user">'
                  + '<div class = "userAvatar">'
                  + '<img src="' + (art.userAvatar ? art.userAvatar : '/oasis/forum/image/altImg.png') + '" alt="使用者頭像">'
                  + '</div>'
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
                      let comment =
                    	  '<div class ="oneMessage" >'
                    	+ '<div class="messageTop">'
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
                        + '</div>'
                        + '</div>';
                      $('#comment'+ index)
                        .append(comment);
                    });
                let input = '<form id="messageForm" action="<%=request.getContextPath()%>/post " method="POST" >' 
            		+ '<input type=text class = "message" name="messageContent" required placeholder="留言...">'
            		+ '<input type=hidden name= "artFirstId" value="' + artFirstId + '" >'
            		+ '<input type=hidden name= "artId" value="' + art.artId + '" >'
            		+ '<input type=hidden name= "userId" value="'+ ${sessionScope.user.userId} + '" >'
            		+ '<input type=hidden name= "messageTimestamp" value="' + messageTimestamp + '" >'
            		+ '<input type=hidden name= "act" value="addMessage" >'
            		+ '<button class="messageBtn" type = "submit">留言</button>'
            		+ '</div>'
            		+ '</form>';
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
  $(document).ready(function () {
	  const container = document.getElementById("markContainer");
	  let userId = ${empty sessionScope.user.userId ? "null":sessionScope.user.userId};
	  if (userId === null){
		 document.getElementById('markContainer').style.display = 'none';
	  }
	  $.ajax({
          url: "/oasis/art",
          type: "POST",
          data: {act:"getFavorStatus",
        	  artId: artFirstId,
        	  userId: userId
          },
          dataType: "json",
          success: function(data) {
        	  console.log(data);
              if(data == 0){
            	  container.classList.remove("unmarked");
    	            container.classList.add("marked");
              }else{
            	  container.classList.remove("marked");
  	            container.classList.add("unmarked");
              }
          },
          error: function(xhr, status, error) {
              console.error("請求失敗", status, error);
          }
      });
  })
  $(document).ready(function () {
	  const container = document.getElementById("markContainer");
	  let userId = ${empty sessionScope.user.userId ? "null":sessionScope.user.userId};
	  if (userId === null){
		 document.getElementById('markContainer').style.display = 'none';
	  }
	    container.addEventListener("click", function() {
	        
	        const isMarked = container.classList.contains("marked");

	        let favorTimestamp = getCurrentTimestamp();
	        if (isMarked) {
	        	
	            container.classList.remove("marked");
	            container.classList.add("unmarked");
	            let data = {
	            	act:"deleteFavor",
	            	artId:artFirstId,
	            	userId:userId
	            };
	            sendAjaxRequest("/oasis/post", data);
	        } else {
	        	container.classList.remove("unmarked");
	            container.classList.add("marked");
	            let data = {
	            	act:"addFavor",
	            	artId:artFirstId,
	            	userId:userId,
	            	favorTimestamp : favorTimestamp
	            }
	            sendAjaxRequest("/oasis/post",  data );
	        }
	    });
	    function sendAjaxRequest(url, data) {
	        $.ajax({
	            url: url,
	            type: "POST",
	            data: data,
	            dataType: "text",
	            success: function(response) {
	                console.log("請求成功");
	            },
	            error: function(xhr, status, error) {
	                console.error("請求失敗", status, error);
	            }
	        });
	    }
  })
</script>
</body>
</html>
	
										