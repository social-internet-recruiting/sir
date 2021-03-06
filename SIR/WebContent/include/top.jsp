<%@page import="net.profileimage.controller.CheckExistProfileInServer"%>
<%@page import="java.io.File"%>
<%@page import="net.member.model.MemberDTO"%>
<%@page import="net.member.model.MemberDAO"%>
<%@page import="net.cookie.controller.CookieAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<style type="text/css">
	#profileImageSmall{
		height: 35px;
		width: 35px;
	}
</style>

<title>JSP 게시판 웹 사이트</title>
 
</head>
<html>

<%
	Cookie[] cookies = request.getCookies();
	CookieAction cookieAction = new CookieAction();
	String email = cookieAction.getEmailInCookie(cookies);
	
	//System.out.println("email ID : " + email); // 확인용 좀있다 삭제 할 것

	if(email != null){ //email 값 있으니깐 로그인 화면으로
		
		// 해당 email 의 db 에 img 경로 저장되어있는지 확인
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMemberInfoDTO(email);
		String imgPath = mdto.getImg();

		// 파일이 지워진 거면 noneProfile.jpg 띄워야 된다.
		CheckExistProfileInServer checkExistProfile = new CheckExistProfileInServer();
		boolean checkFile = checkExistProfile.checkProfile(request, response, mdto.getImg());
		if (!checkFile || "".equals(mdto.getImg().trim())){ // 파일이 없다고 뜨면, 신규가입이면 빈칸임
			String realProfileFilePath = "./images/noneProfile.jpg";
			mdto.setImg(realProfileFilePath);
			mdao.reviseMyInfo(mdto); // DB값 바꾸기 위해서
			// 이미지 경로 때문에 오류 나는부분, db 값만 바꿔주면 중복 구문 줄일수 있다. 
			// memberController , top, myinfo 등등에서 써야 될 구문을 top 에서만 db에 실제 값 변경함으로써 체크 로직 줄일수 있다.

			imgPath = mdto.getImg();
			
			// System.out.println("imgPath : " + imgPath);
			
		} // 파일이 있으면 별다른 수정 안한다.
		
%>

<nav class="navbar navbar-blue" style="z-index:1035; margin-top:-1px;">
<div class="fixedboard bg-blue" style="width:100%;opacity:1;">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div>
		<a class="navbar-brand" href="./snspage.snsboard"><img src="images/sir.gif" height="50" width="100"></a>
	  </div>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin-top:15px;">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="./snspage.snsboard" style="color:black; font:bolder;" ><img src="./images/home.gif" style="height:35px; weight:35px; margin-top:-8px;" > &nbsp;Home</a></li>
        <li><a href="./job_main.job" style="color:black; font:bolder;" ><img src="./images/job.gif" style="height:35px; weight:35px; margin-top:-8px;" > &nbsp;Job</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">	
          	<img src="<%=imgPath%>" style="margin-top:-8px;" id="profileImageSmall" > &nbsp;회원정보 <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="./myInfo.mem">My Page</a></li>
            <li><a href="./askedPage.mem">글 & 활동</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="./removeEmailId.cookie">로 그 아 웃</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</div>
</nav>
<%
	} else { // 로그인 안된 화면
%>


<nav class="navbar navbar-blue bg-blue" style="margin-top:-1px;">
<div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div>
		<a class="navbar-brand" href="main.jsp"><img src="images/sir.gif" height="50" width="100"></a>
	  </div>
    </div>
	<div class="collapse navbar-collapse" id="navbarColor01" style="margin-top:22px; float:right">
    	<form class="form-inline login-1" action="./login.mem" method="post">
      	<div class="input-group">
      		<span class="input-group-addon"><img src="images/login.jpg"></span>
			<input id="loginemail" type="email" class="form-control" name="loginemail" value="" placeholder="Email Address">                                        
		</div>
	 	<div class="input-group">
      		<span class="input-group-addon"><img src="images/password.jpg"></span>
         	<input id="loginpass" type="password" class="form-control" name="loginpass" value="" placeholder="Password">                                        
      	</div>
	 	<button type="submit" class="btn btn-light">Login</button>
    	</form>
    </div><!-- /.navbar-collapse -->
</div><!-- /.container-fluid -->  
   
</nav>
<%
	}
%>
</html>