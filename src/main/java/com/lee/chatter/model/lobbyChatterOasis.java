package com.lee.chatter.model;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/lobbyChatterOasis/{userName}")
public class lobbyChatterOasis {
	
	private static final Set<Session> connectedSessions=Collections.synchronizedSet(new HashSet<>());
	//把收集到的Session做收集(onOpen):像是線上所有使用者 把這個Session的Set做同步安全
	
	
	@OnOpen
	public void onOpen(@PathParam("userName")String userName,Session userSession) {
		connectedSessions.add(userSession);//把建立的Session收集起來,管理所有已建立的WebSocket連接
		
		//打印連接過來的Session的ID和用戶名
		String text = String.format("Session ID = %s, connected; userName = %s", userSession.getId(), userName);
		System.out.println(text);
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
	}
	
	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}
	
}

