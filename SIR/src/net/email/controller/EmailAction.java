package net.email.controller;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.email.controller.SMTPAuthenticator;

public class EmailAction {

	public boolean sendEmail(String to, String subject, String content) {

		String from = "social_recruiting@naver.com";
		
		Properties p = new Properties(); // 정보를 담을 객체
		p.put("mail.smtp.host", "smtp.naver.com"); // 네이버 SMTP

		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		// SMTP 서버에 접속하기 위한 정보들
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);

			MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
			msg.setSubject(subject); // 제목
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr); // 보내는 사람
			
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람

			msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
			Transport.send(msg); // 전송
			
			return true;
		} catch (Exception e) {
			System.out.println("sendEmail()메서드에서 에러 : " + e);
			return false;
		}
	}
	
	public boolean sendEmailToCertMethod(String email, String addParam) {
		String subject = 	"반갑습니다. SIR 인증 메일 입니다.";
		String content = 	"아래 링크를 클릭하세요<br/>"
							// + "<a target='_blank' href='http://192.168.4.224:8080/SIR/main.jsp?center=registerOk.jsp" + addParam + "'>인증받기</a><br/>"
							// + "<a target='_blank' href='http://192.168.0.9:8080/SIR/main.jsp?center=registerOk.jsp" + addParam + "'>인증받기</a><br/>"
							+ "<a target='_blank' href='http://localhost:8080/SIR/main.jsp?center=registerOk.jsp" + addParam + "'>인증받기</a><br/>"
							+ "5분 이내에 링크 클릭하세요. <br/>"
							+ "로그인 완료된 창이 실행됩니다.";
		boolean result = sendEmail(email, subject, content);
		return result;
	}
	
	public String getCertCode(HttpServletRequest request, HttpServletResponse response) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 10; i++) { // 10자리 인증코드 생성
			int n = (int)(Math.random() * 10);
			sb.append(n);
		}
		String code = "sir" + sb.toString();

		return code;
	}
	
	// 쿠키값에서 certcode 값 가져오는 logic
	// certCode 가져오는건 value를 비교해서 가져오는게 맞는거 같다. 
	// 메일 두번 연속 보냈을경우 최신 메일의 코드만 유효하게 하려면 sirCertCode라는 이름의 cookie가 있는게 중요한게 아니고
	// 마지막 메일 보낸 인증값이 있어야 되기 때문에
	public String getCertCodeInCookie(Cookie[] cookies, String certcode){

		if (cookies==null){
			return null;
		}
		
		for(Cookie cookie : cookies){
			if(cookie.getValue().equals(certcode)){
				return cookie.getValue();
			}
		}
		return null;
	}
}
