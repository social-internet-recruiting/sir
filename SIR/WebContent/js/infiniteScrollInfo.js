
$(document).ready(function (event){
	
	var idxnuminfo;
	
	$(window).scroll(function(){
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();
        var subtract = documentHeight - scrollHeight; 
        //스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
        if(subtract<3){
        	infiniteScrollInfoAjaxMethod();	
        }
        
    });
	

	function infiniteScrollInfoAjaxMethod(){
		try{
			var friend = document.getElementById("friend").value;
			// 친구값 조회시 에러 안나면 친구 조회
			urlText = "./infiniteScrollInfo.snsboard?friend="+friend;
			
		} catch(e) {
			// 친구값 조회시 에러 나면 본인 조회 
			urlText = "./infiniteScrollInfo.snsboard";
		}
		
		$.ajax({ 
			type: "get",
			url: urlText,
			data: ({idxnuminfo: idxnuminfo}), 
	        success : function(data){
	        	// 현재 loading 된 idxnum 기록, 
	        	dataArr = data.split("#%&@#");
	        	postdata = dataArr[0]; // post 내용
	        	$('#snsScrollAddInfo').append(postdata);  
	        	idxnuminfo = dataArr[1]; // 마지막 게시글 번호 저장
	        } ,
        	error : function(){ 
        		alert('실패 '); 
        	} 
	   }); 
	}
	
	// 초기 실행(info 처음 게시글 뿌려주기 위함)
	infiniteScrollInfoAjaxMethod();
	
});
