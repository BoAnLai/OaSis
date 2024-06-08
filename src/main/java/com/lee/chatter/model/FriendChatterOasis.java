package com.lee.chatter.model;



import java.util.Collection;
import java.util.Date;
import java.util.List;
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
import com.lee.chatter.controller.JedisHandleMessage;



@ServerEndpoint("/FriendChatterOasis/{userName}")
public class FriendChatterOasis {

	// 一對一步步需要每個都發送訊息 所以用Map</*使用者名稱,使用者的session*/>
	private static Map<String, Session> sessionsMap = new ConcurrentHashMap<>();// ConcurrentHashMap:並行集合()
	Gson gson = new Gson();
	Date now = new Date();
	
	
	
	@OnOpen
	public void onOpen(@PathParam("userName") String userName, Session userSession) {
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
		
	}
	
	@OnMessage
	public void onMessage(Session userSession, String message/*Json字串*/) {
		ChatMessage/*這個也是自己設計的DTO*/ chatMessage = gson.fromJson/*用此方法*/(message/*依據此Json字串*/, ChatMessage.class/*針對內容去參照ChatMessage這個DTO*/);
		String sender = chatMessage.getSender();
		String receiver = chatMessage.getReceiver();
		String time=chatMessage.getTime();
		
		
		
		if ("history".equals(chatMessage.getType())) {//過濾是否是要歷史紀錄
			System.out.println("有收到查詢歷史紀錄"+userSession+message);
			List<String> historyData =JedisHandleMessage.getHistoryMsg(sender, receiver);//透過此方法，對Redis做歷史紀錄的查詢
			String historyMsg = gson.toJson(historyData);//轉成JsonArray 準備給前端
			ChatMessage cmHistory = new ChatMessage/*再把此JSON字串放入DTO裡面*/("history", sender, receiver, historyMsg,time);
			if (userSession != null && userSession.isOpen()) {
				userSession.getAsyncRemote().sendText(gson.toJson(cmHistory));//再發送給前端onmessage
				System.out.println("history = " + gson.toJson(cmHistory));
				return;
			}
		}
		
		
		
		//一對一訊息的聊天部分
		Session receiverSession = sessionsMap.get(receiver);//從Map拿出接收者的session
		if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(message);//對方與自己做訊息的發送
			userSession.getAsyncRemote().sendText(message);//再把訊息做redis的儲存
		}
		JedisHandleMessage.saveChatMessage(sender, receiver, message);//不在線上也可以方送並儲存
		System.out.println("Message received: " + message);		
	}
	
	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
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

		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
				reason.getCloseCode().getCode(), userNames);
		System.out.println(text);
	}

}
