package net.profileimage.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckExistProfileInServer {
	public boolean checkProfile(HttpServletRequest request, HttpServletResponse response, String image){
		
		String[] tmpImageArr = image.split("/");
		String imageName = tmpImageArr[tmpImageArr.length-1];
		
		ServletContext ctx = request.getServletContext();
		String folderPath = ctx.getRealPath("uploadProfileImage/");
		String transForderPath = folderPath.replace("\\", "\\\\");

		String checkProfilePath = transForderPath + imageName;
		
		File existFile = new File(checkProfilePath);
		if (existFile.exists()){
			return true;
		} else {
			return false;
		}

	}
}
