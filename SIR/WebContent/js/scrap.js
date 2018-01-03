function addScrapMethod(idx){

	$.ajax({
		type: "get",
		url: "./addScrap.snsboard",
		data: ({postIdx: idx}), 
		success: function(data) {
			if (data == 0){
				alert(idx + " 글은 이미 스크랩 되어 있습니다.")
			} else {
				alert(idx + " 글이 스크랩 되었습니다.")	
			}
		}
	});
}