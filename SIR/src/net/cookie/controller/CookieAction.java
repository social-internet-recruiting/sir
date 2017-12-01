package net.cookie.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieAction {
	
	// controller 만들게 되면 email, certcode 값을 request.setAttribute 등의 방법등으로 넘겨줘야 될거같은데
	// 이게 더 귀찮을거 같다. setAttribute가 넘어오는거 확인하니깐 안넘어 온다. 
	// controller에서 값 받고 싶으면 location.href="~~~?email=" + email 이런식으로 넘겨야 됨 
	
	public void saveCertCode(HttpServletRequest request, HttpServletResponse response, String certcode){
		// 회원가입 전 인증코드 받을때 사용
		Cookie certCodeCookie = new Cookie("sirCertCode", certcode);
		certCodeCookie.setMaxAge(60*5); 	// 5분 유지
		response.addCookie(certCodeCookie); 	

	}
	
	public void saveEmailId(HttpServletRequest request, HttpServletResponse response, String emailId){
		// login, 회원가입시 사용
		Cookie emailIdCookie = new Cookie("sirEmailId", emailId);
		emailIdCookie.setMaxAge(60*60*24*365); // 1년간 유지
		response.addCookie(emailIdCookie);

	}
	
	public void removeEmailId(HttpServletRequest request, HttpServletResponse response, String emailId){
		// logout, 회원 탈퇴등에 사용
		Cookie removeEmailCookie = new Cookie("sirEmailId", emailId);
		removeEmailCookie.setMaxAge(0); 			// 0초(삭제)
		response.addCookie(removeEmailCookie); 	
	}
	
	// 쿠키값에서 email 값 가져오는 logic
	public String getEmailInCookie(Cookie[] cookies){

		if (cookies==null){
			return null;
		}
		
		for(Cookie cookie : cookies){
/*			System.out.println("getName  " + cookie.getName());
			System.out.println("getComment  " + cookie.getComment());
			System.out.println("getDomain  " + cookie.getDomain());
			System.out.println("getValue  " + cookie.getValue());
*/
			if(cookie.getName().equals("sirEmailId")){
				return cookie.getValue();
			}
		}
		return null;
	}
	
	
}
