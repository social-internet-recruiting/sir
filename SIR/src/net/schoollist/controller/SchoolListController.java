package net.schoollist.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.list")
public class SchoolListController extends HttpServlet {

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
		
		SchoolListAction listAction = new SchoolListAction();
		
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
		}
	}

}
