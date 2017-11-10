<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
<!-- header 부분  시작-->
<header>
<jsp:include page="/include/top.jsp"/>
</header>
<!-- header 부분 끝 -->
<center class="container" style="background-color:#E1F5FA">
<form>
	<div>&nbsp;</div>
  	<h2>이메일 인증 절차</h2>
    <div class="form-group" >
    	<p>작성해주신 이메일로 인증번호를 전송하였습니다.</p>
		<input class="form-control" id="emailpass" type="text" placeholder="Write here" >
		<small class="form-text text-muted" id="emailHelp">인증번호를 입력해주세요.</small>
    </div>
    <button class="btn btn-primary" type="submit">인증</button>
    <div>&nbsp;</div>
</form>
</center>	
<!-- footer 부분 시작 -->
<footer>
<jsp:include page="/include/footer.jsp"/>
</footer>	
<!-- footer 부분 끝 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
</body>
</html>