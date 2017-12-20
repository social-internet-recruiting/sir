function fileUpload() {

	$('#fileForm').ajaxForm({
		
		// url full 경로 해야지 되네 좆같네 
		url: "./uploadSnsImage.snsimage",
		
		enctype: "multipart/form-data", 
	
		success: function(result){

			// alert(result);
	    	// 이미지 업로드 성공해야지 message(게시글) 전송 할것
	    	inputMessage = document.getElementById('textArea'); 
	        webSocket.send(inputMessage.value); 
	        inputMessage.value = ""; 
	        
	        // 원복 시킬 것 
	        img = document.getElementById("snsImageUpload");
	        img.src = "./uploadSnsImage/noneImage.jpg";
	        $('#uploadSnsImage').val("");
	        	
		}
	
	});
	
	// 하지만 아래의 submit명령을 추가하지 않으면 백날 실행해봤자 액션이 실행되지 않는다.
	$("#fileForm").submit();
}
