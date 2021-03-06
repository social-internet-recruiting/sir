package net.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cookie.controller.CookieAction;
import net.job.model.JobDAO;
import net.job.model.scrapDTO;
import net.member.model.MemberDAO;
import net.member.model.MemberDTO;
import net.sns.controller.SNSGetFriendAskedList;
import net.sns.model.SNSDAO;

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
				
				
				// 주소 %% 기준으로 분할
				String postcode = "";
				String address = "";
				String address2 = "";
				System.out.println("mdto.getAddr() : " + mdto.getAddr());
				
				if (!"".equals(mdto.getAddr())){
					String [] addressArr = mdto.getAddr().split("%%");
					if (addressArr.length==3){
						postcode = addressArr[0];
						address = addressArr[1];
						address2 = addressArr[2];
					} else {
						postcode = addressArr[0];
						address = addressArr[1];
					} 

				}
				request.setAttribute("postcode", postcode);
				request.setAttribute("address", address);
				request.setAttribute("address2", address2);
				
				request.setAttribute("mdto", mdto);
				
				// 친구 숫자
				SNSDAO sdao = new SNSDAO();
				int friendCount = sdao.getFriendCount(email);
				request.setAttribute("friendCount", friendCount);
				
				// 게시글 숫자
				int postCount = sdao.getPostCount(email);
				request.setAttribute("postCount", postCount);
				
				//공고 부분
				JobDAO jdao = new JobDAO();
				Vector<scrapDTO> jv = jdao.getScrap(email);
				
				request.setAttribute("sdto", jv);
				
				RequestDispatcher dis = request.getRequestDispatcher("myInfo.jsp");
				//getRequestDispatcher("main.jsp?center=myInfo.jsp"); center 값 바꿔서 갈라니깐
				//모달때문인지 에러 난다.
				
				dis.forward(request, response);
				
			} else { // email 쿠키값이 없으면 main page로 넘겨라, 잘못된 접근이다.
				RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
				dis.forward(request, response);
			}

			
		} else if ("/reviseMyInfo.mem".equals(command)) {
			// profileImage controller에서 넘어옴
			// 수정 항목 추가 되는대로 업데이트 할 것
			Cookie[] cookies = request.getCookies();
			CookieAction cookieAction = new CookieAction();
			// email 쿠키값 가져옴 
			String email = cookieAction.getEmailInCookie(cookies);
			System.out.println("Cookie Email : " + email);
			
			if (email != null){ // email 쿠키값이 있으면 제대로 넘겨주고
				MemberDTO mdto = (MemberDTO)request.getAttribute("mdto");
				
				String delHigh = request.getParameter("delhigh_school");
				String delUni = request.getParameter("deluniversity");
				
				// 이전 입력된 고등학교, 대학교 카운트 줄이고, 새로 입력된 고등학교, 대학교 추가 및 카운트 올리기
				mdao.reviseSchoolCount(delHigh, delUni, mdto.getHigh_school(), mdto.getUniversity());
				System.out.println("mdto.getAddr() : " + mdto.getAddr());
				mdao.reviseMyInfo(mdto);
	
				RequestDispatcher dis = request.getRequestDispatcher("./myInfo.mem");
				dis.forward(request, response);
				
			} else { // email 쿠키값이 없으면 main page로 넘겨라, 잘못된 접근이다.
				RequestDispatcher dis = request.getRequestDispatcher("main.jsp");
				dis.forward(request, response);
			}
		} else if ("/friendInfo.mem".equals(command)) { // 다른 사람 id 누르면 그사람 정보 조회 
			
			// 그사람 정보, 그사람 글정보 뿌려줄것
			// 그사람 정보는 js 무한 스크롤로 뿌려줄거고, 그사람 정보만 저장하면 된다.
			String friend = request.getParameter("friend"); // snspage에서 id의 href 값으로 넘어오는 값
			System.out.println("friend : " + friend);
			
			// friend 정보가 본인일 경우 때문에 cookie 값 확인
			Cookie[] cookies = request.getCookies();
			CookieAction cookieAction = new CookieAction();
			// email 쿠키값 가져옴 
			String email = cookieAction.getEmailInCookie(cookies);
			System.out.println("eamil : " + email);
			if (friend.equals(email)){
				// friend 정보가 본인일 경우 때문에 cookie 값 확인 하고 맞으면 myInfo 로 보냄
				RequestDispatcher dis = request.getRequestDispatcher("./myInfo.mem");
				dis.forward(request, response);
				
			} else {
				
				MemberDTO mdto = new MemberDTO();
				mdto = mdao.getMemberInfoDTO(friend);
				
				// 친구 숫자
				SNSDAO sdao = new SNSDAO();
				int friendCount = sdao.getFriendCount(friend);
				request.setAttribute("friendCount", friendCount);
				
				// 게시글 숫자
				int postCount = sdao.getPostCount(friend);
				request.setAttribute("postCount", postCount);
				
				request.setAttribute("mdto", mdto);
				
				// 누구 정보인지 담기, friendInfo, myInfo 같이 사용하기 때문에
				request.setAttribute("friend", friend);
				
				RequestDispatcher dis = request.getRequestDispatcher("myInfo.jsp");
				dis.forward(request, response);
			}
		} else if ("/askedPage.mem".equals(command)) {

			Cookie[] cookies = request.getCookies();
			CookieAction cookieAction = new CookieAction();
			// email 쿠키값 가져옴 
			String email = cookieAction.getEmailInCookie(cookies);
			
			SNSGetFriendAskedList getFriendAskedList = new SNSGetFriendAskedList();
			ArrayList<String> mainContents = getFriendAskedList.getFriendAskedListMethod(email);

			request.setAttribute("mainContents", mainContents);
			
			RequestDispatcher dis = request.getRequestDispatcher("main.jsp?center=askedPage.jsp");
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
