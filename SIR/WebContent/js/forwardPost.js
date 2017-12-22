	// 사진 입력 여부 boolean 값
	var isInputImage = false;

	// 이미지 변경했을때 미리보기 기능
	function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#snsImageUpload').attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	$("#uploadSnsImage").change(function(){
	    readURL(this);
	    isInputImage = true;
	});
	
	
	/* profile 사진 클릭하면  파일 업로드 창 뜨게 해주는 로직*/    
	function uploadImage(){
		document.getElementById("uploadSnsImage").click();
	};


	// var webSocket = new WebSocket('ws://192.168.4.231:8080/snsmaintest/broadcasting');
	var webSocketPost = new WebSocket('ws://localhost:8080/SIR/forwardPost'); // webservlet 주소 = forwardPost
	    
	webSocketPost.onerror = function(event) {
    	onError(event);
    }; 
 
    webSocketPost.onopen = function(event) {
      	onOpen(event);
    }; 
    
    webSocketPost.onmessage = function(event) {
    	onMessagePost(event);	
    }; 
 
    function onMessagePost(event) {
    	text = event.data;
    	$("#snsSynchronizationAdd").after(text);
    	
    } 
 
    function onOpen(event) {
        //textarea.value += "연결 성공\n"; 
    } 
 
    function onError(event) {
      	//alert(event.data);
    } 
 
   
    function send() {
    	
    	// 사진 등록했는지랑, text 내용 넣었는지 확인 할 것
    	contentsValue = document.getElementById("contents").value.trim();
    	if (contentsValue != "" && isInputImage){ 
    		// contents textarea 값이 빈값이 아닐때, isInputImg 가 true 일대
    		isInputImage = false; //false 로 원복
    		fileUpload(); 
    	} else {
    		alert("사진과 내용을 모두 입력해주세요!")
    	}
    	
    }
