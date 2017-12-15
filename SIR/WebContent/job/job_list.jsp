<%@page import="net.job.model.jobDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
 	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;
	int numPerPage = 10; //페이지당 레코드수
	int pagePerBlock = 10; //블럭당 페이지수
	int totalPage = 0; //전체 페이지수
	int totalBlock = 0; //전체 블럭수
	int nowPage = 1; //현재페이지
	int nowBlock = 1; //현재블럭
	
	int start = 0; //디비의 select 시작번호
	int end  = 10; //시작번호로부터 가져올 select 갯수
	int listSize = 0; //현재 읽어온 게시물수

	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	if(request.getParameter("numPerPage")!=null){
		numPerPage = Integer.parseInt(request.getParameter("numPerPage"));
	}
	

	start = (nowPage*numPerPage)-numPerPage;
	end = start+numPerPage;

	if(request.getParameter("totalCount") != null){
		totalRecord = Integer.parseInt(String.valueOf(request.getAttribute("totalCount"))); 

	}
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock); 
%>	


<script type="text/javascript">

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>총 게시글 : ${requestScope.totalCount }</h2>



	<table class="table">
		<tr>
			<td>
				<%=totalRecord%>Articles(<%=nowPage%>/<%=totalPage%>Pages)
			</td>
		</tr>
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