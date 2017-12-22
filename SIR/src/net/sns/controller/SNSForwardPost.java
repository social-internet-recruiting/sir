package net.sns.controller;
import java.io.IOException;
import java.sql.Timestamp;
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


@ServerEndpoint("/forwardPost")
public class SNSForwardPost {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage 
	public void onMessage(String message, Session session) throws IOException { 
		
		System.out.println("message : " + message); 
		System.out.println("session : " + session);
		String result = "";
		
		// 글내용 dto 가져와서 뿌려줄것 (본인이 쓴 글의 마지막 경로 - message 앞에 본인 닉 넣어줄것, db 에 넣는거)
		String [] messageArr = message.split("#%&@#");
		String email = messageArr[0].trim();
		message = messageArr[1].trim();
		SNSDAO sdao = new SNSDAO();
		SNSDTO sdto = sdao.getLastPost(email);
		
		// 실시간으로 글쓰면 뿌려주는 로직
		SNSMakePost snsPost = new SNSMakePost();
		result 	+= 	snsPost.getPost(sdto);
		
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
