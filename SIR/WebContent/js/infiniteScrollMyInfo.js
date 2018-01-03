
$(document).ready(function (event){
	
	// myinfo 게시글용
	var idxnumMyinfo;
	
	$(window).scroll(function(){
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();
        var subtract = documentHeight - scrollHeight; 
        //스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
        if(subtract<3){
        	infiniteScrollMyInfoAjaxMethod();	
        }
        
    });
	
	function infiniteScrollMyInfoAjaxMethod(){
		
		$.ajax({ 
			type: "get",
			url: "./infiniteScrollMyInfo.snsboard",
			data: ({idxnuminfo: idxnumMyinfo}), 
	        success : function(data){
	        	//alert(data);
	        	// 현재 loading 된 idxnum 기록,
	        	dataArr = data.split("#%&@#");
	        	postdata = dataArr[0]; // post 내용
	        	$('#snsScrollAddMyInfoForPost').append(postdata);  
	        	idxnumMyinfo = dataArr[1]; // 마지막 게시글 번호 저장
	        } ,
        	error : function(){ 
        		alert('실패000 '); 
        	}
	   }); 
	}
	
	// 초기 실행(myinfo 처음 게시글 뿌려주기 위함)
	infiniteScrollMyInfoAjaxMethod();
	
	// scrap 용
	var idxnumMyScrap;
	
	$(window).scroll(function(){
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();
        var subtract = documentHeight - scrollHeight; 
        //스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
        if(subtract<3){
        	infiniteScrollMyScrapAjaxMethod();	
        }
        
    });

	

	function infiniteScrollMyScrapAjaxMethod(){
		
		$.ajax({ 
			type: "get",
			url: "./infiniteScrollMyScrap.snsboard",
			data: ({idxnumScrap: idxnumMyScrap}), 
	        success : function(data){
	        	//alert(data);
	        	// 현재 loading 된 idxnum 기록,
	        	dataArr = data.split("#%&@#");
	        	postdata = dataArr[0]; // post 내용
	        	$('#snsScrollAddMyInfoForScrap').append(postdata);  
	        	idxnumMyinfo = dataArr[1]; // 마지막 게시글 번호 저장
	        } ,
        	error : function(){ 
        		alert('실패111 '); 
        	}
	   }); 
	}
	
	// 초기 실행(myinfo 처음 게시글 뿌려주기 위함)
	infiniteScrollMyScrapAjaxMethod();
	
});
