package net.snsimage.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.cookie.controller.CookieAction;
import net.sns.model.SNSDTO;

public class SNSImageUploadToServer {
	
	public SNSDTO saveSnsImage(HttpServletRequest request, HttpServletResponse response){
		
		ServletContext ctx = request.getServletContext();

		/*업로드할 실제 서버경로 얻기 - upload 폴더명 맞추기*/
		String realPath = ctx.getRealPath("uploadSnsImage/");
		
		System.out.println("realPath : " + realPath);
		
		int max = 10 * 1024 * 1024;
		
		MultipartRequest multi = null;
		try {

			multi =	new MultipartRequest(	request, 
											realPath, 
											max, 
											"UTF-8", 
											new DefaultFileRenamePolicy()
										);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Enumeration enu = multi.getFileNames();
		String fileName = null;
		while(enu.hasMoreElements()){
			System.out.println("업로드 중 %%%%%%");
			String name = (String)enu.nextElement();
			fileName = multi.getFilesystemName(name);
		}
		
		String realFilePath = "./uploadSnsImage/" + fileName;
		if (realFilePath.contains("null")){ // 사진 선택을 안하고 submit을 하면~ 
			realFilePath = "./images/noneImage.jpg";
		}
		
		SNSDTO mdto = new SNSDTO();
		System.out.println("imageUploadToServer realFilePath : " + realFilePath);

		// 추가항목 발생하면 여기서 값 추가 해줄것
		mdto.setImg(realFilePath);
		
		String email = multi.getParameter("email");
		mdto.setAuth(email);
		
		String contents = multi.getParameter("contents");
		mdto.setContents(contents);
		
		mdto.setHashtag("일단 비워둠, 검색 기능 추가 할때 반영 할 것");
		
		return mdto;
		
	}
}
