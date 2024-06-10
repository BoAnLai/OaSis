package com.lee.chatter.model;


import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.lee.waiting.model.WaitingService;
import com.lee.waiting.model.WaitingVO;




@ServerEndpoint("/lobbyChatterOasis/{userName}/{userId}")
public class lobbyChatterOasis {
	
	private static final Set<Session> connectedSessions=Collections.synchronizedSet(new HashSet<>());
	//把收集到的Session做收集(onOpen):像是線上所有使用者 把這個Session的Set做同步安全
	
	// 一對一步步需要每個都發送訊息 所以用Map</*使用者名稱,使用者的session*/>//以下為更新使用者列表
	private static final Map<String, Session> sessionsMap = new ConcurrentHashMap<>();// ConcurrentHashMap:並行集合()
	
	private static ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
	private static final Gson gson = new Gson();
	
	private static boolean isSchedulerRunning = false;
	
	@OnOpen
	public void onOpen(@PathParam("userName")String userName,@PathParam("userId")Integer userId,Session userSession) {
			
		
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
		
		if (!isSchedulerRunning) { 
		startScheduler(userId);//啟動推播
		isSchedulerRunning = true;
		 }
	        
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
	
    	
	

	public void startScheduler(Integer userId) {
	    scheduler.scheduleWithFixedDelay(() -> {
	        LocalDateTime now = LocalDateTime.now().withSecond(0).withNano(0); // 忽略秒和毫秒級別的差異
	        System.out.println("Current time: " + now); // 打印当前时间

	        List<Timestamp> waitingReserves = getWaitingReserves(userId); // 抓到所在房间的所有时间
	        System.out.println("需要检查的时间表-----" + waitingReserves);

	        for (Timestamp ti : waitingReserves) {
	            LocalDateTime reserveTime = ti.toLocalDateTime().withSecond(0).withNano(0); // 忽略秒和毫秒級別的差異
	            System.out.println("Comparing with: " + reserveTime); // 打印比較的時間

	            // 使用ChronoField.EPOCH_DAY比較器來比較日期部分
	            if (now.getLong(ChronoField.SECOND_OF_DAY) == reserveTime.getLong(ChronoField.SECOND_OF_DAY)) {
	                sendMessageToAllSessions("MATCH", now.format(DateTimeFormatter.ofPattern("MM-dd HH:mm:ss")));
	            } else {
	                System.out.println("NO_MATCH!");
	            }
	        }
	    }, 0, 30, TimeUnit.SECONDS); // 每秒檢查一次
	}




	
	 		private List<Timestamp> getWaitingReserves(Integer userId) {
	         	
		 	
	        WaitingService waiSVC=new WaitingService();
	        List<WaitingVO> wList = waiSVC.getInRoom(userId);
	        
	        List<Timestamp> reserves = new ArrayList<>();
	        for (WaitingVO waitingVO : wList) {
	        	reserves.add(waitingVO.getWaitingReserve());
	        }
	        return reserves;
	        
	    }
	 
	 		private void sendMessageToAllSessions(String messageType, String timestamp) {
	 		    Matchmessage matchMessage = new Matchmessage(messageType, timestamp);
	 		    String jsonMessage = new Gson().toJson(matchMessage);
	 		    for (Session session : connectedSessions) {
	 		        if (session.isOpen()) {
	 		            session.getAsyncRemote().sendText(jsonMessage);
	 		            System.out.println("推播內容-----" + jsonMessage);
	 		        }
	 		    }
	 		}

	
}

