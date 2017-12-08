package net.profileimage.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.member.model.MemberDAO;
import net.member.model.MemberDTO;

public class DeleteImageFile {

	public void deleteImage(HttpServletRequest request, HttpServletResponse response, String email) {
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMemberInfoDTO(email);
		String imgPath = mdto.getImg();
		
		if (imgPath != null){
			String[] pathArray = imgPath.split("/");
			String fileName = pathArray[pathArray.length-1];
			
			ServletContext ctx = request.getServletContext();
			String folderPath = ctx.getRealPath("uploadProfileImage/");
			String transForderPath = folderPath.replace("\\", "\\\\");
	
			File delFile = new File(transForderPath + fileName);
			if (delFile.exists()){
				delFile.delete();	
			}
		}
	}
}

