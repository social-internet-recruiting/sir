package net.email.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDao;

public class EmailController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html;charset=UTF-8"); // 아래 alert 창 한글 적용
		
		String RequestURI=request.getRequestURI();
		//System.out.println(RequestURI);
		String contextPath=request.getContextPath();
		//System.out.println(contextPath.length());
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		PrintWriter out=response.getWriter();
		
		if ("/SendEmailToCert.email".equals(command)){
			// emailId, pass, 이름 정보와 random 인증값 cookie 에 5분동안 시간과 함께 저장(5분안에 이메일 링크에서 확인하지 않으면 무용지물)
			// id 값과 인증값을 함께 가지고 들어오는 페이지 요청에 대해서 그때 insert 구문 날려준다. 
			// 그리고 자동으로 페이지 로딩 되면서 자동로그인 될수 있게끔
			EmailAction emailAction = new EmailAction();
			
			// cookie 값 저장, 저장의 이름은 인증코드로 담는다. 
			String email = request.getParameter("email");
			String name = request.getParameter("name");
			String pass = request.getParameter("pass");

			String certcode = emailAction.getCertCode(request, response); // sir + 랜덤 10자리 얻음
			
			Cookie codeCookie = new Cookie("certcode", certcode);
			codeCookie.setMaxAge(60*5); // 5분간 유지
			response.addCookie(codeCookie);
			
			// cookie 에 email 값 저장할것 // 로그인 할때도 동일하게 저장해야됨
			Cookie emailCookie = new Cookie("email", email);
			emailCookie.setMaxAge(60*60*24*365); // 1년간 유지
			response.addCookie(emailCookie);

			//registerOk.jsp에서 회원가입 완료 시켜줄 parameter 값 넘겨주기 위함
			String addParam = "&certcode=" + certcode + "&email=" + email + "&pass=" + pass + "&name=" + name;
			
			boolean isOkSendingEmail = emailAction.sendEmailToCertMethod(email, addParam);
			if (isOkSendingEmail){
				out.println("<script>");
				out.println("alert('메일이 발송되었습니다.\\n메일 도메인으로 이동됩니다. 5분안에 로그인 해주세요 \\n로그인 후 이메일 인증하면 로그인 된 SIR화면이 로드 됩니다.');");
				// 자바코드 안이라서 \\ 해줘야지 \ 로 인식
				// 이메일 로그인 사이트로 이동
				String[] emailAddressArr = email.split("@");
				String emailDomain = "http://www." + emailAddressArr[1];
				out.println("location.href='" + emailDomain + "';");
				out.println("</script>");
				
			} else {
				out.println("<script>");
				out.println("alert('메일 발송이 실패 했습니다. \\n관리자에게 문의하세요');");
				out.println("</script>");
			}
			
			out.close();
			
		} else if ("/EmailDupCheck.email".equals(command)) {
			
			String email = request.getParameter("email");
			MemberDao mdao = new MemberDao();
			boolean check = mdao.checkDupEmail(email);
			out.println(check);
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
