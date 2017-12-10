$(document).ready(function(){
    
    function getList(){
    	
		$.ajax({
			type: "get",
			url: "./jobcode.list",
			data: ({search: $("#job1_name").val()}), 
			success: function(data) {
				
		    	document.getElementById("job2_name").innerHTML = data;
			}
		});
    }
    
    // db에 입력된 초기값 읽어오는것
	getList(); 
    
	// job1_name 변경되면 다시 읽어오는 것
	$("#job1_name").change(function(){
    	getList();
    });
    
});
