package com.lee.chatter.model;


import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;




@ServerEndpoint("/lobbyChatterOasis/{userName}")
public class lobbyChatterOasis {
	
	private static final Set<Session> connectedSessions=Collections.synchronizedSet(new HashSet<>());
	//把收集到的Session做收集(onOpen):像是線上所有使用者 把這個Session的Set做同步安全
	
	// 一對一步步需要每個都發送訊息 所以用Map</*使用者名稱,使用者的session*/>//以下為更新使用者列表
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();// ConcurrentHashMap:並行集合()
	Gson gson = new Gson();
	@OnOpen
	public void onOpen(@PathParam("userName")String userName,Session userSession) {
		
		connectedSessions.add(userSession);//把建立的Session收集起來,管理所有已建立的WebSocket連接	
		//打印連接過來的Session的ID和用戶名
		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
		System.out.println(text);
		
		//以下為更新使用者列表
		sessionsMap.put(userName, userSession);// 只要有人連近來，就把他的使用者名稱、Session存起來

		Set<String> userNames = sessionsMap.keySet();// 把使用者上線的使用者名稱全部拿出來，包裝成一個Set
		StateDTO stateMessage = new StateDTO("open", userName, userNames);
		String stateMessageJson = gson.toJson(stateMessage);// 把資料丟給Gson推送出去,不用JSONObject,JSONArray呼叫物件，即回傳一個字串

		Collection<Session> sessions=sessionsMap.values();//取得所有的Session做一個發送的動作
		for (Session session : sessions) {
			if (session.isOpen()) {
				session.getAsyncRemote().sendText(stateMessageJson);//後端送給前端socket的onmessage
			}
		}
		//以上為更新使用者列表
	}
	
	
	@OnMessage
	public void onMessage(Session usersession,String message) {
		for(Session session:connectedSessions) {//這邊會裝著聊天是所有的使用者
			if(session.isOpen())//因為是大眾聊天室，所以我們需要對所有使用者發送一樣的訊息
				session.getAsyncRemote().sendText(message);
			//getAsyncRemote() 允许你异步发送消息，不会阻塞当前线程。这对于需要高并发处理的WebSocket服务器非常有用。
		};
		System.out.println("訊息內容:"+message);		
		
	}
			
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		connectedSessions.remove(userSession);
		String text = String.format("session ID = %s, disconnected; close code = %d; reason phrase = %s",
				userSession.getId(), reason.getCloseCode().getCode(), reason.getReasonPhrase());
		System.out.println(text);
		

		String userNameClose = null;
		Set<String> userNames = sessionsMap.keySet();
		for (String userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				userNameClose = userName;
				sessionsMap.remove(userName);
				break;
			}
		}

		if (userNameClose != null) {
			StateDTO stateMessage = new StateDTO("close", userNameClose, userNames);
			String stateMessageJson = gson.toJson(stateMessage);//把要轉傳的資料丟進來，變成GSON物件(String)
			Collection<Session> sessions = sessionsMap.values();
			for (Session session : sessions) {
				session.getAsyncRemote().sendText(stateMessageJson);//若是要對方不在線上也能發送訊息，把此行拉出去即可
			}
		}

	}

	
	
	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}
	
}

