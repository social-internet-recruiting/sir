<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">

<title>Insert title here</title>

</head>
<body>

</head>

<style>
.container1 {
  padding-right: 15px;
  padding-left: 15px;
  margin-right: auto;
  margin-left: auto;
}
.fixedboard {

    position: fixed;
	
    z-index: 999;

}
.list-group-item-img {
    position: relative;
    display: block;
    padding: 0;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd;
}

	/* authimg(게시자 프로필 사진) 크기가 깨지길래... */
	#authImgId{
		height: 50px;
		width: 50px;
	} 
	
</style>

<body style="background-color:gray;">


<div class="container" style="background-color:white;margin-top:-20px;">

	<!-- 친구목록 영역 -->
	<div class="container fixedboard" style="margin-left:-15px; z-index: auto;">
	<!-- z-index auto 하면 안가려지고 뒤로 간다. -->
		<div class="" style="width:74%; float:left;">
		</div>
		<div class="" style="width:25%; float:right;" >
		<ul class="list-group">
	 	 	<li class="list-group-item" 
	 	 	style="border-width: medium; font-size: large; font-style: italic; font-weight: bold;">Friends List</li>
	 	 	<ul class="list-group" style="height:300px; overflow: auto;">
			<c:forEach items="${fList}" var="fLists">
				<a style="cursor:pointer;" align="left"><li class="list-group-item">${fLists}</li></a>
			</c:forEach>
			</ul>
		</ul>
		</div>
	</div>
	<!-- 친구목록 영역 끝 -->
	
<div style="background-color:white;margin-left:15px;margin-right:15px;">


	<!-- 대문 이름 -->
	<div class="" style="width:74%; float:left;" >
		<h2>SNS</h2>
	</div>
	<!-- 대문 이름  끝-->
	
	<!-- 이미지 올리는 form -->
	<form  action=	"" id="fileForm" name="fileForm" method="post" enctype="multipart/form-data" >
		<div style="display:none">
			<input type="file" id="uploadSnsImage" name="uploadSnsImage" accept=".jpg,.png" /><br/>
			<input type="hidden" name="email" id="email" value="${email}" />
		</div>
		<!-- 작성 툴 -->
		<div class="">
		    <div style="width:74%; float:left;" id="cool">
				<div class="list-group">
			 	 	<div class="list-group-item" style="height:280px;">
			 	 		<span class="list-group-item-img" style="float:left; width:35%">
			 	 			<span style="height:220px;">
							<a style="cursor:pointer;" onclick="uploadImage();" >
							<img src="./images/noneImage.jpg" id="snsImageUpload" name="snsImageUpload" 
							style="width:100%; height:234px; padding-left:-15px; " >
							</a>
							</span>
						</span>
						<span class="list-group-item" style="float:right; width:65%">
							<textarea style="resize: none;" class="form-control" id="contents" name="contents" rows="10"></textarea>
						</span>	      	
				    </div>
			  		<div class="list-group-item" style="margin-top:-17px;">
						<input type="button" class="btn btn-default" value="작성완료" onclick="send();"/>
				    </div>
				</div>
			</div>
		</div> <!-- 작성 툴  끝-->
	</form> <!-- 이미지 올리는 form 끝 -->
		
	<!-- 글 목록-->
	<div class="">
	<div style="width:74%;float:left;">
	
		<!-- 실시간 추가 삽입 부분 -->
		<div class="list-group" id="snsSynchronizationAdd">
		</div>
		
		<!-- 
			초기 게시물(원래 있던 본문 내용)은 무한 스크롤 초기 로드로 대체 한다. 
			이래야지 무한스크롤 할때 초기값 한번 더 로드하는 오류 방지 
		-->
		
		<!-- 무한 스크롤 추가 삽입 부분 -->
		<div class="list-group" id="snsScrollAdd">
		</div>
		<!-- 무한 스크롤 추가 삽입 부분 끝 -->
		
	</div>	
	<!-- 글 목록 끝-->
	
</div>	 
</div>
</div>
</body>

<!-- script src 부분 이 위치에 있어야지 제대로 작동하네 거지같네 -->
<script src="./js/jquery-3.1.1.min.js"></script>
<script src="./js/jquery.form.js"></script>
<script src="./js/ajaxSnsImageUpload.js"></script>
<script src="./js/forwardPost.js"></script>
<script src="./js/infiniteScroll.js"></script>
<script src="./js/forwardComment.js"></script>

</html>



