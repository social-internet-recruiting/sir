
	var webSocketLikeCount = new WebSocket('ws://localhost:8080/SIR/forwardLikeCount'); // webservlet 주소 = forwardComment
	// var webSocketLikeCount = new WebSocket('ws://192.168.4.227:8080/SIR/forwardLikeCount'); // webservlet 주소 = forwardComment
	// var webSocketLikeCount = new WebSocket('ws://192.168.0.9:8080/SIR/forwardLikeCount'); // webservlet 주소 = forwardComment
	
	webSocketLikeCount.onerror = function(event) {
    	onError(event);
    }; 
 
    webSocketLikeCount.onopen = function(event) {
      	onOpen(event);
    }; 
    
    webSocketLikeCount.onmessage = function(event) {
   		onMessageCountList(event);	
    }; 
 	
    function onMessageCountList(event) {
    	text = event.data;
    	textArr = text.split("#%&@#");
    	idx = textArr[0];
    	count = textArr[1];
    	
    	addTag = "#likeCountId_" + idx;
    	$(addTag).text(count);
    } 
 
    function onOpen(event) {
        //textarea.value += "연결 성공\n"; 
    } 
 
    function onError(event) {
      	//alert(event.data);
    } 
 
    function calculator(idx,how) {
    	idTag = "likeCountId_" + idx;
    	value = $("#" + idTag).text();
    	webSocketLikeCount.send("" + idx + "#%&@#" + value + "#%&@#" + how); 
    }
    