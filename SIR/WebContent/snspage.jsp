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
<!--         <script>
        var tweets = 1;
        $(document).ready(function (event){
        $(window).scroll(function(){
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();
		
        //스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
        if(scrollHeight == documentHeight){
        	tweets++;
        	$.ajax({ 
        		url:'sns_list.bbs?tweets='+tweets,
                type:'get', 
                success : function(t){ 
                    	$('#cool').append(
                    			'<c:forEach items="${SNSList}" var="dto">'
                    			+'<ul>'
                    			+'<li class="list-group-item">'
                    			+'MEMBER_IMAGE, MEMBER_NAME AREA ${dto.idx}'
                    	   		+'</li>'
                    			+'<li class="list-group-item">'
                    			+'TWEET_IMAGE AREA ${dto.jemok}'
                    	   		+'</li>'
                    			+'<li class="list-group-item">'
                    	      	+'${dto.bonmun}'
                    	    	+'</li>'
                    	   		+'</ul>'
                    	   		+'</c:forEach>'
                    	);
                 } , 
                 
                 error : function(){ 
                              alert('실패 '); 
                  } 
           }); 
        	   

        }
        
        });
        });
        
    </script> -->
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

</style>

<body style="background-color:gray;">


<div class="container" style="background-color:white;margin-top:-20px;">

	<!-- 친구목록 영역 -->
	<div class="container fixedboard" style="margin-left:-15px;">
		<div class="" style="width:64%; float:left;">
		</div>
		<div class="" style="width:34%; float:right;" >
		<ul class="list-group">
	 	 	<li class="list-group-item">Friends List</li>
			<c:forEach items="${fList}" var="fLists">
				<a onclick=""><li class="list-group-item">${fLists}</li></a>
			</c:forEach>
		</ul>
		</div>
	</div>
	<!-- 친구목록 영역 끝 -->

<div style="background-color:white;margin-left:15px;margin-right:15px;">


	<!-- 대문 이름 -->
	<div class="" style="width:64%; float:left;">
		<h2>SNS</h2>
	</div>
	<!-- 대문 이름  끝-->
	
	<!-- 작성 툴 -->	
	<div class="">
    <div style="width:64%; float:left;" id="cool">
    <div class="list-group">
 	 	<div class="list-group-item" style="height:280px;">
 	 		<span class="list-group-item-img" style="float:left; width:35%">
 	 			<span style="height:220px;">
				<a><img src="./images/noneProfile.jpg" style="width:100%; height:234px; padding-left:-15px; " ></a>
				</span>
			</span>
			<span class="list-group-item" style="float:right; width:65%">
				<textarea style="resize: none;" class="form-control" id="contents" name="contents" rows="10"></textarea>
			</span>	      	
	    </div>
  		<div class="list-group-item" style="margin-top:-17px;">
			<input type="submit" class="btn btn-default" value="작성완료"/>
	    </div>
	</div>
	</div>
	<!-- 작성 툴  끝-->	
	
	<!-- 글 목록-->
	<div class="">
	<div style="width:64%;float:left;">
		<div class="list-group">
			<div class="list-group-item" align="left">
				<a><img src="./images/noneProfile.jpg" style="height:50px; weight:50px;" > abced@naver.com</a>		
			</div>
			<a align="left" style="height:400px;" class="list-group-item-img"><img src="./images/back3.jpg" style="width:100%; height:400px;"></a>
			<div class="list-group-item" align="left">
				<a href="#"><img src="./images/좋아요.gif" style="height:25px; weight:25px;"><br/>좋아요 **개</a>
				<br/>
				<a>fgijk@naver.com</a>
				&nbsp;&nbsp;&nbsp;<a>가나다라</a>
			</div>
			<div class="list-group-item" align="left">
				<button class="btn btn-light" style="width:50%">댓글 달기</button><button class="btn btn-light" style="width:50%">댓글 추가</button>
			</div>
			<div class="list-group-item" align="left">
				<button class="btn btn-light" style="width:100%">댓글 더 보기</button>
			</div>
		</div>
	</div>
	</div>
	
	<!-- 글 목록 끝-->

<%-- 	
	<!-- 기본 트윗 5개 좀있다 SNSList 불러올것 -->
		<c:forEach items="${SNSList}" var="dto">
			<ul>
			<li class="list-group-item">
				MEMBER_IMAGE, MEMBER_NAME AREA ${dto.idx}
	   		</li>
			<li class="list-group-item">
				TWEET_IMAGE AREA ${dto.jemok}
	   		</li>
			<li class="list-group-item">
	      		${dto.bonmun}
	    	</li>
	   		</ul>
		</c:forEach> --%>

</div>	 
</div>
</div>
</body>

</html>



