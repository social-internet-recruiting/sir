<%@page import="net.member.model.MemberDTO"%>
<%@page import="net.member.model.MemberDAO"%>
<%@page import="net.cookie.controller.CookieAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>JSP 게시판 웹 사이트</title>
<%
	Cookie[] cookies = request.getCookies();
	CookieAction cookieAction = new CookieAction();
	String email = cookieAction.getEmailInCookie(cookies);
	
	System.out.println("email ID : " + email); // 확인용 좀있다 삭제 할 것
	
	if(email != null){ //email 값 있으니깐 로그인 화면으로
		
		// 해당 email 의 db 에 img 경로 저장되어있는지 확인
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = mdao.getMemberInfoDTO(email);
		String imgPath = mdto.getImg();
		
		if (imgPath == "" || "./uploadProfileImage/null".equals(imgPath)){
			// DB 에 img 경로가 없으니깐 noneProfile.jpg로 
			imgPath = "./images/noneProfile.jpg";	

		} else {
			// DB 에 img 경로가 있으니깐 그걸 불러온다. 그냥 pass
			imgPath = imgPath;
		}

%>

<nav class="navbar navbar-expand-lg navbar-blue bg-blue">
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

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin-top:15px;">
      <form class="navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-light">Submit</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="main.jsp" style="color:black; font:bolder;" ><img src="./images/home.gif" style="height:35px; weight:35px; margin-top:-8px;" > &nbsp;Home</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color:black;">	
          	<img src="<%=imgPath%>" style="height:35px; weight:35px; margin-top:-8px;"> &nbsp;회원정보 <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#"></a></li>
            <li><a href="./myInfo.mem">My Page</a></li>
            <li><a href="#">글 & 활동</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="./removeEmailId.cookie">로 그 아 웃</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<%
	} else { // 로그인 안된 화면
%>

</head>
<html>


<nav class="navbar navbar-expand-lg navbar-blue bg-blue">
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
	</div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->

</nav>
<%
	}
%>
</html>