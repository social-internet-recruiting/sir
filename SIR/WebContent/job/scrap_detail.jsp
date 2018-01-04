<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<title>�������</title>
</head>
<body>
	<c:set var="dto" value="${dto}"/>
	<div class="container">
		<table class="table">
			<tr>
				<td><h1>${dto.co_title}</h1></td>
			</tr>
			<tr>
				<td>ȸ���ּ�</td>
				<td>${dto.co_addr}</td>
			</tr>
			<tr>
				<td>������</td>
				<td>${dto.establish}</td>
			</tr>
			<tr>
				<td>�����</td>
				<td>${dto.sales}</td>
			</tr>
			<tr>
				<td>�����</td>
				<td>${dto.employees}��</td>
			</tr>
		</table>
		<h2>�����䰭</h2>
		<hr size="3" color="black"/>
		<p>������: ${dto.duty}</p>
		<hr size="1">
		<p>�ٹ�����: ${dto.position}</p>
		<hr size="1">
		<p>�����ο�: ${dto.recruit_volume}��</p>
		<hr size="1">
		<p>�޿�:${dto.income_up}����</p>
		<hr size="1">
		�����ڰ�
		<p>
			�з� : ${dto.qualify_up} / ${dto.qualify_down }<br/>
			���:  ${dto.career_up} / ${dto.career_down }<br/>
			�ڰ���: ${dto.qualify_license}<br/>
			�������: ${dto.prefer}<br/>
		</p>
		<h2>�����Ⱓ �� ���</h2>
		<hr size="3" color="black"/>
		<p>�����Ⱓ: ${dto.applicate_period1} ~ ${dto.applicate_period2}</p>
		<hr size="1">
		<p>�������: ${dto.form},${dto.reception}</p>
		<hr size="1">
		<p>���� ����: ${dto.job_process}</p>
		<hr size="1">
</div><!-- End of container -->
</body>

   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="./js/bootstrap.js"></script>
</html>

