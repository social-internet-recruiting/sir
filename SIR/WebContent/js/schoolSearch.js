$(document).ready(function(){

	// highschool list
	// highschool 관련 전역변수
	var h_currentLine = 0;
	var h_maxSearchLine = 0;
	
	$("#highSchoolSearchText").keyup(function(e){
		if (e.which != 38 && e.which != 40 && e.which != 13){ // 위, 아래, 엔터 키가 아니면
			var input = $("#highSchoolSearchText").val()
			var maxLine = 10;
			if (input.trim() == ""){
				$("#highSchoolSearchResultWrap").hide();
				return;
			}
	
			$.ajax({
				type: "get",
				url: "./highSchoolList.list",
				data: ({search: $("#highSchoolSearchText").val()}), 
				success: function(data) {

					var array = data; // String으로 변경됐네 "," 기호 구분으로 모두 자를것
					array = array.replace("[",""); // "[" 글자 제거
					array = array.replace("]",""); // "]" 글자 제거
					array = array.replace(" ",""); // " " 공백 제거
					var highSchoolList = array.split(","); // "," 기준으로 split
					var highSchoolNames = new Array();
					var highSchoolCount = new Array();
					
					var index = 0;
					for (var i=0; i<highSchoolList.length; i++){
						if (i%2==0){ // 0,2,4~배열인덱스 즉 high_school name
							highSchoolNames[index] = highSchoolList[i].trim();
						} else { // high_school count
							highSchoolCount[index] = highSchoolList[i].trim();

							// 카운트 까지 추가 하면 index 올려줄것
							index++;
						}
					}
					
					// h_maxSearchLine = highSchoolList.length;
					h_maxSearchLine = highSchoolNames.length;
					
					// 값 초기화 - 안하면 이전값 잔상 남아있음
					initValue_h(maxLine);
					
					// db에서 검색한 검색 값이 있는지 확인
					var checkValue = highSchoolNames[0].trim(); 
					if( checkValue != "" ) { // 고등학교 검색 값이 있으면 
						$("#highSchoolSearchResultWrap").show();
						for(var i=0; i<h_maxSearchLine; i++){
							var nameTag = "#highSchoolSearchResultName_" + i;
							$(nameTag).text(highSchoolNames[i]);
							$(nameTag).css("color","#0xC0FF");
							
							var countTag = "#highSchoolSearchResultCount_" + i;
							$(countTag).text("| 동문 : " + highSchoolCount[i] + " 명");
							$(countTag).css("color","#E992FB");
						}
						height = h_maxSearchLine * 20 + 10;
						$("#highSchoolSearchResultWrap").height(height);
						
					} else { // 고등학교 검색 값이 없으면 
						$("#highSchoolSearchResultWrap").hide();
					}
	
				}
			});
		}
		
		var checkTag = $("#highSchoolSearchResultName_0").text(); // result box에  값이 있는지 체크 하기 위해서 처음 검색값을 저장
		// up down 키 누르면 
		if ((e.which==38 || e.which==40) && checkTag.trim() != "" ){ 
			// up down 키를 누르고 있고 result box에 검색 값이 있으면 
			// 위아래로 이동 가능하게 아니면 아무 작동 안되게
			// 선택된 상태에서 위아래 누르면 값이 없어지는 에러 발생
			if (e.which==38) { // up key
				h_currentLine--;
			} else if (e.which==40) { // down key
				h_currentLine++;
			}
			// 현재 tag 선택
			tagNum = h_currentLine-1;
			if (tagNum<0){
				h_currentLine = 0;
				tagNum = h_currentLine;
			} else if(tagNum >= h_maxSearchLine){
				h_currentLine = h_maxSearchLine-1;
				tagNum = h_currentLine;
			}
			var tag = "#highSchoolSearchResultName_" + tagNum;
			var value = $(tag).text();
			enhanceColor_h(tag); // 위 아래 키 적용시 선택된 애만 background 강조
			$("#highSchoolSearchText").val(value);
		}
		
		if (e.which == 13 && checkTag.trim() != "") { 
			// result box에 값이 있으면서 enter 누르면, 
			// checkTag.trim() != "" 안해주고 엔터 두번 누르면 값사라짐
			highSchoolSelect(tagNum);
			colorRetern_h(); // color 음영처리 원복
			h_currentLine = 0; // enter 누르면 current 값 초기화
		}

	});
	
	
	// university list
	// university 관련 전역변수
	var u_currentLine = 0;
	var u_maxSearchLine = 0;
	
	$("#universitySearchText").keyup(function(e){

		if (e.which != 38 && e.which != 40 && e.which != 13){ // 위, 아래, 엔터 키가 아니면
			var input = $("#universitySearchText").val()
			var maxLine = 10;
			if (input.trim() == ""){
				$("#universitySearchResultWrap").hide();
				return;
			}
	
			$.ajax({
				type: "get",
				url: "./universityList.list",
				data: ({search: $("#universitySearchText").val()}), 
				success: function(data) {

					var array = data; // String으로 변경됐네 "," 기호 구분으로 모두 자를것
					array = array.replace("[",""); // "[" 글자 제거
					array = array.replace("]",""); // "]" 글자 제거
					array = array.replace(" ",""); // " " 공백 제거
					var universityList = array.split(","); // "," 기준으로 split
					var universityNames = new Array();
					var universityCount = new Array();
					
					var index = 0;
					for (var i=0; i<universityList.length; i++){
						if (i%2==0){ // 0,2,4~배열인덱스 즉 high_school name
							universityNames[index] = universityList[i].trim();
						} else { // high_school count
							universityCount[index] = universityList[i].trim();

							// 카운트 까지 추가 하면 index 올려줄것
							index++;
						}
					}
					
					// u_maxSearchLine = universityList.length;
					u_maxSearchLine = universityNames.length;
					
					// 값 초기화 - 안하면 이전값 잔상 남아있음
					initValue_u(maxLine);
					
					// db에서 검색한 검색 값이 있는지 확인
					var checkValue = universityNames[0].trim(); 
					if( checkValue != "" ) { // 고등학교 검색 값이 있으면 
						$("#universitySearchResultWrap").show();
						for(var i=0; i<u_maxSearchLine; i++){
							var nameTag = "#universitySearchResultName_" + i;
							$(nameTag).text(universityNames[i]);
							$(nameTag).css("color","#0xC0FF");
							var countTag = "#universitySearchResultCount_" + i;
							$(countTag).text("| 동문 : " + universityCount[i] + " 명");
							$(countTag).css("color","#E992FB");
						}
						height = u_maxSearchLine * 20 + 20;
						$("#universitySearchResultWrap").height(height);
						
					} else { // 고등학교 검색 값이 없으면 
						$("#universitySearchResultWrap").hide();
					}
	
				}
			});
		}
		
		var checkTag = $("#universitySearchResultName_0").text(); // result box에  값이 있는지 체크 하기 위해서 처음 검색값을 저장
		// up down 키 누르면 
		if ((e.which==38 || e.which==40) && checkTag.trim() != "" ){ 
			// up down 키를 누르고 있고 result box에 검색 값이 있으면 
			// 위아래로 이동 가능하게 아니면 아무 작동 안되게
			// 선택된 상태에서 위아래 누르면 값이 없어지는 에러 발생
			if (e.which==38) { // up key
				u_currentLine--;
			} else if (e.which==40) { // down key
				u_currentLine++;
			}
			// 현재 tag 선택
			tagNum = u_currentLine-1;
			if (tagNum<0){
				u_currentLine = 0;
				tagNum = u_currentLine;
			} else if(tagNum >= u_maxSearchLine){
				u_currentLine = u_maxSearchLine-1;
				tagNum = u_currentLine;
			}
			var tag = "#universitySearchResultName_" + tagNum;
			var value = $(tag).text();
			enhanceColor_u(tag); // 위 아래 키 적용시 선택된 애만 background 강조
			$("#universitySearchText").val(value);
		}
		
		if (e.which == 13 && checkTag.trim() != "") { 
			// result box에 값이 있으면서 enter 누르면, 
			// checkTag.trim() != "" 안해주고 엔터 두번 누르면 값사라짐
			universitySelect(tagNum);
			colorRetern_u(); // color 음영처리 원복
			u_currentLine = 0; // enter 누르면 current 값 초기화
		}

	});
	
	
});

// _h highschool 관련 기능
// 위아래 이동시 background-color 적용
function enhanceColor_h(tag){
	$(tag).css("width", "485px");
	colorRetern_h(); //칼라 초기화
	// 선택 된 애 색강조
	$(tag).css("background-color", "#E7E7E7"); // 옅은 회색으로 백그라운드 
}

// 선택시 searchBar에 text 입력
function highSchoolSelect(tagNum){
	var tag = "#highSchoolSearchResultName_" + tagNum;
	var value = $(tag).text().trim();
	$("#highSchoolSearchText").val(value);
	initValue_h(10); // 선택된 뒤에도 위아래 키로 값변경 방지하기 위해서 
	$("#highSchoolSearchResultWrap").hide();
}

// 검색 결과 list를 전부 없는 상태로 만듬
function initValue_h(maxLine){
	
	// name 초기화
	for(var i=0; i<maxLine; i++){
		var tag = "#highSchoolSearchResultName_" + i;
		$(tag).text("");
	}
	
	// count 초기화
	for(var i=0; i<maxLine; i++){
		var tag = "#highSchoolSearchResultCount_" + i;
		$(tag).text("");
	}
	
}

function colorRetern_h(){
	// 색 모두 원복 시킬것 
	for(var i=0; i<10; i++){
		tagTemp = "#highSchoolSearchResultName_" + i;
		$(tagTemp).css("background-color", "");
	}
}



//_u university 관련 기능
//위아래 이동시 background-color 적용
function enhanceColor_u(tag){
	$(tag).css("width", "485px");
	colorRetern_u(); //칼라 초기화
	// 선택 된 애 색강조
	$(tag).css("background-color", "#E7E7E7"); // 옅은 회색으로 백그라운드 
}

//선택시 searchBar에 text 입력
function universitySelect(tagNum){
	var tag = "#universitySearchResultName_" + tagNum;
	var value = $(tag).text().trim();
	$("#universitySearchText").val(value);
	initValue_u(10); // 선택된 뒤에도 위아래 키로 값변경 방지하기 위해서 
	$("#universitySearchResultWrap").hide();
}

//검색 결과 list를 전부 없는 상태로 만듬
function initValue_u(maxLine){
	
	// name 초기화
	for(var i=0; i<maxLine; i++){
		var tag = "#universitySearchResultName_" + i;
		$(tag).text("");
	}
	
	// count 초기화
	for(var i=0; i<maxLine; i++){
		var tag = "#universitySearchResultCount_" + i;
		$(tag).text("");
	}
	
}

function colorRetern_u(){
	// 색 모두 원복 시킬것 
	for(var i=0; i<10; i++){
		tagTemp = "#universitySearchResultName_" + i;
		$(tagTemp).css("background-color", "");
	}
}


