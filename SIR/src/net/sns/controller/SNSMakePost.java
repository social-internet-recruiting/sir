package net.sns.controller;

import net.sns.model.SNSDTO;

public class SNSMakePost {

	public String getPost(SNSDTO sdto) { 

		// ms 필요없어서 짜르기
		String timeS = sdto.getTime().toString();
		timeS = timeS.substring(0,timeS.length()-2);

		// 실시간으로 업로드 하는거랑, 무한 스크롤 두군대 동일 한 코드 때문에 Post 을 만드는 method 분리함
		String result = "";
		result 	+= 	"<div class='list-group'>"
				+ 	"<div class='list-group-item' align='left'>"
				+ 	"<img src='" + sdto.getAuthimg() + "' id='authImgId' > &nbsp;&nbsp; "
				+ 	"<a href='./friendInfo.mem?friend=" + sdto.getAuth() + "' style='cursor:pointer; word-break: break-all;'>" + sdto.getAuth() + "</a>" 
				+ 	"&nbsp;&nbsp;" + "<span style='float:right'> No. : " + sdto.getIdx() + "</span>" 
				+ 	"</div>"
				+ 	"<a align='left' style='height:400px;' class='list-group-item-img'><img src='" + sdto.getImg() + "' style='width:100%; height:400px;'></a>"
				+ 	"<div class='list-group-item' align='left'><br/>"
				+	"<span style='float:left; font-size: medium; font-weight: bold; font-style: italic;'>Contents</span><br/><br/>"
				+ 	sdto.getContents()
				+ 	"<br/>"
				+ 	"<hr style='margin:10px 0 10px 0;'/>"
				+	"<span style='float:left; font-size: medium; font-weight: bold; font-style: italic;'>Comments</span><br/><br/>"
				+ 	"<div style='align:left;' id='snsCommentsAdd_" + sdto.getIdx() + "'>"
				+ 	sdto.getComments()
				+	"</div>"
				+ 	"<hr style='margin:10px 0 10px 0;'/>"
				+ 	"<a style='cursor:pointer;' ><img src='./images/좋아요.gif' style='height:25px; weight:25px;'>좋아요  &nbsp;" + sdto.getLikecount() + "개</a>"
				+	"<span style='float:right'> 글 작성시간 : " + timeS + "</span>"
				+ 	"<br/>"
				+ 	"</div>"
				+ 	"<div class='list-group-item' style='height:78px;'>"
				+ 	"<span class='list-group-item-img' style='float:left; width:80%; height:100%;'>"
				+ 	"<textarea style='resize: none;' class='form-control' id='comments_" + sdto.getIdx() + "' name='comments_" + sdto.getIdx() + "' rows='2'></textarea>"
				+ 	"</span>"
				+ 	"<span class='list-group-item-img' style='float:right; width:20% ;height:100%;'>"
				+ 	"<input type='button' class='btn btn-light' value='댓글 추가' style='width:100%; height:100%' onclick='addComments(" + sdto.getIdx() + ");' />"
				+	"</span>"
				+ 	"</div>"
				+ 	"</div>";

		return result;
	}

}
