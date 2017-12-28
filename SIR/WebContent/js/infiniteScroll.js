
$(document).ready(function (event){
	
	var idxnum;
	
	$(window).scroll(function(){
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();
		
        //스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
        if(scrollHeight == documentHeight){
        	infiniteScrollAjaxMethod();	
        }
        
    });
	

	function infiniteScrollAjaxMethod(){
		$.ajax({ 
			type: "get",
			url: "./infiniteScroll.snsboard",
			data: ({idxnum: idxnum}), 
	        success : function(data){
	        	// 현재 loading 된 idxnum 기록, 
	        	dataArr = data.split("#%&@#");
	        	postdata = dataArr[0]; // post 내용
	        	$('#snsScrollAdd').append(postdata);  
	        	idxnum = dataArr[1]; // 마지막 게시글 번호 저장
	        }
	   }); 
	}
	
	// 초기 실행(처음 게시글 뿌려주기 위함)
	infiniteScrollAjaxMethod();
	
});
