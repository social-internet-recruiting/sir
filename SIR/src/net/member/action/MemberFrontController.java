package net.member.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.db.MemberDao;


public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html;charset=UTF-8");
		
		String RequestURI=request.getRequestURI();
		//System.out.println(RequestURI);
		String contextPath=request.getContextPath();
		//System.out.println(contextPath.length());
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		MemberDao mdao = new MemberDao();
		
		if ("/login.mem".equals(command)){
			
			String email = request.getParameter("loginemail");
			String pass = request.getParameter("loginpass");
			
			// email 이랑 비번이랑 맞는지 체크 
			boolean isOkToLogin = mdao.checkUser(email, pass);
			if (isOkToLogin){
				response.sendRedirect("./saveEmailIdCookie.cookie?email=" + email);  // 쿠키값 저장하러 보내기
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아이뒤와 비밀번호를 확인하세요');");
				out.println("location.href='./main.jsp';");
				out.println("</script>");
				out.close();
			}

		} else if ("/logout.mem".equals(command)) {
			// 로그아웃은 cookie 값만 없애주면 되니깐
			// CookieController에서 바로 처리했음
			
		}
		
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
