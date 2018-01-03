package net.job.controller;

import java.io.IOException;
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
import net.job.model.jobDTO;
import net.job.model.scrapDTO;
import net.member.model.MemberDAO;

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
		
		int totalRecord = 0;
		int numPerPage = 3;
		int pagePerBlock = 3;
		int totalPage = 0;
		int totalBlock = 0;
		int nowPage = 0;
		int nowBlock = 0;
		int beginPerPage = 0;

		if ("/job_main.job".equals(command)) {
			
			JobDAO dao = new JobDAO();

			Vector<jobDTO> v = dao.getAllList();
			totalRecord = v.size();
			totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
			if(request.getParameter("nowPage")!=null){
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			if(request.getParameter("nowBlock")!=null){
				nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
			}
			totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
			beginPerPage = nowPage*numPerPage;
			
			Vector<jobDTO> jdto = new Vector<jobDTO>();
			for(int i=beginPerPage;i<(beginPerPage + numPerPage);i++){
				if(i==totalRecord) break;
				 jdto.add(v.get(i));
			}
			
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("totalBlock", totalBlock);
			request.setAttribute("nowBlock", nowBlock);
			request.setAttribute("v1", jdto);
			
			//추천 공고 불러오기
			Cookie[] cookies = request.getCookies();
			CookieAction cookieAction = new CookieAction();
			String email = cookieAction.getEmailInCookie(cookies);
			MemberDAO mdao = new MemberDAO();
			String job2_name = mdao.getJob2Code(email);
			JobDAO jdao = new JobDAO();
			Vector<jobDTO> job2 = jdao.getRecommand(job2_name);
			
			request.setAttribute("job2",job2);

			RequestDispatcher dis = request.getRequestDispatcher("./job/job_main.jsp");

			dis.forward(request, response);
			
			
			
		} else if ("/check_search.job".equals(command)) {
			
			String career,career_up,career_down;
			String qualify_up;
			String qualify_down;
			int income_up;
			String AA = request.getParameter("AA");
			//System.out.println(AA);
			String AB = request.getParameter("AB");
			//System.out.println(AB);
			String AC = request.getParameter("AC");
			//System.out.println(AC);
			String BA = request.getParameter("BA");
			//System.out.println(BA);
			String BB = request.getParameter("BB");
			//System.out.println(BB);
			String BC = request.getParameter("BC");
			//System.out.println(BC);
			String CA = request.getParameter("CA");
			//System.out.println(CA);
			String CB = request.getParameter("CB");
			//System.out.println(CB);
			String CC = request.getParameter("CC");
			//System.out.println(CC);
			String DA = request.getParameter("DA");
			//System.out.println(DA);
			String DB = request.getParameter("DB");
			//System.out.println(DB);
			String DC = request.getParameter("DC");
			//System.out.println(DC);
			String EA = request.getParameter("EA");
			//System.out.println(EA);
			String EB = request.getParameter("EB");
			//System.out.println(EB);
			String EC = request.getParameter("EC");
			//System.out.println(EC);
			String FA = request.getParameter("FA");
			//System.out.println(FA);
			String FB = request.getParameter("FB");
			//System.out.println(FB);
			String FC = request.getParameter("FC");
			//System.out.println(FC);
			String GA = request.getParameter("GA");
			//System.out.println(GA);
			String GB = request.getParameter("GB");
			//System.out.println(GB);
			String GC = request.getParameter("GC");
			//System.out.println(GC);
			String HA = request.getParameter("HA");
			//System.out.println(HA);
			String HB = request.getParameter("HB");
			//System.out.println(HB);
			String HC = request.getParameter("HC");
			//System.out.println(HC);
			String IA = request.getParameter("IA");
			//System.out.println(IA);
			String IB = request.getParameter("IB");
			//System.out.println(IB);
			String IC = request.getParameter("IC");
			//System.out.println(IC);
			String bs_all = request.getParameter("bs_all");
			//System.out.println(bs_all);
			String bs_01 = request.getParameter("bs_01");
			//System.out.println(bs_01);
			String bs_02 = request.getParameter("bs_02");
			//System.out.println(bs_02);
			String bs_03 = request.getParameter("bs_03");
			//System.out.println(bs_03);
			String bs_04 = request.getParameter("bs_04");
			//System.out.println(bs_04);
			String bs_05 = request.getParameter("bs_05");
			//System.out.println(bs_05);
			String bs_06 = request.getParameter("bs_06");
			//System.out.println(bs_06);
			String bs_07 = request.getParameter("bs_07");
			//System.out.println(bs_07);
			String bs_08 = request.getParameter("bs_08");
			//System.out.println(bs_08);
			String bs_09 = request.getParameter("bs_09");
			//System.out.println(bs_09);
			String bs_10 = request.getParameter("bs_10");
			//System.out.println(bs_10);
			String bs_11 = request.getParameter("bs_11");
			//System.out.println(bs_11);
			String bs_12 = request.getParameter("bs_12");
			//System.out.println(bs_12);
			String bs_13 = request.getParameter("bs_13");
			//System.out.println(bs_13);
			String bs_14 = request.getParameter("bs_14");
			//System.out.println(bs_14);
			String newcomer = request.getParameter("newcomer");
			//System.out.println(newcomer);
			String career_no = request.getParameter("career_no");
			//System.out.println(career_no);
			
			if(newcomer == null) {
				career = request.getParameter("career");
				//System.out.println(career);
				career_up = request.getParameter("career_up");
				//System.out.println(career_up);
				career_down = request.getParameter("career_down");
				//System.out.println(career_down);
			} else {
				career = null;
				//System.out.println(career);
				career_up = "없음";
				//System.out.println(career_up);
				career_down = "없음";
				System.out.println(career_down);
			}
			
			if(career_no != null) {
				newcomer = "신입";
				//System.out.println(newcomer);
				career = null;
				//System.out.println(career);
				career_up = "없음";
				//System.out.println(career_up);
				career_down = "없음";
				//System.out.println(career_down);
			}

			String qualify_no = request.getParameter("qualify_no");
			//System.out.println(qualify_no);
			
			if(qualify_no != null) {
				qualify_up = "없음";
				//System.out.println(qualify_up);
				qualify_down = "없음";
				//System.out.println(qualify_down);
			} else {
				qualify_up = request.getParameter("qualify_up");
				//System.out.println(qualify_up);
				qualify_down = request.getParameter("qualify_down");
				//System.out.println(qualify_down);
			}
			
			String income_no = request.getParameter("income_no");
			if(income_no != null) {
				income_up = 0;
				//System.out.println(income_up);
			} else {
				income_up = Integer.parseInt(request.getParameter("income_up"));
				//System.out.println(income_up);
			}
			
			
			JobDAO dao = new JobDAO();
			Vector<jobDTO> v = dao.getCheckList(AA,AB,AC,BA,BB,BC,CA,CB,CC,DA,DB,DC,EA,EB,EC,FA,FB,FC,GA,GB,GC,HA,HB,HC,IA,IB,IC,
												bs_all,bs_01,bs_02,bs_03,bs_04,bs_05,bs_06,bs_07,bs_08,bs_09,bs_10,bs_11,bs_12,bs_13,bs_14,
												newcomer,career,career_up,career_down,qualify_up,qualify_down,income_up);
			
			totalRecord = v.size();
			totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
			if(request.getParameter("nowPage")!=null){
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			if(request.getParameter("nowBlock")!=null){
				nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
			}
			totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
			beginPerPage = nowPage*numPerPage;
			
			Vector<jobDTO> jdto = new Vector<jobDTO>();
			for(int i=beginPerPage;i<(beginPerPage + numPerPage);i++){
				if(i==totalRecord) break;
				 jdto.add(v.get(i));
			}
			
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("totalBlock", totalBlock);
			request.setAttribute("nowBlock", nowBlock);
			request.setAttribute("v2", jdto);
			
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_main.jsp");
			
			dis.forward(request, response);

		
		} else if("/text_search.job".equals(command)) {
			String company = request.getParameter("company");
			JobDAO dao = new JobDAO();
			Vector<jobDTO> v = dao.getTextList(company);
			
			totalRecord = v.size();
			totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
			if(request.getParameter("nowPage")!=null){
				nowPage = Integer.parseInt(request.getParameter("nowPage"));
			}
			if(request.getParameter("nowBlock")!=null){
				nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
			}
			totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
			beginPerPage = nowPage*numPerPage;
			
			Vector<jobDTO> jdto = new Vector<jobDTO>();
			for(int i=beginPerPage;i<(beginPerPage + numPerPage);i++){
				if(i==totalRecord) break;
				 jdto.add(v.get(i));
			}
			
			request.setAttribute("nowPage", nowPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("totalBlock", totalBlock);
			request.setAttribute("nowBlock", nowBlock);
			request.setAttribute("v3", jdto);
			
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_main.jsp");
			
			dis.forward(request, response);
			
		} else if("/job_detail.job".equals(command)) {
		
		Cookie[] cookies = request.getCookies();
		CookieAction cookieAction = new CookieAction();
		String email = cookieAction.getEmailInCookie(cookies);
			
		String idx = request.getParameter("job_idx");
		JobDAO dao = new JobDAO();
		jobDTO dto = dao.getSelectList(idx);
		request.setAttribute("dto", dto);
		request.setAttribute("id",email);
		
		RequestDispatcher dis = request.getRequestDispatcher("./job/job_detail.jsp");
		dis.forward(request, response);
		
		} else if("/job_scrap.job".equals(command)) {
			JobDAO dao = new JobDAO();
			try {
				String email = request.getParameter("email");
				String recruit_notice = request.getParameter("recruit_notice");
				String co_title = request.getParameter("co_title");
				String co_addr = request.getParameter("co_addr");
				String establish = request.getParameter("establish");
				String sales = request.getParameter("sales");
				int employees = Integer.parseInt(request.getParameter("employees"));
				String duty = request.getParameter("duty");
				String position = request.getParameter("position");
				int recruit_volume = Integer.parseInt(request.getParameter("recruit_volume"));
				int income_up = Integer.parseInt(request.getParameter("income_up"));
				String qualify_down = request.getParameter("qualify_down");
				String qualify_up = request.getParameter("qualify_up");
				String career_down = request.getParameter("career_down");
				String career_up = request.getParameter("career_up");
				String qualify_license = request.getParameter("qualify_license");
				String prefer = request.getParameter("prefer");
				String applicate_period1 = request.getParameter("applicate_period1");
				String applicate_period2 = request.getParameter("applicate_period2");
				String form = request.getParameter("form");
				String reception = request.getParameter("reception");
				String job_process = request.getParameter("job_process");
				
				dao.insertScrap(email,recruit_notice,co_title,co_addr,establish,sales,employees,
								duty,position,recruit_volume,income_up,qualify_down,qualify_up,
								career_down,career_up,qualify_license,prefer,applicate_period1,
								applicate_period2,form,reception,job_process);
				
			} catch (Exception e) {
				System.out.println("/job_scrap.job 쪽 오류");
				e.printStackTrace();
			}
			
			
			
			String idx = request.getParameter("job_idx");
			jobDTO dto = dao.getSelectList(idx);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("./job/job_detail.jsp");
			dis.forward(request, response);
			
		} else if("/scrap_detail.job".equals(command)) {
			String idx = request.getParameter("scrap_idx");
			JobDAO dao = new JobDAO();
			scrapDTO dto = dao.getScrapDetail(idx);
			
			request.setAttribute("dto", dto);
			RequestDispatcher dis = request.getRequestDispatcher("./job/scrap_detail.jsp");
			dis.forward(request, response);
		}
	} 

}
