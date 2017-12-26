<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
</head>
<style>

#profileImageMain{
	height: 180px;
	width: 180px;
}

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



/*  bhoechie tab */
div.bhoechie-tab-container1{
  z-index: 10;
  background-color: #ffffff;
  padding: 0 !important;
  border-radius: 4px;
  -moz-border-radius: 4px;
  border:1px solid #ddd;
  margin-top: 20px;
  margin-left: 50px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
}
div.bhoechie-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.bhoechie-tab-menu div.list-group{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a .glyphicon,
div.bhoechie-tab-menu div.list-group>a .fa {
  color: #5A55A3;
}
div.bhoechie-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a.active,
div.bhoechie-tab-menu div.list-group>a.active .glyphicon,
div.bhoechie-tab-menu div.list-group>a.active .fa{
  background-color: #5A55A3;
  background-image: #5A55A3;
  color: #ffffff;
}
div.bhoechie-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 50%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #5A55A3;
}

div.bhoechie-tab-content{
  background-color: #ffffff;
  /* border: 1px solid #eeeeee; */
  padding-left: 20px;
  padding-top: 10px;
}

div.bhoechie-tab div.bhoechie-tab-content:not(.active){
  display: none;
}

.container2 {
  width: 600px;
  padding-right: 15px;
  padding-left: 15px;
  margin: 0px auto 50px auto;
  opacity: 0.9; 
  
}

.photosize {
  width: 380px;
  height: 380px;
}
 
</style>
<body style="background-color:gray; z-index: 0;">

	<div class="container" style="background-color:#fff;margin-top:-20px">
		<div class="row" style="margin:50px 0 50px 0">
		<div class="col-sm-2"></div>
			<div class="col-sm-3" style="margin:10px 0 10px 0;">	
				<a><img src="${requestScope.mdto.img}" id="profileImageMain" ></a>
			</div>		
			<div class="col-sm-2">
				<div>
					<input type="hidden" value="${requestScope.mdto.email}" id="friend" name="friend" />
					<h1>${requestScope.mdto.email}</h1>
				</div>
				<div style="margin:10px 0 10px 0;">
					<span>게시물	 <span>0</span></span>
					<span>친구 <span>0</span></span>
				</div>
				<div>
					<a style="cursor:pointer;">${requestScope.mdto.name}</a>
				</div>
				<div style="margin:10px auto 10px auto;">
					<a style="cursor:pointer;">${requestScope.mdto.phone}</a>
				</div>
			</div>
		</div>
		
		<!-- 게시물 스크랩 -->
		<div>
		<div class="row">
		<div class="col-sm-5"></div>
			<ul class="nav nav-tabs" role="tablist" id="">
			  <li role="presentation" class="active"><a href="#snsScrollAddInfo" aria-controls="snsScrollAddInfo" role="tab" data-toggle="tab" style="font-size:20px;">게시물</a></li>
			  <li role="presentation"><a href="#B" aria-controls="B" role="tab" data-toggle="tab" style="font-size:20px;">스크랩</a></li>
			</ul>
		</div>
		<div class="tab-content row">
			<!-- 친구 게시글 -->
			<div role="tabpanel" class="tab-pane active" id="snsScrollAddInfo">  
			</div>
			  
			<div role="tabpanel" class="tab-pane" id="B">
				<a>스크랩</a>
			</div>
		</div><!--End of tab-content--><hr/>
				<!-- End of job_check_one -->
		</div>
	</div>
	
</body>
	<script src="./js/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>
	<script src="./js/jquery-1.6.1.min.js"></script>
	
	<script src="./js/infiniteScrollInfo.js"></script>
</html>