package net.sns.controller;

import net.sns.model.SNSDTO;

public class SNSMakeInfoPost {

	public String getInfoPost(SNSDTO sdto) {
		String result = "";
		result += "<div class='photosize col-sm-4' style='margin:5px; background-color:#ff8080'>"
				+ "<a><img style='width:370px; height:370px; margin-left:-10px; margin-top:5px;' src = '" + sdto.getImg() + "'></a>"
				+ "</div>";
		
		return result;
	}

}
