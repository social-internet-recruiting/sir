<%@page import="net.member.db.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<title>JSP 게시판 웹 사이트</title>
<%
	Cookie[] cookies = request.getCookies();
	MemberDao memDao = new MemberDao();
	String email = memDao.getEmailInCookie(cookies);
	
	System.out.println("email ID : " + email); // 확인용 좀있다 삭제 할 것
	
	if(email != null){ //email 값 있으니깐 로그인 화면으로
%>
<nav class="navbar navbar-expand-lg navbar-blue bg-blue">
<a class="navbar-brand" href="main.jsp"><img src="images/sir.gif" height="100" width="200"></a>
    <ul class="navbar-nav mr-auto login-1">
    	<form class="form-inline my-2 my-lg-0">
    	<input class="form-control mr-sm-2" type="text" placeholder="Search">
     	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    	</form>
			<li class="nav-item active">
    	    	<a class="nav-link" href="main.jsp"style="margin-left:25px">Home</a>
    	  	</li>
    	  	<li class="nav-item">
    	    	<a class="nav-link" href="#">Job</a>
   			</li>
   			<li class="nav-item">
    	    	<a class="nav-link" href="#">님 </a>
   			</li>

            <li class="dropdown nav-item">
            	<button class="btn btn-light" style="margin-top:10px">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="font-size:20px">회원정보<span class="caret"></span></a>
					<ul class="dropdown-menu login-1" style="margin-top:50px">
						<li><a href="#"><img src="./images/profile.jpg" style="height:150px; weight:150px;" align="center"></a></li>
						<li><a href="#" style="font-size:20px;" align="center">회원정보조회</a></li>
						<li><a href="#" style="font-size:20px;" align="center">회원정보수정</a></li>
						<li><a href="./removeEmailId.cookie" style="font-size:20px;" align="center">로 그 아 웃</a></li>
					</ul>
					</button>
				</li>
   		 </ul>
   		 
</nav>
<%
	} else { // 로그인 안된 화면
%>

</head>
<html>

<nav class="navbar navbar-expand-lg navbar-blue bg-blue">
<a class="navbar-brand" href="main.jsp"><img src="./images/sir.gif" height="100" width="200"></a>
	<div class="collapse navbar-collapse" id="navbarColor01">
    	<form class="form-inline login-1" action="./login.mem" method="post">
      	<div class="input-group">
      		<span class="input-group-addon"><img src="images/login.jpg"></span>
			<input id="loginemail" type="email" class="form-control" name="loginemail" value="" placeholder="Email Address">                                        
		</div>
	 	<div class="input-group">
      		<span class="input-group-addon"><img src="images/password.jpg"></span>
         	<input id="loginpass" type="password" class="form-control" name="loginpass" value="" placeholder="Password">                                        
      	</div>
	 	<button type="submit" class="btn btn-primary">Login</button>
    	</form>
	</div>
</nav>
<%
	}
%>
</html>