<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<title>Insert title here</title>
</head>
<style>
.right {
    left: 10px;
    width: auto;
    border: 3px solid #73AD21;
    padding: 10px;
}
header ul{
	float: right;
}
header:after{
	display: block;
	content:"";
	clear: both;
}
.myInfo {
  width: 600px; 
  padding-left:15px;
  padding-right:15px;
  margin: 50px auto 50px auto;
}

.tag {
	center:0;
	float:left;
	margin-left:10px;
}
#nav
 {
  list-style-type:none;
 }

#nav li
 {
  background:url(images/page_btn_next.gif) no-repeat 0 50%;
  padding-left:25px;
 }
  
 #nav a
 {
  font-weight:bold;
  font-size:12px;
  text-decoration:none;
  color:#7878E1;
 }

#nav a.active, #nav a:hover
 {
  color:#00008C;
 }

</style>

<body>
	<jsp:include page="/include/top.jsp"/>
	<header>
	<div class="myInfo">
	<div>
		<div style="float:left">
			<a><img src="./images/profile.jpg" height="auto" weight="auto"></a>
		</div>		
		<div class="tag">
			<div>
				<h1>nespia@nate.com</h1>
			</div>
			<div style="margin:10px auto 10px auto;">
				<span >게시물<span>0</span></span>
				<span >친구<span>0</span></span>
			</div>
			<div>
				<a>홍길동</a>
			</div>
			<div style="margin:10px auto 10px auto;">
				<a>010-0000-0000</a>
			</div>
				<div style="margin-left:100px">
					<button class="btn btn-outline-success" type="button"
						data-toggle="modal" data-target="#myModal">정보수정</button>
				</div>

				<!-- Modal -->
				<div class="modal" id="myModal" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4>회원정보 수정</h4>
								<button type="button" class="close" style="float: right"
									data-dismiss="modal">&times;</button>
							</div>
							
							<table style="float:left">
								<nav>
									<div>
										<div><a>프로필 수정</a></div>
									</div>
									<div>
										<div><a>프로필 수정</a></div>
									</div>
									<div>
										<div><a>프로필 수정</a></div>
									</div>
									<div>
										<div><a>프로필 수정</a></div>
									</div>
								</nav>
							</table>
							<table style="float:left">
								<div>
									<input type="text" id="id" value="아이디"/>
								</div>
								<div>
									<input type="text" id="id" value="아이디"/>
								</div>
								<div>
									<input type="text" id="id" value="아이디"/>
								</div>
							
							</table>
							

							<div class="modal-footer">
								<input type="submit" class="btn btn-default" value="수정" />
							</div>
						</div>

					</div>
				</div>

			</div>
	</div>
	</div>
	</header>
	<jsp:include page="/include/footer.jsp"/>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
</body>
</html>