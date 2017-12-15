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

			JobDAO dao = new JobDAO();
			Vector<jobDTO> v = dao.getAllList();
			request.setAttribute("v", v);
			
			int jobTotalCount = dao.getTotalCount();
			request.setAttribute("totalCount", jobTotalCount);
			
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_main.jsp");
			
			dis.forward(request, response);
			
			
			
		} else if ("/check_search.job".equals(command)) {
			JobDAO dao = new JobDAO();
			Vector<jobDTO> v = dao.getAllList();
			
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
		}
	}

}
