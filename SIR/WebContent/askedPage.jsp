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
.list-group-button {
  position: relative;
  display: block;
  padding: 10px 15px;
  margin-bottom: -2px;
}

.list-group-text {
  position: relative;
  display: block;
  padding: 10px 10px;
  border: 1px solid black;
}

.list-group-choice {
  position: relative;
  display: block;
  padding: 10px 10px;
  border: 1px solid red;
}

.wrapper-friends {
      width:100%; height: 100%; background-image: url( "../images/friend.gif" );
}

</style>
<body class="wrapper-friend" style="background-color:gray; z-index: 0;">

	<div class="container" style="background-color:#fff;margin-top:-22px">
		<div class="row" style="margin:50px 0 50px 0">
		<div class="btn-warning">
			<h1>알림 List</h1>
		</div>
		
		<c:if test="${empty mainContents}">
			<h1>요청이 없습니다.</h1>
		</c:if>
<%-- 		<c:forEach var="mainContents" items="${mainContents}">
 --%>			<div class="list-group">
 				<div class="list-group-text" style="width:60%;float:left;height:auto;border-radius: 4px;">
 					<em style="font-size:22px;color:green;"><b>${mainContents} </b></em> <b style="font-size:22px;">&nbsp;님의 친구 요청!</b>
 				</div>
 				<div class="list-group-failed btn btn-outline-info" style="width:20%;float:left;height:auto;">
 					<div class="list-group-button" style="font-size:15px; width:100%; height:auto;" value="수락" onclick="askFriendAccept('${mainContents}');">수락</div>
 				</div>				
				<div class="list-group-failed btn btn-outline-danger" style="width:20%;float:left;height:auto; ">
					<div class="list-group-button" style="font-size:15px; width:100%; height:auto%;" value="거절" onclick="askFriendReject('${mainContents}');">거절</div>
				</div>
			</div>
<%-- 		</c:forEach>
 --%>	</div>
	</div>

</body>

	<script src="./js/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/jquery-1.9.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<!-- ./js/bootstrap.js 이거 두번해야지 에러 안뜨네 진짜 거지 같네 .... -->
	
	<script src="./js/asked.js"></script>
	
</html>