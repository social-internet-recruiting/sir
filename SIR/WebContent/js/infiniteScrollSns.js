
$(document).ready(function (event){
	
	var idxsnsnum;
	
	$(window).scroll(function(){
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();
        var subtract = documentHeight - scrollHeight; 
        //스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
        if(subtract<3){
        	setTimeout(function() { // 시간 간격을 안주면 게시글을 두번 조회하는 오류가 있음
        		infiniteScrollSnsAjaxMethod();
        	}, 500);
        }
        
    });
	

	function infiniteScrollSnsAjaxMethod(){
		$.ajax({ 
			type: "get",
			url: "./infiniteScrollSns.snsboard",
			data: ({idxnum: idxsnsnum}), 
	        success : function(data){
	        	// 현재 loading 된 idxnum 기록, 
	        	dataArr = data.split("#%&@#");
	        	postdata = dataArr[0]; // post 내용
	        	$('#snsScrollAdd').append(postdata);  
	        	idxsnsnum = dataArr[1]; // 마지막 게시글 번호 저장
	        	if (document.getElementById("snsScrollAdd").innerHTML.length < 10){ 
	        		// 5글자 보다 적으면 게시글이 없다고 보면 된다.
	        		postdata = "<h1 align='center'>작성된 글이 없습니다.</h1>";
	        		$('#snsScrollAdd').append(postdata);
	        	}	
	        }
	   }); 
	}
	
	// 초기 실행(처음 게시글 뿌려주기 위함)
	infiniteScrollSnsAjaxMethod();
	
});
