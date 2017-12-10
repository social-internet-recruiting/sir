package net.list.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.cookie.controller.CookieAction;

@WebServlet("*.list")
public class ListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		
		response.setContentType("text/html;charset=UTF-8"); 
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		ListAction listAction = new ListAction();
		
		if ("/highSchoolList.list".equals(command)){
			String search = request.getParameter("search");
			ArrayList<String> result = listAction.getHighSchoolList(search.trim());
			PrintWriter out = response.getWriter();
			out.println(result);
		} else if ("/universityList.list".equals(command)){
			String search = request.getParameter("search");
			ArrayList<String> result = listAction.getUniversitySchoolList(search.trim());
			PrintWriter out = response.getWriter();
			out.println(result);
		} else if ("/jobcode.list".equals(command)) {
			String search = request.getParameter("search");
			ArrayList<String> codeList = listAction.getJobCode(search.trim());
			
			// email cookie 값 기준으로 선택한 job2Name 보여주기 위함
			Cookie[] cookies = request.getCookies();
			CookieAction cookieAction = new CookieAction();
			String email = cookieAction.getEmailInCookie(cookies);
			
			String selectedJob2 = listAction.getSelectedJob2(email);
			
			// code list와 selectedjob2 name 을 이용해서 selected string 넘겨주기
			TransString transString = new TransString();
			String resultString = transString.getJobCodeString(codeList, selectedJob2);
			
			PrintWriter out = response.getWriter();
			out.println(resultString);
		}
	}

}
