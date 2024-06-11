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
	        background-color:#00BB00;
	        word-wrap: break-word;
	        border-radius: 10px; /* 新增這行來增加圓角 */
	       
	    }  
   
        h2 {
            margin: 0;
            margin-right: 10px; /* 可选，调整 h2 和按钮之间的间距 */
        } 
        
/* 设置消息列表的基本样式 */
#area {
    list-style-type: none;
    padding: 0;
    margin: 0;
}

#area li {
    margin: 10px 0;
    clear: both;
}

/* 设置发送者消息样式 */
.me {
    float: right;
    background-color: #daf1da;
    border-radius: 15px;
    padding: 10px;
    max-width: 70%;
    word-wrap: break-word;
    display: flex;
    justify-content: flex-end;
    align-items: center;
}

/* 设置接收者消息样式 */
.friend {
    float: left;
    background-color: #f1f0f0;
    border-radius: 15px;
    padding: 10px;
    max-width: 70%;
    word-wrap: break-word;
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

/* 设置消息文本样式 */
.me p, .friend p {
    margin: 0;
    display: inline;
}

/* 设置时间戳样式 */
.custom-paragraph {
    font-size: 0.8em;
    color: #888;
    margin-left: 10px;
}
        
        
        
        
        
        
        
        
       
 
</style>


</head>


<body onload="connect();" onunload="disconnect();">
	
	
	<div class="container">
    <button id="statusOutput" class="btn btn-outline-danger" type="button"></button>
</div>

<div style="display: flex; height: 500px; width: 100%;">
    <div id="messagesArea" class="panel message-area" style="flex: 1; overflow-y: auto; background-color: #fff; border: 1px solid #ccc; padding: 10px;"></div>
    <div id="row" style="width: 200px; display: flex; flex-direction: column; overflow-y: auto; background-color: #f9f9f9; border: 1px solid #ccc; padding: 10px;"></div>
</div>

<div class="panel-input-area">
    <input id="message" class="form-control" placeholder="Please enter a message here..." onkeydown="if (event.keyCode == 13) sendMessage();" style="height: 30px; width: 300px;" />
    <input type="submit" id="sendMessage" class="button" value="Send" onclick="sendMessage();" />
    <input type="button" id="connect" class="button" value="Connect" onclick="connect();" />
    <input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" />
</div>



<!-- 小視窗畫面 -->
<div class="modal fade" id="Private" tabindex="-1" aria-labelledby="PrivateLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="PrivateLabel">Modal title</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!---------------------------------------------- 對話窗內容! ------------------------------------------------>
                <div id="PsmessagesArea" class="panel message-area" style="border:1px solid #00EC00; height:400px; width:450px; margin:0px; overflow-y: auto;"></div>
					<div class="panel input-area" style="width:450px;margin:0px;" >													
				    <input id="Psmessage" class="text-field" type="text" placeholder="Message" onkeydown="if (event.keyCode == 13) PrivatesendMessage();" /> 
				    <input type="submit" id="PSsendMessage" class="button" value="Send" onclick="PrivatesendMessage();" /> 
				  
					</div>
                <!---------------------------------------------- 對話窗內容! ------------------------------------------------>
               
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
	
</body>

	<script>
	
	function showPrivateModal() {
        var myModal = new bootstrap.Modal(document.getElementById('Private'), {
            backdrop: false, // 禁用黑暗背景
            keyboard: false
        });
        myModal.show();
    }
	
		
	
		let MyPoint = "/lobbyChatterOasis/${user.getUserNickname()}/${user.getUserId()}";
	
		let host=window.location.host;//8081
		
		let path=window.location.pathname;//TIA10116-WebApp/lee/webSocket/index.jsp
		
		let webCtx=path.substring(0,path.indexOf('/',1));//WebApp
		
		
		let endPointURL= "ws://" + window.location.host+webCtx+MyPoint;
		console.log(endPointURL);
	//======================================以上為Socket 1 js動態取得專案路徑===============================
		
		
		let PsPoint = "/FriendChatterOasis/${user.getUserNickname()}";//這邊是要帶給後端的 "Java類別/接收到並要傳給後端的資料"
		
		
		
		var PsendPointURL = "ws://" + window.location.host + webCtx + PsPoint;
		console.log(PsendPointURL);
		
		
	//======================================以上為Socket 2 js動態取得專案路徑===============================
		
		var statusOutput = document.getElementById("statusOutput");
		var webSocket;
		var self = '${user.getUserNickname()}';
		var psName = document.getElementById("PrivateLabel");
		var PsmessagesArea = document.getElementById("PsmessagesArea");
		var PswebSocket;
		
		function connect(){
			webSocket =new WebSocket(endPointURL);//---建立大眾聊天
			PswebSocket = new WebSocket(PsendPointURL);//私人聊天連線建立
			
			webSocket.onopen=function(event){
				updateStatus("OASIS Chatter Connected","btn btn-outline-success");
				document.getElementById('sendMessage').disabled=false;
				document.getElementById('connect').disabled=true;//disabled:禁用
				document.getElementById('disconnect').disabled=false;
			};
			
			webSocket.onmessage = function(event) {
			    var messagesArea = document.getElementById("messagesArea");
			    var jsonObj = JSON.parse(event.data);
			    var message = jsonObj.userName + ": " + jsonObj.message;
					
			    if(jsonObj.message!=undefined){
			    	
			    // 創建新訊息的 div
			    var messageDiv = document.createElement("div");
			    messageDiv.className = "message-box";
			    messageDiv.innerText = message;

			    // 添加新訊息到訊息區域
			    messagesArea.appendChild(messageDiv);
			    messagesArea.scrollTop = messagesArea.scrollHeight; // 有新訊息自動滑到最下方
			    }
			    
			    
			    if ("open" === jsonObj.type) {
					refreshFriendList(jsonObj);//傳給refreshFriendList這個function
				}
			    else if ("close" === jsonObj.type) {
	                refreshFriendList(jsonObj);
	            }
			};

			webSocket.onclose = function(event) {
				updateStatus("OASIS Chatter Disconnected","btn btn-outline-danger");
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
		
		
		function sendMessage(){
			let userName="${user.getUserNickname()}";//對使用者的輸入方塊，取值
				
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
			
		}
			//================================================WebSocket 2號
			 function connectPrivate() {
				console.log("Connecting to private chat...");
		        
		
		        PswebSocket.onopen = function(event) {
		        	console.log("Private WebSocket connected");
		            document.getElementById('PSsendMessage').disabled = false;
		        };
		
		        PswebSocket.onmessage = function(event) {
		            var jsonObj = JSON.parse(event.data);

		            if ("history" === jsonObj.type) {
		                PsmessagesArea.innerHTML = '';
		                var Psul = document.createElement('ul');
		                Psul.id = "area";
		                PsmessagesArea.appendChild(Psul);

		                var Psmessages = JSON.parse(jsonObj.message);
		                for (var i = 0; i < Psmessages.length; i++) {
		                    var historyData = JSON.parse(Psmessages[i]);
		                    var showMsg = historyData.message; // 确保这个字段与服务器发送的消息字段名一致

		                    var li = document.createElement('li');
		                    historyData.sender === self ? li.className += 'me' : li.className += 'friend';

		                    var messageParagraph = document.createElement('p');
		                    messageParagraph.textContent = showMsg;
		                    messageParagraph.style.display = 'inline';

		                    var timeParagraph = document.createElement('span');
		                    timeParagraph.className = 'custom-paragraph';
		                    timeParagraph.textContent = " " + historyData.time;

		                    messageParagraph.appendChild(timeParagraph);
		                    li.appendChild(messageParagraph);
		                    Psul.appendChild(li);
		                }
		                PsmessagesArea.scrollTop = PsmessagesArea.scrollHeight;
		            } else if ("chat" === jsonObj.type) {
		                console.log("Socket Number2 Chat.onmessage!");
		                var li = document.createElement('li');
		                if (jsonObj.sender === self) {
		                    li.className = 'me';
		                } else {
		                    li.className = 'friend';
		                }

		                var messageParagraph = document.createElement('p');
		                messageParagraph.textContent = jsonObj.message;
		                messageParagraph.style.display = 'inline';

		                var timeParagraph = document.createElement('span');
		                timeParagraph.className = 'custom-paragraph';
		                timeParagraph.textContent = " " + jsonObj.time;

		                messageParagraph.appendChild(timeParagraph);
		                li.appendChild(messageParagraph);
		                document.getElementById("area").appendChild(li);

		                PsmessagesArea.scrollTop = PsmessagesArea.scrollHeight;
		            } 
		        };
		        
		     		 //二號連線錯誤方法
					 PswebSocket.onerror = function(event) {
				        console.error("WebSocket error observed:", event);
				    	};

				   	 PswebSocket.onclose = function(event) {
				        console.log("Private WebSocket closed");
				   		 };
		        
		    }
			
				
				//================================================WebSocket 2號 送出訊息方法	
				function PrivatesendMessage() {
			    var PsinputMessage = document.getElementById("Psmessage");
			    var friend = psName.textContent;
			    var Psmessage = PsinputMessage.value.trim();
			    console.log("到PrivatesendMessage此了");
			
			    if (Psmessage === "") {
			        alert("Input a message");
			        PsinputMessage.focus();
			    } else if (friend === "") {
			        alert("Choose a friend");
			    } else {
			        var jsonObj = {
			            "type": "chat",
			            "sender": self,
			            "receiver": friend,
			            "message": Psmessage, // Corrected this line
			            "time": currentTime
			        };
			        PswebSocket.send(JSON.stringify(jsonObj)); // Corrected this line
			        PsinputMessage.value = "";
			        PsinputMessage.focus();
			    }
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
		
		// 有好友上線或離線就更新列表
		function refreshFriendList(jsonObj) {
			console.log(jsonObj)
				
			var friends = jsonObj.users;
			var row = document.getElementById("row");
			row.innerHTML = '';
			for (var i = 0; i < friends.length; i++) {
				if (friends[i] === self) { continue; /*self 是自己的名字，不出現*/}
				row.innerHTML +='<div id=' + i + ' class="column" style="border: 1px solid black; border-radius: 10px; background-color:#BB5E00;padding:0px; " name="friendName" value=' + friends[i] + ' ><h2 data-bs-toggle="modal" data-bs-target="#staticBackdrop" style="background-color:#BB5E00;">' + friends[i] + '</h2 ></div>';
			}
			addListener();//以下方法 點選使用者後的事件
			
		}
		
	
		
		// 註冊列表點擊事件並抓取好友名字以取得歷史訊息
		function addListener() {
			var container = document.getElementById("row");
			container.addEventListener("click", function(e) {
				showPrivateModal();
				connectPrivate();
				
				var friend = e.srcElement.textContent;//這邊的語法不一定會依樣，要去抓自己前端標籤的結構
				updateFriendName(friend);
				var jsonObj = {//json 開始發送資料給後端要歷史紀錄
						"type" : "history",
						"sender" : self,/*自己*/
						"receiver" : friend,/*點選到的對象*/
						"message" : ""
					};
				
				if (PswebSocket && PswebSocket.readyState === WebSocket.OPEN) {
		            PswebSocket.send(JSON.stringify(jsonObj));
		        } else {//確認PswebSocket是否連線，有連線即發送
		            console.log("WebSocket is not connected. Current state: " + PswebSocket.readyState);
		        }
			});
		}
		//修改視窗上的好友名子
		function updateFriendName(name) {
			psName.innerHTML = name;
		}
		
	
		
		
		
		
			
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	
</html>