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
        <script>
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
        
    </script>
</head>
<style>
.container2 {
  width: 600px;
  padding-right: 15px;
  padding-left: 15px;
  margin: 0px auto 50px auto;
  opacity: 0.9; 
  
}
</style>

<body style="background-color:gray;">
<div class="container" style="background-color:white;margin-top:-20px;">
<div style="background-color:white;margin-left:15px;margin-right:15px;">
<div class="" style="width:64%; float:left;">
<h2>SNS</h2>
</div>
<div class="row">
    <div class="" style="width:64%; float:left;" id="cool">
    <ul class="list-group">
 	 	<li class="list-group-item">
	      	<textarea style="resize: none;" class="form-control" id="content" name="content" rows="10"></textarea>
	    </li>
  		<li class="list-group-item">
			<input type="submit" class="btn btn-default" value="작성완료"/>
	    </li>
	</ul>
	</div>
	<div class="container"style="width:64%;float:left;">
	<div class="row">
		<div class="">
		<div class="list-group">
			<div class="list-group-item" align="left">
				<a><img src="./images/noneProfile.jpg" style="height:50px; weight:50px;" > abced@naver.com</a>		
			</div>
			<a align="left" style="height:400px;" class="list-group-item"><img src="./images/back3.jpg" style="width:104%; height:400px; margin-left:-15px; margin-top:-10px;"></a>
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
	</div>

	
	<!-- 기본 트윗 5개 -->
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
		</c:forEach>
	  

	
    <!-- 친구목록 영역 -->
    <div style="width:34%; float:right;background-color:white; margin-top:-250px;">
    <ul class="list-group">
 	 	<li class="list-group-item">Friends List</li>
  		<li class="list-group-item">Friend 1</li>
  		<li class="list-group-item">Friend 2</li>
  		<li class="list-group-item">Friend 3</li>
  		<li class="list-group-item">Friend 4</li>
  		<li class="list-group-item">Friend 5</li>
  		<li class="list-group-item">Friend 6</li>
  		<li class="list-group-item">Friend 7</li>
  		<li class="list-group-item">Friend 8</li>
  		<li class="list-group-item">Friend 9</li>
  		<li class="list-group-item">Friend 10</li>
  		<li class="list-group-item">Friend 11</li>
  		<li class="list-group-item">Friend 12</li>
  		<li class="list-group-item">Friend 13</li>
  		<li class="list-group-item">Friend 14</li>
  		<li class="list-group-item">Friend 15</li>
  		<li class="list-group-item">Friend 16</li>
  		<li class="list-group-item">Friend 17</li>
  		<li class="list-group-item">Friend 18</li>
  		<li class="list-group-item">Friend 19</li>
  		<li class="list-group-item">Friend 20</li>
	</ul>
	</div>
	
  </div>
</div>
</div>
</body>

</html>



