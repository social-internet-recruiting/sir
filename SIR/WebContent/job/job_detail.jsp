<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
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
				<td>회사주소</td>
				<td>${dto.co_addr}</td>
			</tr>
			<tr>
				<td>설립일</td>
				<td>${dto.establish}</td>
			</tr>
			<tr>
				<td>매출액</td>
				<td>${dto.sales}</td>
			</tr>
			<tr>
				<td>사원수</td>
				<td>${dto.employees}명</td>
			</tr>
		</table>
		<h2>모집요강</h2>
		<hr size="3" color="black"/>
		<p>담당업무: ${dto.duty}</p>
		<hr size="1">
		<p>근무형태: ${dto.position}</p>
		<hr size="1">
		<p>모집인원: ${dto.recruit_volume}명</p>
		<hr size="1">
		<p>급여: ${dto.income_up}만원</p>
		<hr size="1">
		지원자격
		<p>
			학력 : ${dto.qualify_up} / ${dto.qualify_down }<br/>
			경력:  ${dto.career_up} / ${dto.career_down }<br/>
			자격증: ${dto.qualify_license}<br/>
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

		<form action="job_scrap.job" method="post">
		    <input type="hidden" value="${dto.job_idx }" name="job_idx" />
			<input type="hidden" value="${id}" name="email" />
			<input type="hidden" value="${dto.recruit_notice}" name="recruit_notice" />
			<input type="hidden" value="${dto.co_title}" name="co_title" />
			<input type="hidden" value="${dto.co_addr}" name="co_addr" />
			<input type="hidden" value="${dto.establish}" name="establish" />
			<input type="hidden" value="${dto.sales}" name="sales" />
			<input type="hidden" value="${dto.employees}" name="employees" />
			<input type="hidden" value="${dto.duty}" name="duty" />
			<input type="hidden" value="${dto.position}" name="position" />
			<input type="hidden" value="${dto.recruit_volume}" name="recruit_volume" />
			<input type="hidden" value="${dto.income_up}" name="income_up" />
			<input type="hidden" value="${dto.qualify_down}" name="qualify_down" />
			<input type="hidden" value="${dto.qualify_up}" name="qualify_up" />
			<input type="hidden" value="${dto.career_down}" name="career_down" />
			<input type="hidden" value="${dto.career_up}" name="career_up" />
			<input type="hidden" value="${dto.qualify_license}" name="qualify_license" />
			<input type="hidden" value="${dto.prefer}" name="prefer" />
			<input type="hidden" value="${dto.applicate_period1}" name="applicate_period1" />
			<input type="hidden" value="${dto.applicate_period2}" name="applicate_period2" />
			<input type="hidden" value="${dto.form}" name="form" />
			<input type="hidden" value="${dto.reception}" name="reception" />
			<input type="hidden" value="${dto.job_process}" name="job_process" />
			<input class="btn btn-info" type="submit" value="공고하기" onclick="javascript:alert('공고하기가 완료되었습니다');" />
		</form>
	</div><!-- End of container -->
</body>

   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="./js/bootstrap.js"></script>
</html>