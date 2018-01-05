function showPostMethod(idx){

	$.ajax({
		type: "get",
		url: "./showPost.snsboard",
		data: ({postIdx: idx}), 
		success: function(data) {

			document.getElementById("addModalShowPost").innerHTML = ""; // 내용 클리어
			document.getElementById("hiddenModalButton").click(); // modal show 기능
			$("#addModalShowPost").append(data);
			
		}
	});
}