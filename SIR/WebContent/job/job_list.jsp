<%@page import="java.util.Date"%>
<%@page import="net.job.model.jobDTO"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	int totalCount = 0; // job total 개수
	int numPerPage = 5; // 한페이지당 보여질 글 개수
	int pagePerBlock = 3; // 하나의 블럭당 보여질 페이지 개수
	int totalPage = 0; // total page 수
	int totalBlock = 0; // total block 수
	int nowPage = 0; // 현재 페이지 번호
	int nowBlock = 0; // 현재 블럭 번호
	int beginPerPage = 0; // 각각의 페이지마다 보여질 시작 글번호
	
	Vector v = (Vector)request.getAttribute("v");
	totalCount = v.size();
	
	/* 현재 사용자에게 보여질 페이지번호 */
	if(request.getAttribute("nowPage") != null){
		nowPage = Integer.parseInt(request.getAttribute("nowPage").toString());
	}
	
	/* 페이지마다 보여질 시작 글번호 구하기 */
	beginPerPage = nowPage * numPerPage;
	
	/* 총 페이지 수 구하기 */
	totalPage = (int)Math.ceil((double)totalCount / numPerPage);
	
	/* 현재 사용자에게 보여질 블럭번호 구하기 */
	if(request.getAttribute("nowBlock") != null){
		nowBlock = Integer.parseInt(request.getAttribute("nowBlock").toString());
	}
	
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);
%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>총 게시글 : ${requestScope.Count }</h2>
	<h2>총 게시글2: <%=totalCount%></h2>


	<table class="table">
		<tr align="center">
			<td>번호</td>
			<td>기업명</td>
			<td>제목</td>
			<td>지원자격</td>
			<td>근무조건</td>
			<td>마감일</td>
		</tr>
<%-- 		<c:set var="v" value="${requestScope.v }" />	 --%>
<%-- 		<c:forEach var="v" items="${requestScope.v}"> --%>
		<%
		for(int i=beginPerPage; i<(beginPerPage+numPerPage); i++){
			if(i == totalCount){
				break;
			}
			jobDTO dto = (jobDTO)v.get(i);
			int job_idx = dto.getJob_idx();
			String co_title = dto.getCo_title();
			String recruit_notice = dto.getRecruit_notice();
			String qualify_school1 = dto.getQualify_school1();
			String qualify_career1 = dto.getQualify_career1();
			String position = dto.getPosition();
			int salary1 = dto.getSalary1();
			int salary2 = dto.getSalary2();
			Date applicate_period2 = dto.getApplicate_period2();
		%>
			<tr align="center">
				<td><%=job_idx %></td>
				<td><%=co_title %></td>
				<td><%=recruit_notice %></td>
				<td><%=qualify_school1 %> | <%=qualify_career1 %></td>
				<td><%=position %><br/><%=salary1 %> ~ <%=salary2 %></td>
				<td><%=applicate_period2 %><br/></td>
			</tr>
			<%-- <tr align="center">
				<td>${v.job_idx}</td>
				<td>${v.co_title}</td>
				<td><a href="#" onclick="window.open('job_detail.job?job_idx=${v.job_idx}','${v.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">${v.recruit_notice}</a></td>
				<td>${v.qualify_school1}| ${v.qualify_career1}</td>
				<td>${v.position}<br/> ${v.salary1} ~ ${v.salary2}
				</td>
				<td>${v.applicate_period2}<br/></td>
			</tr> --%>
		<%
		}
		%>	
<%-- 		</c:forEach> --%>
		
		<tr>
			<td colspan="3" align="center">
				go to page
				<% if(totalCount != 0){ %>
					<% if(nowBlock > 0){ %>
						<a href="./job_main.job?nowBlock=<%=nowBlock-1%>&nowPage=<%=((nowBlock-1)*pagePerBlock)%>">
						이전<%= pagePerBlock %>개</a>
					<% } %>
					:::
					<% for(int i=0; i<pagePerBlock; i++){ %>
						<a href="./job_main.job?nowBlock=<%=nowBlock%>&nowPage=<%=(nowBlock*pagePerBlock)+i%>">
						<%= (nowBlock*pagePerBlock)+ i + 1 %></a>
						<% if((nowBlock*pagePerBlock)+ i + 1 == totalPage) break; %>
					<% } %>
					:::
					<% if(totalBlock > nowBlock + 1){ %>
						<a href="./job_main.job?nowBlock=<%=nowBlock+1%>&nowPage=<%=((nowBlock+1)*pagePerBlock)%>">
						다음 <%=pagePerBlock %>개</a>
					<%} %>
				<%} %>	
			</td>
		</tr>
	</table>



</body>
</html>