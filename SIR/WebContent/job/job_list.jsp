<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<table class="table">
		<tr align="center">
			<td>기업명</td>
			<td>제목</td>
			<td>지원자격</td>
			<td>근무조건</td>
			<td>마감일</td>
		</tr>

		<c:forEach var="v" items="${requestScope.v}">
			<tr align="center">
				<td>${v.co_title}</td>
				<td><a href="#" onclick="window.open('job_detail.job?job_idx=${v.job_idx}','${v.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">${v.recruit_notice}</a></td>
				<td>${v.qualify_school1}| ${v.qualify_career1}</td>
				<td>${v.position}<br/> ${v.salary1} ~ ${v.salary2}
				</td>
				<td>${v.applicate_period2}<br/></td>
			</tr>
		</c:forEach>

	</table>



</body>
</html>