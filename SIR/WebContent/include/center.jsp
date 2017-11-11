<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<center class="container" style="background-color:#E1F5FA">
<form method="post" action="emailpass.jsp">
  	<div>&nbsp;</div>
  <fieldset>
    <h2>회원가입</h2>
    <div class="form-group" align="left">
      <label for="email">이름</label>
      <input class="form-control" id="name" type="text" placeholder="Full Name" required >
    </div>
   	<div class="form-group" align="left">
      <label for="email">이메일</label>
      <input class="form-control" id="email" type="email" placeholder="Enter email" required>
      <small class="form-text text-muted" id="emailHelp">아이디로 사용하실 이메일 주소를 작성해주세요.</small>
    </div>
    <div class="form-group" align="left">
      <label for="pass">비밀번호</label>
      <input class="form-control" id="pass" type="password" placeholder="Password" required>
      <small class="form-text text-muted" id="passHelp">비밀번호는 6자 이상으로 작성해주세요.</small>
    </div>
    <button class="btn btn-primary" type="submit">가입하기</button>
    <div>&nbsp;</div>
  </fieldset>
</form>
</center>
</body>
</html>