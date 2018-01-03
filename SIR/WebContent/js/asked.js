function askFriend(askedId){

	$.ajax({
		type: "get",
		url: "./askFriend.snsboard",
		data: ({askedId: askedId}), 
		success: function(data) {
			if (data == 0){
				alert(askedId + " 님이 친구거나, 이미 친구 요청 했습니다.");
			} else {
				alert(askedId + " 님에게 친구 요청 하였습니다.");
			}
		}
	});
}

function askFriendAccept(askingId){
	if (confirm("수락 하시겠습니까?")){
		location.href = "./askFriendAccept.snsboard?askingId=" + askingId; 
	}
}

function askFriendReject(askingId){
	if (confirm("취소 하시겠습니까?, 취소하면 목록에서 지워집니다.")){
		location.href = "./askFriendReject.snsboard?askingId=" + askingId;
	}
}