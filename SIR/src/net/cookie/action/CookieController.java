package net.cookie.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");		

		String RequestURI=request.getRequestURI();
		//System.out.println(RequestURI);
		String contextPath=request.getContextPath();
		//System.out.println(contextPath.length());
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
		CookieAction cookieAction = new CookieAction();
		
		if ("/generateCertCode.cookie".equals(command)){
			// EmailController에서 간단하게 CookieAction 호출해서 처리함 
			// why? 여기서 처리하면 메일 보내기 로직 또한 여기서 처리해야 된다. 번거롭다. 

		} else if ("/saveEmailIdCookie.cookie".equals(command)) {
			// 회원 가입, 로그인시 처리
			String email = request.getParameter("email");
			cookieAction.saveEmailId(request, response, email);
			response.sendRedirect("./main.jsp?center=snspage.jsp");
			
		} else if ("/removeEmailId.cookie".equals(command)) {
			// 회원 탈퇴, 로그아웃시 처리
			String email = request.getParameter("email");
			cookieAction.removeEmailId(request, response, email);
			response.sendRedirect("./main.jsp");

		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
