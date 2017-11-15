<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--jstl core라이브러리 사용을 위한 선언 (jstl 태그 사용을 위한 선언) --%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">

<title>Insert title here</title>
</head>
<body>

<c:set var="center" value="${param.center}"/>
<c:if test="${center == null}">
	<c:set var="center" value="/include/register.jsp"/>
</c:if>
 
<!-- header 부분  시작-->
<header>
<jsp:include page="/include/top.jsp"/>
</header>
<!-- header 부분 끝 -->
	
<!-- center 부분 시작-->
<center>
<jsp:include page="${center}"/>
</center>

<!-- center 부분 끝 -->
	
<!-- footer 부분 시작 -->
<footer>
<jsp:include page="/include/footer.jsp"/>
</footer>	
<!-- footer 부분 끝 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>