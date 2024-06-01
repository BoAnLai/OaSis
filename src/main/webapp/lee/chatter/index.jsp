<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>OASIS 大廳</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
<style>
	body{
		background-color:#eee;
	}
	
	.panel-input-area {
	        display: flex;
	        gap: 7px; /* 可选，增加按钮之间的间距 */
	    }
	
	.message-box {
			display: block;
	        border: 1px solid black;
	        padding: 5px;
	        margin-bottom: 5px;
	        background-color:#FFED97;
	        word-wrap: break-word;
	        border-radius: 10px; /* 新增這行來增加圓角 */
	       
	    }  
   
        h2 {
            margin: 0;
            margin-right: 10px; /* 可选，调整 h2 和按钮之间的间距 */
        } 
 
</style>


</head>


<body onload="connect();" onunload="disconnect();">
	
	<div class="container">
	<button id="statusOutput" class="" type="button" class="btn btn-outline-danger"></button>
	</div>
	
	<div id="messagesArea" class="panel message-area" style=" height:500px;width:500px;overflow-y:auto;background-color:#fff;border:1px solid #ccc;padding:10px;"></div><!-- 使用 div 取代 textarea -->	<div class="panel-input-area">	
  		<input id="message" class="form-control" placeholder="Please enter a message here..." onkeydown="if (event.keyCode == 13) sendMessage();" style="height:30px;width:300px"/>  
		<input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" /> <!-- 當點擊按鈕時觸發sendMessage()功能 -->
		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" /> 
		<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" />
	</div>
	
	<div id="row"></div><!-- 動態生成使用者的列表 -->
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
				updateStatus("OASIS Chatter Connected","btn btn-outline-success");
				document.getElementById('sendMessage').disabled=false;
				document.getElementById('connect').disabled=true;//disabled:禁用
				document.getElementById('disconnect').disabled=false;
			};
			
			webSocket.onmessage = function(event) {//onmessage:當前端收到資料時:執行裡面的function
				var messagesArea = document.getElementById("messagesArea");//當後端執行onMessage時，這邊會啟動此方法來做接收
				var jsonObj = JSON.parse(event.data);//用data即可拿到後端方來的資料了
				var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";//要做換行 訊息才會一行一行往下
				
				var messageBox = document.createElement("div");//以下都是做畫面的訊息框框
				messageBox.className = "message-box";
			    messageBox.textContent = message;
			    messagesArea.appendChild(messageBox);
			    messagesArea.scrollTop = messagesArea.scrollHeight;//以上都是做畫面的訊息框框
				
				messagesArea.value = messagesArea.value + message;
				messagesArea.scrollTop = messagesArea.scrollHeight;//若有新的訊息發送，卷軸自動滑到最底部，可以不加
			};

			webSocket.onclose = function(event) {
				updateStatus("OASIS Chatter Disconnected","btn btn-outline-danger");
			};
		}
		
		
		function sendMessage(){
			let userName="使用者一號";//對使用者的輸入方塊，取值
			
			
			let inputMessage=document.getElementById("message");
			let message = inputMessage.value.trim();//訊息資料抓取
			
			if(message === ""){//簡單的部份我們可以在前端做驗證
				alert("Input a message");
				inputMessage.focus();
			}else{
				//用json做前後端資料格式的交換
				let jsonObj={//針對上面的使用者及訊息  包裝成一個JSON Object
						"userName": userName,
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
		
		
		function updateStatus(newStatus,type){
			statusOutput.innerHTML=newStatus;
			statusOutput.className = type;
		}
			
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
</html>