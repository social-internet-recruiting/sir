
<%@page import="net.member.db.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>JSP 게시판 웹 사이트</title>
<%
	Cookie[] cookies = request.getCookies();
	MemberDao memDao = new MemberDao();
	String email = memDao.getEmailInCookie(cookies);

	if(email != null){ //email 값 있으니깐 로그인 화면으로
%>
	<h1>TOP 부분이에요 성웅씨 여기 꾸며 주세요</h1>
<%
	} else { // 로그인 안된 화면
%>  

</head>
<html>
<header>
<a class="navbar-brand" href="main.jsp"><img src="./images/sir.gif" height="100" width="200"></a>
<nav class="navbar navbar-expand-lg navbar-blue bg-blue">

<button class="navbar-toggler" aria-expanded="false" aria-controls="navbarColor01" aria-label="Toggle navigation" type="button" data-toggle="collapse" data-target="#navbarColor01">
	<span class="navbar-toggler-icon"></span>
</button>
	<div class="collapse navbar-collapse" id="navbarColor01">
    	<ul class="navbar-nav mr-auto">
    	<form class="form-inline my-2 my-lg-0" style="margin-left:130px;">
    	<input class="form-control mr-sm-2" type="text" placeholder="Search">
     	<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
    	</form>
			<li class="nav-item active">
    	    	<a class="nav-link" href="main.jsp" style="margin-left:100px;">Home <span class="sr-only">(current)</span></a>
    	  	</li>
    	  	<li class="nav-item">
    	    	<a class="nav-link" href="#">About</a>
   			</li>
   		 </ul>
    	<form class="form-inline my-2 my-lg-0">
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
</header>
<%
	}
%>
</html>