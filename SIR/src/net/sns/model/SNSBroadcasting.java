package net.sns.model;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import net.sns.model.SNSDAO;
import net.sns.model.SNSDTO;


@ServerEndpoint("/broadcasting")
public class SNSBroadcasting {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage 
	public void onMessage(String message, Session session) throws IOException { 
		System.out.println("message : " + message); 
		System.out.println("session : " + session);
		String transMessage = "";
		
		// 글내용 dto 가져와서 뿌려줄것 (일단은 마지막 글의 그림경로 가져올것)
		SNSDAO sdao = new SNSDAO();
		SNSDTO sdto = sdao.getLastPost();
		String imagePath = sdto.getImg();
		String auth = sdto.getAuth();
		Timestamp time = sdto.getTime();
		System.out.println("broadcasting imagePath : " + imagePath);
		transMessage += "<ul>"
					  + "<li class='list-group-item'>"
					  + "<img src='" + imagePath + "' width='200px' height='200px' class='snsimages'>" 
					  + "</li>"
    				  + "<li class='list-group-item'>"
    				  + "글내용> " + message 
    				  + "</li>"
    				  + "<li class='list-group-item'>"
    				  + "글쓴이> " + auth 
    				  + "</li>"   
    				  + "<li class='list-group-item'>"
    				  + "글작성 시작> " + time.toString() 
    				  + "</li>"    				  
    				  + "</ul>";
		
		synchronized (clients) { 
			// Iterate over the connected sessions 
			// and broadcast the received message 
			for (Session client : clients) {
				
				System.out.println("=====================================");
				System.out.println("client : " + client);
				System.out.println("client.getId() : " + client.getId());
				System.out.println("session : " + session);
				System.out.println("client.getBasicRemote() : " + client.getBasicRemote());
				System.out.println("=====================================");
				
				// for문 밖에서 friends list 얻어와서  친구들 한테만 보낼수 있게끔
				client.getBasicRemote().sendText(transMessage);

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
