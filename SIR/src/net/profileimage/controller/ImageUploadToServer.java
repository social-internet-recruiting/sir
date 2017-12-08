package net.profileimage.controller;

import java.io.File;
import java.io.IOException;
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
import net.member.model.MemberDTO;


public class ImageUploadToServer {
	
	public MemberDTO saveImage(HttpServletRequest request, HttpServletResponse response, String email){
		
		ServletContext ctx = request.getServletContext();

		/*업로드할 실제 서버경로 얻기 - upload 폴더명 맞추기*/
		String realPath = ctx.getRealPath("uploadProfileImage/");
		
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
		
		// 파일을 선택하지 않으면 이밑으로 아예 내려오지 않는다.
		Enumeration enu = multi.getFileNames();
		String fileName = null;
		while(enu.hasMoreElements()){
			String name = (String)enu.nextElement();
			fileName = multi.getFilesystemName(name);
		}
		
		String realFilePath = "./uploadProfileImage/" + fileName;
		if (realFilePath.contains("null")){ // 사진 선택을 안하고 submit을 하면~ 
			realFilePath = request.getParameter("img");
		} else { // 사진 선택을 했을때는 이전 사진파일을 삭제
			// 기존에 등록된 파일 지우기(DB값 변경전에 읽어와서 지워줄것)
			DeleteImageFile delImage = new DeleteImageFile();
			delImage.deleteImage(request, response, email);
		}

		MemberDTO mdto = new MemberDTO();
		
		// 추가항목 발생하면 여기서 값 추가 해줄것
		mdto.setImg(realFilePath);
		mdto.setName(multi.getParameter("name"));
		mdto.setIntro(multi.getParameter("introductionArea"));
		mdto.setGender(multi.getParameter("gender"));
		mdto.setEmail(multi.getParameter("email"));
		
		String phone1 = multi.getParameter("m_phone1");
		String phone2 = multi.getParameter("m_phone2");
		String phone3 = multi.getParameter("m_phone3");
		String phone = phone1 + phone2 + phone3;  
		mdto.setPhone(phone);
		
		mdto.setHigh_school(multi.getParameter("highSchoolSearchText"));
		mdto.setUniversity(multi.getParameter("universitySearchText"));
		
		return mdto;
		
	}
}
