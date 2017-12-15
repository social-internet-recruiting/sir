<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기업정보</title>
</head>
<body>
	<c:set var="dto" value="${dto}"/>
	<div class="container">
		<table class="table">
			<tr>
				<td><h1>${dto.co_title}</h1></td>
			</tr>
			<tr>
				<td>마감날짜:</td>
				<td><font color="red">~${dto.applicate_period2}</font>남음</td>
			</tr>
			<tr>
				<td><img width="150" height="150" src="./job/image/${dto.logo}" /></td>
				<td>${dto.co_title}</td>
			</tr>
			<tr>
				<td>설립일</td>
				<td>${dto.establish}</td>
				<td>매출액</td>
				<td>${dto.sales}</td>
			</tr>
			<tr>
				<td>사원수</td>
				<td>${dto.employees}</td>
				<td>기업형태</td>
				<td>${dto.co_type}</td>
			</tr>
			<tr>
				<td>회사주소</td>
			</tr>
		</table>
		<h2>모집요강</h2>
		<hr size="3" color="black"/>
		<p>담당업무: ${dto.duty}</p>
		<hr size="1">
		<p>근무형태: ${dto.position}</p>
		<hr size="1">
		<p>모집인원: ${dto.recruit_volume}</p>
		<hr size="1">
		<p>급여: ${dto.salary1} ~ ${dto.salary2}</p>
		<hr size="1">
		지원자격
		<p>
			학력 : ${dto.qualify_school1}<br/>
			경력:  ${dto.qualify_career1}<br/>
			자격증: 우대 => ${dto.qualify_license}<br/>
			우대조건: ${dto.prefer}<br/>
		</p>
		<h2>접수기간 및 방법</h2>
		<hr size="3" color="black"/>
		<p>접수기간: ${dto.applicate_period1} ~ ${dto.applicate_period2}</p>
		<hr size="1">
		<p>접수양식: ${dto.form},${dto.reception}</p>
		<hr size="1">
		<p>전형 절차: ${dto.job_process}</p>
		<hr size="1">
		
	</div><!-- End of container -->
</body>
</html>