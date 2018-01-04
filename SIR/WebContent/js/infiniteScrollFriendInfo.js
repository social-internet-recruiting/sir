
$(document).ready(function (event){
	
	var idxnumFriendinfo;
	
	$(window).scroll(function(){
        var scrollHeight = $(window).scrollTop() + $(window).height();
        var documentHeight = $(document).height();
        var subtract = documentHeight - scrollHeight; 
        //스크롤이 맨아래로 갔는지 아닌지 확인하는 if문
        if(subtract<3){
        	infiniteScrollFriendlInfoAjaxMethod();	
        }
        
    });
	

	function infiniteScrollFriendlInfoAjaxMethod(){
		// friendInfo.jsp 에 있는 friend 값, js파일 같이 쓰려고 이렇게 됨
		var friend = document.getElementById("friend").value; 

		$.ajax({ 
			type: "get",
			url: "./infiniteScrollFriendInfo.snsboard?friend="+friend,
			data: ({idxnuminfo: idxnumFriendinfo}), 
	        success : function(data){
	        	// 현재 loading 된 idxnum 기록, 
	        	dataArr = data.split("#%&@#");
	        	postdata = dataArr[0]; // post 내용
	        	$('#snsScrollAddFriendInfoForPost').append(postdata);  
	        	idxnumFriendinfo = dataArr[1]; // 마지막 게시글 번호 저장
	        	if (document.getElementById("snsScrollAddFriendInfoForPost").innerHTML.length < 10){ 
	        		// 5글자 보다 적으면 게시글이 없다고 보면 된다.
	        		postdata = "<h1 align='center'>작성된 글이 없습니다.</h1>";
	        		$('#snsScrollAddFriendInfoForPost').append(postdata);
	        	}	
	        } ,
        	error : function(){ 
        		alert('실패 '); 
        	} 
	   }); 
	}
	
	// 초기 실행(myinfo 처음 게시글 뿌려주기 위함)
	infiniteScrollFriendlInfoAjaxMethod();
	
});
