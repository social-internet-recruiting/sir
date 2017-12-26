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


@ServerEndpoint("/forwardComment")
public class SNSForwardComment {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage 
	public void onMessage(String message, Session session) throws IOException { 
		
		System.out.println("message : " + message); 
		System.out.println("session : " + session);
		String result = "";
		
		String[] messageArr = message.split("#%&@#");

		// 글쓸때 시간 정보
		LocalDate date = LocalDate.now();
		LocalTime time = LocalTime.now();
		String dateS = date.toString();
		String timeS = time.toString();
		timeS = timeS.substring(0,timeS.length()-4);
		
		int idx = Integer.parseInt(messageArr[0]);
		String commentAuth = messageArr[1];
		String comment = messageArr[2];
		String realTime = dateS + " " + timeS;
		
		// 실시간으로 add 할수 있는 comment 구문 완성
		SNSGetComment commentAdd = new SNSGetComment();
		result = commentAdd.getComment(commentAuth, comment, realTime);

		// 위에서 완성한 실시간 add 할수 있는 comment db 에 append 식으로 넣어줄것
		SNSDAO sdao = new SNSDAO();
		sdao.addCommentsInPost(idx, result);
		
		// idx 붙여서 보내줘야지 id를 찾아서 append 해준다. // DB 넣은후에 result 수정해서 보낼것
		result += "#%&@#" + idx;
		
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
