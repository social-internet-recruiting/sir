package net.profileimage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cookie.controller.CookieAction;
import net.member.model.MemberDTO;

@WebServlet("*.image")
public class ImageController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html;charset=UTF-8"); 
		
		String prevImgPath = request.getParameter("img");

		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		// cookie 값 불러와서 삭제 method 에 넣어줄것 (혹시 이미지 있을수도 있으니깐)
		// request에서 가져와도 되는데, 잘못된 접근 판별하기 위해서 (쿠키값이 없는데 이페이지 들어오면 오류다, 뒤로 가기 했을 경우 등등)
		Cookie[] cookies = request.getCookies();
		CookieAction cookieAction = new CookieAction();
		String email = cookieAction.getEmailInCookie(cookies);
		
		if ("/imageUpload.image".equals(command)){
			if (email != null){ // 이메일 값이 있으면
				
				ImageUploadToServer imgUpload = new ImageUploadToServer();
				// request.getParameter에서 값이 안받아진다. multi 선언한곳에서 parameter값 처리 해야 됨
				// 따라서 saveImage 의 리턴값으로  mdto를 가져온다.
				MemberDTO mdto = imgUpload.saveImage(request, response, email);
				
				request.setAttribute("mdto", mdto);
				String viewPage = "./reviseMyInfo.mem";
				RequestDispatcher dis = request.getRequestDispatcher(viewPage);
				dis.forward(request, response);

			} else { // 이메일 값이 없으면 즉 잘못된 접근이면
				
				String viewPage = "main.jsp";
				RequestDispatcher dis = request.getRequestDispatcher(viewPage);
				dis.forward(request, response);
			}

		}

	}
}
