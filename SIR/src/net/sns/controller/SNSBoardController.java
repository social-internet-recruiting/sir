package net.sns.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
import net.sns.model.SNSDAO;
import net.sns.model.SNSDTO;

@WebServlet("*.snsboard")
public class SNSBoardController extends HttpServlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html;charset=UTF-8");
		
		String RequestURI=request.getRequestURI();
		//System.out.println(RequestURI);
		String contextPath=request.getContextPath();
		//System.out.println(contextPath.length());
		String command=RequestURI.substring(contextPath.length());
		System.out.println(command);
		
		Cookie[] cookies = request.getCookies();
		CookieAction cookieAction = new CookieAction();
		// email 쿠키값 가져옴 
		String email = cookieAction.getEmailInCookie(cookies);
		
		String viewpage = "";
		
		if (email != null){ // email 값 없으면 main 페이지로
			
			if ("/snspage.snsboard".equals(command)){

				request.setAttribute("email", email);
				
				// 친구 리스트 얻기
				SNSDAO sdao = new SNSDAO();
				ArrayList<String> friendsList = sdao.getFriendsList(email);
				System.out.println("friendsList : " + friendsList.toString() + ", 친구 몇명 : " + friendsList.size());
				if (friendsList.size()==0){
					friendsList.add("친구가 없습니다.");
				}
				request.setAttribute("fList", friendsList);

				viewpage = "main.jsp?center=snspage.jsp";

			} else if ("/infiniteScroll.snsboard".equals(command)){ // 무한 스크롤 할때 작동
				SNSGetPostList slist = new SNSGetPostList();
				ArrayList<SNSDTO> slistArr = slist.getList(request, response);
				SNSTransStringForInfiniteScroll ts = new SNSTransStringForInfiniteScroll();
				String resultString = ts.getString(slistArr);
				PrintWriter out = response.getWriter();
				out.println(resultString);
				return; // 밑에 RequestDispatcher dis = request.getRequestDispatcher(viewpage); 이거 때문에 return 해야지 오류 없이 됨
						// 안그럼 페이지 이동 하려고 함
			}
			
		} else { // email 쿠키값이 없으면 main page로 넘겨라, 잘못된 접근이다.
			viewpage = "main.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(viewpage);
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
