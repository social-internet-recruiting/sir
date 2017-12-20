package net.snsimage.controller;

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

import net.sns.model.SNSDAO;
import net.sns.model.SNSDTO;

@WebServlet("*.snsimage")
public class SNSImageController extends HttpServlet {

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
		
		if ("/uploadSnsImage.snsimage".equals(command)){

			SNSImageUploadToServer imgUpload = new SNSImageUploadToServer();

			SNSDTO sdto = imgUpload.saveSnsImage(request, response);
			
			String img = sdto.getImg();
			String contents = sdto.getContents();
			String hashtag = sdto.getHashtag();
			String auth = sdto.getAuth();
			
			SNSDAO sdao = new SNSDAO();
			System.out.println("imageController img : " + img);
			sdao.insertSnsBoard(img, contents, hashtag, auth);
			System.out.println("db 에 img path 기록 완료");

		}

	}
}
