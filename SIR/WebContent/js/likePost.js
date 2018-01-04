function likePost(idx){
	// countPlus, countMinus 는 forwardLikeCount.js 파일안에 있음
	$.ajax({
		type: "get",
		url: "./likePost.snsboard",
		data: ({postIdx: idx}), 
		success: function(data) {
			if (data == 1){ // like count 추가 됨
				alert("좋아요 되었습니다.");
				how = "plus";
				calculator(idx,how);
			} else { // like count 감소 됨
				alert("좋아요 해제 되었습니다.");
				how = "minus";
				calculator(idx,how);
			}
		}
	});
}