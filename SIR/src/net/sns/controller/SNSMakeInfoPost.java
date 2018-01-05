package net.sns.controller;

import net.sns.model.SNSDTO;

public class SNSMakeInfoPost {

	public String getInfoPost(SNSDTO sdto) {
		// System.out.println("sdto.getImg() 확인 : " + sdto.getImg());
		String result = "";
		result += "<div class='photosize col-sm-4' style='margin:5px; background-color:#DBDBDB'>"
				+ "<a style='cursor:pointer;' onclick='showPostMethod(" + sdto.getIdx() + ");'><img style='width:370px; height:200px; margin-left:-10px; margin-top:5px;' src = '" + sdto.getImg() + "'></a>"
				+ "</div>";
		
		return result;
	}

}
