<%@page import="net.cookie.controller.CookieAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>JSP 게시판 웹 사이트</title>
<%
	Cookie[] cookies = request.getCookies();
	CookieAction cookieAction = new CookieAction();
	String email = cookieAction.getEmailInCookie(cookies);

	if(email != null){ //email 값 있으니깐
%>
	<script type="text/javascript">
		location.href="./main.jsp?center=snspage.jsp";
	</script>
<%	
	} 
%>  
<!-- 	
	[정영현 17.11.12 일 22:36] onsubmit 으로 비밀번호, emailId 중복체크 하기 위해 로직 삽입함, 
	체크후 글자 뿌려줘야 되니깐 span도 삽입함 
-->
<script type="text/javascript" src="./js/register.js"></script>
</head>
<body class="wrapper">
<div class="logo1"><img src="./images/sir1.gif"></div>
<center class="container1" style="background-color:#E1F5FA;">
<form action="./SendEmailToCert.email" method="post" onsubmit="return checkForm();">
  	<div>&nbsp;</div>
  <fieldset>
    <h2>회원가입</h2>
    <div class="form-group" align="left">
      <label for="email">이름</label>
      <input class="form-control" id="name" name="name" type="text" placeholder="Full Name" required />
    </div>
   	<div class="form-group" align="left">
      <label for="email">이메일</label>
      <input class="form-control" id="email" name="email" type="email" placeholder="Enter email" onkeyup="checkId();" required />
      <small class="form-text text-muted" id="emailHelp">아이디로 사용하실 이메일 주소를 작성해주세요.</small><br/>
      <span id="idCheck" style="display:none" >&nbsp;</span>
    </div>
    <div class="form-group" align="left">
      <label for="pass">비밀번호</label>
      <input class="form-control" id="pass" name="pass" type="password" placeholder="Password" onkeyup="checkPass();" required />
      <small class="form-text text-muted" id="passHelp">비밀번호는 6자 이상으로 작성해주세요.</small><br/>
      <span id="passCheck" style="display:none" >&nbsp;</span>
    </div>
    <button class="btn btn-primary" type="submit">가입하기</button>
    <div>&nbsp;</div>
<!--     <div>
      <button class="btn btn-facebook" href="#"><img src="./images/facebook2.png" height="30" weight="30">&nbsp;&nbsp;&nbsp;facebook으로 로그인하기</button>
    </div> -->
    <div>&nbsp;</div>
  </fieldset>
</form>
</center>
</body>
</html>