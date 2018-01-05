package net.sns.controller;

public class SNSGetComment {

	public String getComment(String commentAuth, String comment, String realTime) {
		
		// enter 값 <br/> 로 변경
		comment = comment.replace("\n", "<br/>");
		
		String result = "";

		result += "<div>"
				+ "<div style='width: 20%; display:inline-block; vertical-align:top; word-break: break-all;'><a href='./friendInfo.mem?friend=" + commentAuth + "'>" + commentAuth + "</a></div>"
				+ "<div style='width: 1%; display:inline-block; vertical-align:top;'></div>"
				+ "<div style='width: 53%; display:inline-block; word-break: break-all;'>" +  comment + "	</div>"
				+ "<div style='width: 1%; display:inline-block; vertical-align:top;'></div>"
				+ "<div style='width: 23%; display:inline-block; vertical-align:top; float:right;'>"
				+ "<span style='float:right;'> 시간 : " + realTime + "</span>" 
				+ "</div>"
				+ "</div><div style='margin-bottom:5px;'></div>";
		return result;
	}
}
