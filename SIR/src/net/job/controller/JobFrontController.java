package net.job.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.job.model.JobDAO;
import net.job.model.jobDTO;

@WebServlet("*.job")
public class JobFrontController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");

		String RequestURI = request.getRequestURI();
		// System.out.println(RequestURI);
		String contextPath = request.getContextPath();
		// System.out.println(contextPath.length());
		String command = RequestURI.substring(contextPath.length());
		// System.out.println(command);

		if ("/job_main.job".equals(command)) {
			
			try{
//				JobDAO dao = new JobDAO();
				
//				Vector<jobDTO> v = dao.getAllList();
				
//				request.setAttribute("v", v);
				
				
				
//				request.setAttribute("count", dao.getTotalCount());
				
				// 현재 보여질 페이지 번호 저장
//				request.setAttribute("nowpage", request.getParameter("nowPage"));
				// 현재 보여질 블럭 번호 저장
//				request.setAttribute("nowBolck", request.getParameter("nowBlock"));
				
			}catch(Exception e){
				System.out.println("/job_main.job error " + e);
				e.printStackTrace();
			}
			
			
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_main.jsp");
			
			dis.forward(request, response);
			
			
			
		} else if ("/check_search.job".equals(command)) {
			 String[] check_job = request.getParameterValues("Check_job"); //1차 2차 직업 분류 조건
			// for(String out : check_job) {
			// System.out.println(out);
			// }
			 String[] check_region = request.getParameterValues("Check_region"); //지역 분류 조건
			// for(String out : check_region) {
			// System.out.println(out);
			// }
			 String[] check_career = request.getParameterValues("career"); // 경력 체크 조건
			// for(String out : check_career) {
			// System.out.println(out);
			// }
			 String career_up = request.getParameter("career_up"); //경력 이상 조건
			// System.out.println(career_up);
			 String career_down = request.getParameter("career_down"); //경력 이하 조건
			// System.out.println(career_down);
			 String qualify_school1 = request.getParameter("qualify_school1"); //학력 이상 조건
			// System.out.println(qualify_school1);
			 String qualify_school2 = request.getParameter("qualify_school2"); //학력 이하 조건
			// System.out.println(qualify_school2);
			 String check_school = request.getParameter("School"); //학력 무관 조건
			// System.out.println(school);
			 String income_up = request.getParameter("income_up"); //연봉 이상  조건
			// System.out.println(income_up);
			 String income = request.getParameter("income"); //연봉 체크 조건
			// System.out.println(income);
			 
			
			JobDAO dao = new JobDAO();
			Vector<jobDTO> v = dao.getCheckList(check_job,check_region,
												check_career,career_up,career_down,
												qualify_school1,qualify_school2,check_school,
												income_up,income);
			
			request.setAttribute("v", v);

			
			
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_list.jsp");

			dis.forward(request, response);

			
		} else if("/job_detail.job".equals(command)) {
			String idx = request.getParameter("job_idx");
			System.out.println("��ȣ :" +idx);
			JobDAO dao = new JobDAO();
			jobDTO dto = dao.getSelectList(idx);
			request.setAttribute("dto", dto);
			
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_detail.jsp");
			dis.forward(request, response);
		
		} else if("/job_search.job".equals(command)) {
			
			JobDAO dao = new JobDAO();
			
			String search = (String)request.getAttribute("search");
			System.out.println(search);
			
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_main.jsp");
			dis.forward(request, response);
		}
	}

}
