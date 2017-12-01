
/* [정영현 17.11.12 일 22:36] 
 * emailID 중복체크와 비밀번호 6자리 체크위한 function 추가
 * */

/*[정영현 17.11.12 일 22:36] 이메일 중복 체크를 위한 전역 boolean 변수*/
var emailIdCheck = false; 
/*[정영현 17.11.12 일 22:36] 비밀번호 6자리 체크를 위한 전역 boolean 변수*/
var passwordCheck = false;

/*[정영현 17.11.12 일 22:36] 비밀번호 6자리 체크를 위한 function*/
function checkPass() {
	if($("#pass").val() != "") {
		if($("#pass").val().length < 6) {
			$("#passCheck").css("color", "red");
			$("#passCheck").text("비밀번호를 6자 이상 입력하세요");
			passwordCheck = false;
		} else {
			$("#passCheck").css("color", "green");
			$("#passCheck").text("비밀번호 사용 가능합니다.");
			passwordCheck = true;
		}
	} else {
		$("#passCheck").css("color", "red");
		$("#passCheck").text("비밀번호를 입력하세요.");
		passwordCheck = false;
	}
	$("#passCheck").show();
}

/*[정영현 17.11.12 일 22:36] 이메일 중복 체크를 위한 function*/
function checkId() {
	if($("#email").val() == "") {
		$("#idCheck").css("color", "red");
		$("#idCheck").text("Email 계정을 입력하세요");
		emailIdCheck = false;
		return;
	}
	
	$.ajax({
		type: "get",
		url: "./EmailDupCheck.email",
		data: ({email: $("#email").val()}), /* ({email:  여기 email 이 parameter 값이다. */
		success: function(data) {
			if(jQuery.trim(data) == "false") {
				$("#idCheck").css("color", "green");
				$("#idCheck").text("사용가능한 Email 입니다.");
				emailIdCheck = true;
			} else {
				$("#idCheck").css("color", "red");
				$("#idCheck").text("이미 사용중인 Email 입니다.");
				$("#idCheck").readonly = "readonly";
				emailIdCheck = false;
			}
			$("#idCheck").show();
		}
	});
}

function checkForm() {
	if(!emailIdCheck) {
		alert("사용가능한 Email 이 아닙니다. 올바른 계정을 넣어주세요");
		$("#email").focus();
		return false;
	}
	if(!passwordCheck) {
		alert("비밀번호 규칙을 지켜주세요");
		$("#pass").focus();
		return false;
	}
	
	return true;
}
