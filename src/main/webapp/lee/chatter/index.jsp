<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>OASIS 大廳</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="css/styles.css" type="text/css" />


<style>

	
</style>



</head>
<body onload="connect();" onunload="disconnect();">
	<h1>聊天大廳OASISTEST</h1>
	<h3 id="statusOutput" class="statusOutput"></h3><!-- 可讓連線狀態改變這邊的文字說明 -->
	<textarea id="messagesArea" class="panel message-area" readonly style="height:300px;width:550px;"></textarea><!-- textarea 可以顯示和接受多行輸入 -->
	
	<div class="panel input-area">
		<input id="userName" class="text-field" type="text" placeholder="User name" />
		<input id="message" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) sendMessage();" /><!-- Enter也可以發送 -->
		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" /> <!-- 當點擊按鈕時觸發sendMessage()功能 -->
		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" /> 
		<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" />
	</div>
</body>

	<script>
	
		let MyPoint = "/lobbyChatterOasis/james";
	
		let host=window.location.host;//8081
		
		let path=window.location.pathname;//TIA10116-WebApp/lee/webSocket/index.jsp
		
		let webCtx=path.substring(0,path.indexOf('/',1));//WebApp
		console.log(webCtx);
		
		let endPointURL= "ws://" + window.location.host+webCtx+MyPoint;
		console.log(endPointURL);
	//======================================js動態取得專案路徑===============================
		
		var statusOutput = document.getElementById("statusOutput");
		var webSocket;
		
		function connect(){
			webSocket =new WebSocket(endPointURL);
			
			webSocket.onopen=function(event){
				updateStatus("OASIS Chatter Connected");
				document.getElementById('sendMessage').disabled=false;
				document.getElementById('connect').disabled=true;//disabled:禁用
				document.getElementById('disconnect').disabled=false;
			};
			
			webSocket.onmessage = function(event) {//onmessage:當前端收到資料時:執行裡面的function
				var messagesArea = document.getElementById("messagesArea");//當後端執行onMessage時，這邊會啟動此方法來做接收
				var jsonObj = JSON.parse(event.data);//用data即可拿到後端方來的資料了
				var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";//要做換行 訊息才會一行一行往下
				messagesArea.value = messagesArea.value + message;
				messagesArea.scrollTop = messagesArea.scrollHeight;//若有新的訊息發送，卷軸自動滑到最底部，可以不加
			};

			webSocket.onclose = function(event) {
				updateStatus("OASIS Chatter Disconnected");
			};
		}
		
		
		var inputUserName = document.getElementById("userName");
		inputUserName.focus();//將瀏覽器的焦點設置到這個輸入框上。進入頁面可直接輸入，不用選取要輸入的地方
		
		function sendMessage(){
			let userName=inputUserName.value.trim();//對使用者的輸入方塊，取值
			if(userName === ""){
				alert("請填寫使用者暱稱");
				inputUserName.focus();
				return;	
			}
			
			let inputMessage=document.getElementById("message");
			let message = inputMessage.value.trim();//訊息資料抓取
			
			if(message === ""){//簡單的部份我們可以在前端做驗證
				alert("Input a message");
				inputMessage.focus();
			}else{
				//用json做前後端資料格式的交換
				let jsonObj={//針對上面的使用者及訊息  包裝成一個JSON Object
						"userName":userName,
						"message" : message
				};
				webSocket.send(JSON.stringify(jsonObj));
			//使用 JSON.stringify 方法將 jsonObj 序列化為一個JSON字符串。這是因為WebSocket的 send 方法只能發送字符串數據。
			//send這邊 後端會到接收資料的部分了@OnMessage
			
				inputMessage.value="";
				inputMessage.focus();
			}
			
			//===========================================================
		
		}
		
		function disconnect() {
			webSocket.close();
			document.getElementById('sendMessage').disabled = true;
			document.getElementById('connect').disabled = false;
			document.getElementById('disconnect').disabled = true;
		}
		
		
		function updateStatus(newStatus){
			statusOutput.innerHTML=newStatus;
		}
	
	</script>
</html>