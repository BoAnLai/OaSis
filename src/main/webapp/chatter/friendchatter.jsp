<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="chatter/css/friendchat.css" type="text/css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">

<title>LobbyChatter</title>
<link rel="stylesheet" href="/oasis/home/resources/background.css">
</head>

<body onload="connectPrivate();" onunload="disconnectPrivate();">
	
	<div id="row" style="height:50px; display: flex; flex-direction: column;"></div><!-- 動態生成使用者的列表 -->

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="statusOutput">Modal title</h1>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
      <div class="modal-body">
        <!-- ////////////////////////////////////////////////////////////////////////////// -->	
		<div id="messagesArea" class="panel message-area" style="height:400px;width:450px;margin:0px;"></div>
		<div class="panel input-area" style="width:450px;margin:0px;" >
	    <input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" /> 
	    <input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" /> 
	    <input type="button" id="connectPrivate" class="button" value="ConnectPrivate" onclick="connectPrivate();" /> 
	    <input type="button" id="disconnectPrivate" class="button" value="DisconnectPrivate" onclick="disconnectPrivate();" />
		</div>
        <!-- ////////////////////////////////////////////////////////////////////////////// -->
      </div>
   
    </div>
  </div>
</div>

</body>
<script>

	var MyPoint = "/FriendChatterOasis/${user.getUserNickname()}";//這邊是要帶給後端的 "Java類別/接收到並要傳給後端的資料"
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
	
	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${user.getUserNickname()}';
	var webSocket;
	var currentTime = ""; // 定义一个变量来存储当前时间
	
	function connectPrivate() {
		// create a websocket
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			
			document.getElementById('sendMessage').disabled = false;
			document.getElementById('connectPrivate').disabled = true;
			document.getElementById('disconnectPrivate').disabled = false;
		};

		webSocket.onmessage = function(event/*透過這個事件的屬性取得*/) {
			var jsonObj = JSON.parse(event.data/*後端傳來的Json字串,並丟會給jsonObj*/);
			if ("open" === jsonObj.type) {
				refreshFriendList(jsonObj);//傳給refreshFriendList這個function
			} else if ("history" === jsonObj.type) { // 拿到是歷史聊天紀錄的請求
			    messagesArea.innerHTML = ''; // 動態的把訊息加入到畫面上
			    var ul = document.createElement('ul'); // 每個訊息都是在ul下的li
			    ul.id = "area";
			    messagesArea.appendChild(ul);

			    // 這行的jsonObj.message是從redis撈出跟好友的歷史訊息，再parse成JSON格式處理
			    var messages = JSON.parse(jsonObj.message);
			    for (var i = 0; i < messages.length; i++) {
			        var historyData = JSON.parse(messages[i]);
			        var showMsg = historyData.message;

			        // 创建包含时间和消息内容的 <li> 元素
			        var li = document.createElement('li');

			        // 根據發送者是自己還是對方來給予不同的class名, 以達到訊息左右區分
			        historyData.sender === self ? li.className += 'me' : li.className += 'friend'; // 根据class再去写css，訊息左边或右边

			        // 创建消息内容段落 <p> 元素并设置样式
			        var messageParagraph = document.createElement('p');
			        messageParagraph.textContent = showMsg;
			        messageParagraph.style.display = 'inline'; // 设置为inline使其与时间在同一行

			        // 创建时间段落 <span> 元素并设置样式
			        var timeParagraph = document.createElement('span');
			        timeParagraph.className = 'custom-paragraph';
			        timeParagraph.textContent = " " + historyData.time; // 在时间前添加空格以便与消息内容分开

			        // 将时间段落作为消息内容段落的一部分
			        messageParagraph.appendChild(timeParagraph);
			        li.appendChild(messageParagraph); // 添加消息内容段落

			        // 将 <li> 元素添加到 <ul> 中
			        ul.appendChild(li);
			    }
			    messagesArea.scrollTop = messagesArea.scrollHeight;
			}
			else if ("chat" === jsonObj.type) {
			    // 创建包含消息内容和时间的 <li> 元素
			    var li = document.createElement('li');

			    // 根据发送者是自己还是对方来给予不同的class名，以达到消息左右区分
			    if (jsonObj.sender === self) {
			        li.className = 'me';
			    } else {
			        li.className = 'friend';
			    }

			    // 创建消息内容段落 <p> 元素并设置样式
			    var messageParagraph = document.createElement('p');
			    messageParagraph.textContent = jsonObj.message;
			    messageParagraph.style.display = 'inline'; // 设置为inline使其与时间在同一行

			    // 创建时间段落 <p> 元素并设置样式
			    var timeParagraph = document.createElement('span'); // 使用 <span> 元素以便于行内显示
			    timeParagraph.className = 'custom-paragraph';
			    timeParagraph.textContent = " " + jsonObj.time; // 在时间前添加空格以便与消息内容分开

			    // 将消息内容段落和时间段落添加到 <li> 元素
			    messageParagraph.appendChild(timeParagraph); // 将时间段落作为消息内容段落的一部分
			    li.appendChild(messageParagraph); // 添加消息内容段落

			    // 将 <li> 元素添加到 <ul> 中
			    document.getElementById("area").appendChild(li);

			    // 滚动到最底部以显示最新消息
			    messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("close" === jsonObj.type) {
				refreshFriendList(jsonObj);
			}
			
		};

		webSocket.onclose = function(event) {
			 console.log("WebSocket connection closed: ", event);
		};
	}
	
	////////////////////////////////////當前時間////////////
	function displayCurrentTime() {
        // 创建一个新的 Date 对象
        var now = new Date();
        
        // 获取小时和分钟
        var hours = now.getHours();
        var minutes = now.getMinutes();
        

        // 格式化小时和分钟，使其总是两位数
        hours = hours < 10 ? '0' + hours : hours;
        minutes = minutes < 10 ? '0' + minutes : minutes;
        

        // 拼接成 "时:分:秒" 格式
        currentTime = hours + ':' + minutes;

        // 每秒更新一次时间
        setTimeout(displayCurrentTime, 60000);
    }
	
	displayCurrentTime()//初始化當前時間
	
	////////////////////////////////////當前時間////////////
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else if (friend === "") {
			alert("Choose a friend");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender" : self,
				"receiver" : friend,
				"message" : message,
				"time":currentTime
				
			};
			webSocket.send(JSON.stringify(jsonObj));
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	// 有好友上線或離線就更新列表
	function refreshFriendList(jsonObj) {
		var friends = jsonObj.users;
		var row = document.getElementById("row");
		row.innerHTML = '';
		for (var i = 0; i < friends.length; i++) {
			if (friends[i] === self) { continue; /*self 是自己的名字，不出現*/}
			row.innerHTML +='<div id=' + i + ' class="column" style="border: 1px solid black; border-radius: 10px; background-color:#FFED97;padding:0px; " name="friendName" value=' + friends[i] + ' ><h2 data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color:#FFED97;">' + friends[i] + '</h2 ></div>';
		}
		addListener();//以下方法 點選使用者後的事件
	}
	// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
	function addListener() {
		var container = document.getElementById("row");
		container.addEventListener("click", function(e) {
			var friend = e.srcElement.textContent;//這邊的語法不一定會依樣，要去抓自己前端標籤的結構
			updateFriendName(friend);
			var jsonObj = {//json 開始發送資料給後端要歷史紀錄
					"type" : "history",
					"sender" : self,/*自己*/
					"receiver" : friend,/*點選到的對象*/
					"message" : ""
				};
			webSocket.send(JSON.stringify(jsonObj));//發送給後端的onmessage
		});
	}
	
	function disconnectPrivate() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
		document.getElementById('connectprivate').disabled = false;
		document.getElementById('disconnectPrivate').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
	
	
	
	
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</html>