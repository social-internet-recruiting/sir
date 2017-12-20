	
	// 이미지 변경했을때 미리보기 기능
	function readURL(input) {
		alert("진행1");
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        alert("진행2");
	        reader.onload = function (e) {
	        	alert("사진등록변경완료");
	            $('#snsImageUpload').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$("#uploadSnsImage").change(function(){
		alert("사진등록변경");
		alert("사진등록변경a");
		alert(this);
	    readURL(this);
	    alert("aaaaa");
	});
	
	
	/* profile 사진 클릭하면  파일 업로드 창 뜨게 해주는 로직*/    
	function uploadImage(){
		alert("사진등록");
		document.getElementById("uploadSnsImage").click();
		alert("aaaaa");
	};


	// var webSocket = new WebSocket('ws://192.168.4.231:8080/snsmaintest/broadcasting');
	var webSocket = new WebSocket('ws://localhost:8080/SIR/SNSBroadcasting');
	    
    webSocket.onerror = function(event) {
    	onError(event)
    }; 
 
    webSocket.onopen = function(event) {
      	onOpen(event) 
    }; 
    
    webSocket.onmessage = function(event) {
      	onMessage(event) 
    }; 
 
    function onMessage(event) {
    	text = event.data;
    	$("#snsmaintitle").after(text);
    	
    } 
 
    function onOpen(event) {
        //textarea.value += "연결 성공\n"; 
    } 
 
    function onError(event) {
      	//alert(event.data);
    } 
 
   
    function send() {
    	
    	fileUpload(); 

    }
