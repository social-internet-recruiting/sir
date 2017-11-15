<%@page import="net.member.db.MemberDao"%>
<%@page import="net.email.action.EmailAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// cookie값 확인
	EmailAction e = new EmailAction();
	Cookie[] cookies = request.getCookies();
	if (e.getCertCodeInCookie(cookies, request.getParameter("certcode")) !=null){ // certcode 값이 있으면  아래 회원정보로 db에 insert
/* 		System.out.println("code값 " + request.getParameter("certcode"));
		System.out.println("email값 " + request.getParameter("email"));
		System.out.println("pass값 " + request.getParameter("pass"));
		System.out.println("name값 " + request.getParameter("name"));
		 */
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		
		//insert 로직
		MemberDao mdao = new MemberDao();
		boolean check = mdao.insertMember(name, email, pass);
		if(!check){
%>
			<script type="text/javascript">
				alert("member insert 오류 발생했습니다. 관리자에게 문의 하세요");
			</script>

<%		
		}

%>
		<h1>환영합니다 회원가입 완료 되었습니다.</h1>
		<table>
			<tr>
				<td>
					<input type="button" id="changeSeconds" value="3" />
				</td>
				<td>
					<h2>초후 로그인 자동 완료</h2>
				</td>
			</tr> 
		</table>
<%		
	} else { 
%>	

		<h1>메일 인증 시간이 지났습니다.</h1>
<%
	}
%>
	
</body>
<script type="text/javascript">
	function chanageSeconds(){
		var seconds = document.getElementById("changeSeconds");

		if (seconds.value == "3"){
			document.getElementById("changeSeconds").value = "2";
		} else if (seconds.value == "2") {
			document.getElementById("changeSeconds").value = "1";
		} else if (seconds.value == "1") {
			document.getElementById("changeSeconds").value = "0";
		} else if (seconds.value == "0") {
			location.href="./main.jsp?center=snspage.jsp"
		}

	}
	
	setInterval("chanageSeconds();",1000);
</script>

<style type="text/css">
	#changeSeconds{
		border: none;
		font-size: 60px;
		border-radius: 10px;
	}
	#h2TextInRegisterOk{
		font-size: 40px;
	}
	
</style>
</html>