	var webSocketComment = new WebSocket('ws://localhost:8080/SIR/forwardComment'); // webservlet 주소 = forwardComment
	// var webSocketComment = new WebSocket('ws://192.168.4.227:8080/SIR/forwardComment'); // webservlet 주소 = forwardComment
	// var webSocketComment = new WebSocket('ws://192.168.0.9:8080/SIR/forwardComment'); // webservlet 주소 = forwardComment
	
	webSocketComment.onerror = function(event) {
    	onError(event);
    }; 
 
    webSocketComment.onopen = function(event) {
      	onOpen(event);
    }; 
    
    webSocketComment.onmessage = function(event) {
   		onMessageComment(event);	
    }; 
 
    function onMessageComment(event) {
    	text = event.data;
    	textArr = text.split("#%&@#");
    	addComment = textArr[0];
    	idx = textArr[1];
    	addTag = "#snsCommentsAdd_"+idx;
    	$(addTag).append(addComment);
    } 
 
    function onOpen(event) {
        //textarea.value += "연결 성공\n"; 
    } 
 
    function onError(event) {
      	//alert(event.data);
    } 
 
   
    function addComments(idx) {
    	idTag = "comments_" + idx;
    	inputCommentsValue = document.getElementById(idTag).value.trim(); 
    	email = document.getElementById('email').value;
    	if (inputCommentsValue != ""){
        	// idx 로 post 찾고 그 안에 글을 넣어야 되니깐, idx 추가 
        	webSocketComment.send("" + idx + "#%&@#" + email + "#%&@#" + inputCommentsValue); 
        	document.getElementById(idTag).value = "";
    	} else {
    		alert("Comment를 입력하세요.");
    	}

    }
