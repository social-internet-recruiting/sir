<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table class="table"><tr align="center">
         <th>기업명</th>
         <th>제목</th>
         <th>지원자격</th>
         <th>근무조건</th>
         <th>마감일</th>
      </tr>
      
      <c:forEach var="v" items="${requestScope.v}">
      <tr align="center">
         <td>${v.co_title}</td>
         <td>${v.recruit_notice}</td>
         <td>${v.qualify_school1} | ${v.qualify_career1}</td>
         <td>${v.position}<br/>
            ${v.salary1} ~ ${v.salary2}
         </td>
         <td>${v.applicate_period2}<Br/></td>
      </tr>
      </c:forEach>
      
</table>



</body>
</html>