package net.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cookie.controller.CookieAction;
import net.member.model.MemberDAO;
import net.member.model.MemberDTO;
import net.profileimage.controller.CheckExistProfileInServer;

@WebServlet("*.mem")
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
		
		MemberDAO mdao = new MemberDAO();

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
				out.println("alert('아이디와 비밀번호를 확인하세요');");
				out.println("location.href='./main.jsp';");
				out.println("</script>");
				out.close();
			}

		} else if ("/logout.mem".equals(command)) {
			// 로그아웃은 cookie 값만 없애주면 되니깐
			// CookieController에서 바로 처리했음
			
		} else if ("/myInfo.mem".equals(command)) {

			Cookie[] cookies = request.getCookies();
			CookieAction cookieAction = new CookieAction();
			// email 쿠키값 가져옴 
			String email = cookieAction.getEmailInCookie(cookies);
			System.out.println("Cookie Email : " + email);

			if (email != null){ // email 쿠키값이 있으면 제대로 넘겨주고
				mdao = new MemberDAO();
				MemberDTO mdto = mdao.getMemberInfoDTO(email);

				// mdto.getImg().trim(); // default 값이 ''
				if ("".equals(mdto.getImg()) || mdto.getImg().contains("null")){ // imgPath가 없으면 dto에  noneprofile.jpg 를 입력
					mdto.setImg("./images/noneProfile.jpg");
				}
				
				String phone1 = "";
				String phone2 = "";
				String phone3 = "";
				
				// 번호 분할 해줄것
				String phoneNumber = mdto.getPhone();
				System.out.println("phoneNumber : " + phoneNumber);
				if (!"".equals(phoneNumber.trim())){
					if (phoneNumber.length() == 11){ // 11자 자르기
						phone1 = phoneNumber.substring(0, 3);
						phone2 = phoneNumber.substring(3, 7);
						phone3 = phoneNumber.substring(7, 11);
					} else if (phoneNumber.length() == 10){ // 10글자 자르기
						phone1 = phoneNumber.substring(0, 3);
						phone2 = phoneNumber.substring(3, 6);
						phone3 = phoneNumber.substring(6, 10);
					}
				}
				
				request.setAttribute("phone1", phone1);
				request.setAttribute("phone2", phone2);
				request.setAttribute("phone3", phone3);
				
				request.setAttribute("mdto", mdto);
				RequestDispatcher dis = request.getRequestDispatcher("myInfo.jsp");
				//getRequestDispatcher("main.jsp?center=myInfo.jsp"); center 값 바꿔서 갈라니깐
				//모달때문인지 에러 난다.
				
				dis.forward(request, response);
				
			} else { // email 쿠키값이 없으면 main page로 넘겨라, 잘못된 접근이다.
				RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
				dis.forward(request, response);
			}

			
		} else if ("/reviseMyInfo.mem".equals(command)) {
			// 수정 항목 추가 되는대로 업데이트 할 것
			
			MemberDTO mdto = (MemberDTO)request.getAttribute("mdto");

			mdao.reviseMyInfo(mdto);
			
			RequestDispatcher dis = request.getRequestDispatcher("./myInfo.mem");
			dis.forward(request, response);
			
		}
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
