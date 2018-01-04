package net.sns.controller;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import net.cookie.controller.CookieAction;
import net.sns.model.SNSDAO;
import net.sns.model.SNSDTO;


@ServerEndpoint("/forwardLikeCount")
public class SNSForwardLikeCount {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage 
	public void onMessage(String message, Session session) throws IOException { 
		
		System.out.println("message : " + message); 
		String result = "";
		
		String[] messageArr = message.split("#%&@#");
		String idxS = messageArr[0];
		int value = Integer.parseInt(messageArr[1]);
		String how = messageArr[2].trim();
		
		if (how.equals("plus")){
			value++;
		} else if (how.equals("minus")){
			value--;
		}
		
		result = idxS + "#%&@#" + String.valueOf(value);
		
		synchronized (clients) { 
			// Iterate over the connected sessions 
			// and broadcast the received message 
			for (Session client : clients) {
/*				
				System.out.println("=====================================");
				System.out.println("client : " + client);
				System.out.println("client.getId() : " + client.getId());
				System.out.println("session : " + session);
				System.out.println("client.getBasicRemote() : " + client.getBasicRemote());
				System.out.println("=====================================");
				*/
				// for문 밖에서 friends list 얻어와서  친구들 한테만 보낼수 있게끔
				client.getBasicRemote().sendText(result);

				// 본인이외에 다른 사람들한테 메세지 노출
/*				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
				*/
				
			}
		}
	}
	
	
	@OnOpen 
	public void onOpen(Session session) {
		// Add session to the connected sessions set 
		System.out.println(session); 
		clients.add(session); 
	} 
	
	
	@OnClose 
	public void onClose(Session session) { 
		// Remove session from the connected sessions set 
		clients.remove(session); 
	} 

}
