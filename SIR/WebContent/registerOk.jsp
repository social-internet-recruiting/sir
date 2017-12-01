<%@page import="net.member.model.MemberDAO"%>
<%@page import="net.email.controller.EmailAction"%>
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
	EmailAction emailAction = new EmailAction();
	Cookie[] cookies = request.getCookies();

	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String certcode = request.getParameter("certcode");
	
	if (emailAction.getCertCodeInCookie(cookies, certcode) !=null){ // certcode 값이 있으면  아래 회원정보로 db에 insert

		//member insert 로직 // 아래 자바스크립트 코드도 있으니 insert 만 여기서 처리 
		MemberDAO mdao = new MemberDAO();
		boolean check = mdao.insertMember(name, email, pass);
		if(!check){ // 회원 가입 오류
%>
			<script type="text/javascript">
				alert("member insert 오류 발생했습니다. 관리자에게 문의 하세요");
			</script>
<%		
		} else {
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
		} // 회원가입 유무 판단 끝
		
	} else { // 인증 코드 못받았거나 , 5분이 지났으면
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
			location.href="./saveEmailIdCookie.cookie?email=" + "<%=email%>";
		}

	}
	
	setInterval("chanageSeconds();",1000);
	
</script>

<style type="text/css">
	#changeSeconds{
		border: none;
		font-size: 60px;
		border-radius: 20px;
	}
	#h2TextInRegisterOk{
		font-size: 50px;
	}
	
</style>
</html>