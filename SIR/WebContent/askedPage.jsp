<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<style>

</style>
<body style="background-color:gray; z-index: 0;">

	<div class="container" style="background-color:#fff;margin-top:-20px">
		<div class="row" style="margin:50px 0 50px 0">

		<h1>알림 List</h1>
		<c:if test="${empty mainContents}">
			요청이 없습니다.
		</c:if>
		<c:forEach var="mainContents" items="${mainContents}">
			<div>
				${mainContents} 님이 친구 요청 하였습니다.
				<input type="button" value="수락" onclick="askFriendAccept('${mainContents}');"/>
				<input type="button" value="거절" onclick="askFriendReject('${mainContents}');"/>
			</div>
      	</c:forEach>
	</div>

</body>

	<script src="./js/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/jquery-1.9.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<!-- ./js/bootstrap.js 이거 두번해야지 에러 안뜨네 진짜 거지 같네 .... -->
	
	<script src="./js/asked.js"></script>
	
</html>