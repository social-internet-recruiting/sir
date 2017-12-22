package net.sns.controller;

public class SNSGetComment {

	public String getComment(String commentAuth, String comment, String realTime) {
		String result = "";
		
		result += "<a><span style='float:left;'>" + commentAuth + "</span></a>"
				+ "&nbsp;&nbsp;&nbsp;&nbsp;" + comment
				+ "<span style='float:right;'> 댓글 작성 시간 : " + realTime + "</span><br/>";
		
		return result;
	}

}
