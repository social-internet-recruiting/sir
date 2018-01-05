<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        
<%--jstl 라이브러리 사용을 위한 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<link rel="stylesheet" href="./css/schoolSearch.css">
<title>Insert title here</title>
</head>
<script type=text/javascript">
$(function(){

    $("ul.sub").hide();

	 $("ul.menu li").hover(function(){

	    $("ul:not(:animated)",this).slideDown("fast");

		},

		function(){

		   $("ul",this).slideUp("fast");

		});

 });

</script>
<style>

/* authimg(게시자 프로필 사진) 크기가 깨지길래... */
#authImgId{
	height: 50px;
	width: 50px;
} 
	
#profileImageMain{
	height: 180px;
	width: 180px;
}

.right {
    left: 10px;
    width: auto;
    border: 3px solid #73AD21;
    padding: 10px;
}
header ul{
	float: right;
}
header:after{
	display: block;
	content:"";
	clear: both;
}
.myInfo {
  width: 600px; 
  padding-left:15px;
  padding-right:15px;
  margin: 50px auto 50px auto;
}

.tag {
	center:0;
	float:left;
	margin-left:10px;
}



/*  bhoechie tab */
div.bhoechie-tab-container1{
  z-index: 10;
  background-color: #ffffff;
  padding: 0 !important;
  border-radius: 4px;
  -moz-border-radius: 4px;
  border:1px solid #ddd;
  margin-top: 20px;
  margin-left: 50px;
  -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  box-shadow: 0 6px 12px rgba(0,0,0,.175);
  -moz-box-shadow: 0 6px 12px rgba(0,0,0,.175);
  background-clip: padding-box;
  opacity: 0.97;
  filter: alpha(opacity=97);
}
div.bhoechie-tab-menu{
  padding-right: 0;
  padding-left: 0;
  padding-bottom: 0;
}
div.bhoechie-tab-menu div.list-group{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a{
  margin-bottom: 0;
}
div.bhoechie-tab-menu div.list-group>a .glyphicon,
div.bhoechie-tab-menu div.list-group>a .fa {
  color: #5A55A3;
}
div.bhoechie-tab-menu div.list-group>a:first-child{
  border-top-right-radius: 0;
  -moz-border-top-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a:last-child{
  border-bottom-right-radius: 0;
  -moz-border-bottom-right-radius: 0;
}
div.bhoechie-tab-menu div.list-group>a.active,
div.bhoechie-tab-menu div.list-group>a.active .glyphicon,
div.bhoechie-tab-menu div.list-group>a.active .fa{
  background-color: #5A55A3;
  background-image: #5A55A3;
  color: #ffffff;
}
div.bhoechie-tab-menu div.list-group>a.active:after{
  content: '';
  position: absolute;
  left: 100%;
  top: 50%;
  margin-top: -13px;
  border-left: 0;
  border-bottom: 13px solid transparent;
  border-top: 13px solid transparent;
  border-left: 10px solid #5A55A3;
}

div.bhoechie-tab-content{
  background-color: #ffffff;
  /* border: 1px solid #eeeeee; */
  padding-left: 20px;
  padding-top: 10px;
}

div.bhoechie-tab div.bhoechie-tab-content:not(.active){
  display: none;
}

.container2 {
  width: 600px;
  padding-right: 15px;
  padding-left: 15px;
  margin: 0px auto 50px auto;
  opacity: 0.9; 
  
}

.photosize {
  width: 380px;
  height: 210px;
}
 
 .paging {
	text-align:center;
 }
 
 .modal-scrap {
  position: relative;
  width: auto;
  margin: 10px;
}	

.list-group-button {
  position: relative;
  display: block;
  padding: 10px 15px;
  margin-bottom: -2px;
}

</style>

<body class="wrapper" style="background-color:rgb(50,50,50);">
	<jsp:include page="/include/top.jsp"/>
		

	<!-- 수정하면 먼저 서버에 이미지 업로드 부터 수행한다. 그뒤 ./imageUpload.image 여기서 ./reviseMyInfo.mem 으로 넘겨줄것 -->
	<!-- 파일 선택 안했을 경우 img path값 null 로 변경한다. 따라서 넣어줌 ?img=${requestScope.mdto.img} -->
	<form action=	"./imageUpload.image?img=${requestScope.mdto.img}
					&delhigh_school=${requestScope.mdto.high_school}
					&deluniversity=${requestScope.mdto.university}"  
					method="post" enctype="multipart/form-data" name="infoForm">
	<div class="container" style="background-color:#fff;margin-top:-20px">
	<div class="row" style="margin:50px 0 50px 0">
	<div class="col-sm-2"></div>
		<div class="col-sm-3" style="margin:10px 0 10px 0;">	
			<a><img src="${requestScope.mdto.img}" id="profileImageMain" title="사진변경하려면 정보수정에서 사진 클릭하세요" ></a>
		</div>		
		<div class="col-sm-2">
			<div>
				<h1>${requestScope.mdto.email}</h1>
			</div>
			<div style="margin:10px 0 10px 0; width:200px;" >
				<c:if test="${empty postCount}">
					<c:set var="postCount" value="0"/>
				</c:if>
				<c:if test="${empty friendCount}">
					<c:set var="friendCount" value="0"/>
				</c:if>				
				<span>게시물 : <span>${postCount}</span> 개 ,</span>
				<span>친구 : <span>${friendCount}</span> 명</span>
			</div>
			<div>
				<a style="cursor:pointer;">${requestScope.mdto.name}</a>
			</div>
			<div style="margin:10px auto 10px auto;">
				<a style="cursor:pointer;">${requestScope.mdto.phone}</a>
			</div>
			<div style="margin-left:100px">
				<!-- 자기인지, 친구인지 누구 정보 조회인지 체크  -->
				<c:set var="friend" value="${friend}"/>
				<c:if test="${friend == null}">
					<!-- 자기 정보 조회일때 -->
					<input class="btn btn-outline-success" type="button" data-toggle="modal" data-target="#myModal" value="정보수정"/>	
				</c:if>
				<c:if test="${friend != null}">
					<!-- 친구 정보 조회 일때 -->
					<input class="btn btn-outline-success" type="button" value="친구요청" onclick="askFriend('${requestScope.mdto.email}');"/>
					<input type="hidden" value="${friend}" id="friend" />					
				</c:if>				
				<input class="btn btn-outline-success" type="button" data-toggle="modal" data-target="#SCModal" value="스크랩 확인" 
				style="display:none;" id='hiddenModalButton'/>
			</div>
		</div>
	</div>
	
	<!-- 게시물 스크랩 -->
	<div>
	<div class="row">
	<div class="list-group"></div>
		<ul class="nav nav-tabs list-group" role="tablist" id="job_ck" style="width:100%;">
		<li class="active list-group-button btn btn-outline-danger" style="width:33.33%;" role="presentation" href="#snsScrollAddMyInfoForPost" aria-controls="snsScrollAddMyInfoForPost" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>게시물</b></span></li>
		  <!-- 자기 정보 조회일때만 스크랩, 공고 보여주기 -->
		  <c:if test="${friend == null}">
			  <li class="list-group-button btn btn-outline-warning" style="width:33.33%; role="presentation" href="#snsScrollAddMyInfoForScrap" aria-controls="snsScrollAddMyInfoForScrap" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>스크랩</b></span></li>
	  		  <li class="list-group-button btn btn-outline-info" style="width:33.33%; role="presentation" href="#C" aria-controls="C" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>공고</b></span></li>
  		  </c:if>
		</ul>
	</div>
	<div class="tab-content row">
		<!-- 본인 게시글 -->
		<div role="tabpanel" class="tab-pane active" id="snsScrollAddMyInfoForPost">  
		</div>
		
		<!-- 본인 스크랩 -->
		<div role="tabpanel" class="tab-pane" id="snsScrollAddMyInfoForScrap">
		</div>
		
		<div role="tabpanel" class="tab-pane" id="C">
			<table class="table" style="cursor:pointer;font-size:20px;">
     			<tr class="btn-info" align="center" style="cursor:auto;">
					<td>기업명</td>
					<td>제목</td>
					<td>지원자격</td>
					<td>근무조건</td>
					<td>시작일 ~ 마감일</td>
				</tr>
				<c:forEach var="sdto" items="${sdto}">
	  			<c:if test="${empty sdto}">
         		<tr>
         			<td colspan="5" align="center"><font color="red">회사 목록이 없습니다</font></td>
         		</tr>
         		</c:if>
				<tr class="btn-outline-dark" align="center" href="#" onclick="window.open('scrap_detail.job?scrap_idx=${sdto.scrap_idx}','${sdto.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">
					<td>${sdto.co_title}</td>
					<td>${sdto.recruit_notice}</td>
					<td>${sdto.qualify_up} /경력 ${sdto.career_up}</td>
					<td>${sdto.income_up}만원 ▲/${sdto.position}</td>
					<td>${sdto.applicate_period1} ~ ${sdto.applicate_period2}</td> 
				</tr>
				</c:forEach>
			</table>
		</div>
	</div><!--End of tab-content--><hr/>
			<!-- End of job_check_one -->
	</div>
	
				<!-- Modal -->
				<div class="modal" id="myModal" role="dialog" >
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content" style="width:700px">
							<div class="modal-header" style="width:700px">
							
								<h2 style="float:left">회원정보 수정</h2>
								<input type="button" class="close btn btn-danger" style="float:right; weight:120px; height:50px;" data-dismiss="modal" value="&nbsp;&times;&nbsp;">
							</div>
							
<div class="row" style="margin-top:20px">
<div class="col-sm-2">							
<div style="width:1000px;">
	<div style="margin-right:30px">
    <div class="active"><input type="button" class="btn btn-info" style="width:100px" data-toggle="tab" href="#home" value="프로필 수정"></div>
    <div style="margin-top:30px"><input type="button" class="btn btn-success" style="width:100px" data-toggle="tab" href="#menu1" value="추가 정보"></div>
    <div style="margin-top:30px"><input type="button" class="btn btn-danger" style="width:100px" data-toggle="tab" href="#menu2" value="경력 사항"></div>
    <div style="margin-top:30px"><input type="button" class="btn btn-warning" style="width:100px" data-toggle="tab" href="#menu3" value="공개 설정"></div>
	</div>
	</div>
</div>

<div class="col-sm-10">
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3 style="text-align:center">프로필 수정</h3>
        <center style="width:500px; margin-left:auto; margin-right:auto;">
        <hr>
        <!-- 사진 클릭하면 file upload 창 open 될수 있게  안보이게 처리함-->
        <div id="hiddenDiv" style="display:none">
    		<input type="file" name="profileImageFileButton" accept=".jpg,.png" id="profileImageFileButton"/><br/>
    	</div><br/>
    	<div>
      		<a style="cursor:pointer;" onclick="clickEvent();"><img src="${requestScope.mdto.img}" height="180px" width="180px" id="profileImage" name="profileImg" title="사진변경하려면 사진 클릭하세요"></a>
     	</div>
    	<div class="form-group" align="left">
     		<label for="name">이름</label>
     		<input class="form-control" id="name" name="name" type="text" placeholder="Name" value="${requestScope.mdto.name}"  required />
    	</div>
    	<div class="form-group" align="left">
     		<label for="introduction">소개</label>
     		<td><textarea textarea style="resize: none;" class="form-control" id="introduction" name="introductionArea" placeholder="introduction"  maxlength="2048" cols="40" rows="3" style="height:100px" >${requestScope.mdto.intro}</textarea></td>
        </div>
        <div class="form-group" align="left">
     		<label for="gender">성별</label><div></div>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="btn btn-info active">
     		<input type="radio" id="gender" name="gender" autocomplete="off" value="남" <c:if test="${mdto.gender eq '남'}"> checked</c:if> > 남자  
     		</label>
     		<label class="btn btn-danger">
     		<input type="radio" id="gender" name="gender" autocomplete="off" value="여" <c:if test="${mdto.gender eq '여'}"> checked</c:if> > 여자
     		</label>
    	</div>
        <div class="form-group" align="left">
     		<label for="email">이메일</label> <!-- 아이디 : 수정 불가로 할 것 -->
     		<input class="form-control" id="email" name="email" type="email" placeholder="Email" value="${requestScope.mdto.email}"  readonly="readonly" />
    	</div>
    	
    	<div class="form-group" align="left">
     		<label for="phone">전화번호</label><div></div>
     		<div class="form-group row" style="margin-left:0px">
     			<select class="form-control col-sm-3" id="m_phone1" name="m_phone1" placeholder="" style="width:139px;">
					<option value="">TEL</option>
					<option value="010" <c:if test="${phone1 eq '010'}"> selected</c:if> >010</option>
					<option value="011" <c:if test="${phone1 eq '011'}"> selected</c:if> >011</option>
					<option value="016" <c:if test="${phone1 eq '016'}"> selected</c:if> >016</option>
					<option value="017" <c:if test="${phone1 eq '017'}"> selected</c:if> >017</option>
					<option value="018" <c:if test="${phone1 eq '018'}"> selected</c:if> >018</option>
					<option value="019" <c:if test="${phone1 eq '019'}"> selected</c:if> >019</option>
				</select>
			<div class="col-sm-1">-</div>
			<input class="form-control col-sm-3" type="text" id="m_phone2" name="m_phone2" value="${phone2}" maxlength="4" onkeypress="onlyNumber();" style="width:139px;">
			<div class="col-sm-1">-</div>
			<input class="form-control col-sm-3" type="text" id="m_phone3" name="m_phone3" value="${phone3}" maxlength="4" onkeypress="onlyNumber();" style="width:139px;">
			</div>
		</div>
    	</center>
    	
    </div>
    <div id="menu1" class="tab-pane fade">
    <center style="width:500px; margin-left:auto; margin-right:auto;">
      <h3>추가 정보</h3>
      <hr>
      <h4 align="left">학력</h4>
		<div class="form-group" align="left">
     		<label for="name">고등학교</label>
     		<input class="form-control"  id="highSchoolSearchText" name="highSchoolSearchText" type="text" placeholder="High School" value="${requestScope.mdto.high_school}" autocomplete="off" />
			<div class="highSchoolSearchResultWrap" id="highSchoolSearchResultWrap" style="display:none">
				<ul class="highSchoolSearchResultBox" id="highSchoolSearchResultBox"> <!-- 10개만 입력 -->
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(0);"><span id="highSchoolSearchResultName_0">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_0">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(1);"><span id="highSchoolSearchResultName_1">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_1">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(2);"><span id="highSchoolSearchResultName_2">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_2">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(3);"><span id="highSchoolSearchResultName_3">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_3">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(4);"><span id="highSchoolSearchResultName_4">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_4">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(5);"><span id="highSchoolSearchResultName_5">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_5">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(6);"><span id="highSchoolSearchResultName_6">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_6">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(7);"><span id="highSchoolSearchResultName_7">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_7">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(8);"><span id="highSchoolSearchResultName_8">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_8">&nbsp;</span>
					</li>
					<li class="highSchoolSearchResult" >
						<a href="#none" onclick="highSchoolSelect(9);"><span id="highSchoolSearchResultName_9">&nbsp;</span></a>
						<span id="highSchoolSearchResultCount_9">&nbsp;</span>
					</li>						
				</ul>
			</div>     		

    		<label for="name">대학교</label>
    		<input class="form-control" id="universitySearchText" name="universitySearchText" type="text" placeholder="University" value="${requestScope.mdto.university}" autocomplete="off" />
			<div class="universitySearchResultWrap" id="universitySearchResultWrap" style="display:none">
				<ul class="universitySearchResultBox" id="universitySearchResultBox"> <!-- 10개만 입력 -->
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(0);"><span id="universitySearchResultName_0">&nbsp;</span></a>
						<span id="universitySearchResultCount_0">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(1);"><span id="universitySearchResultName_1">&nbsp;</span></a>
						<span id="universitySearchResultCount_1">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(2);"><span id="universitySearchResultName_2">&nbsp;</span></a>
						<span id="universitySearchResultCount_2">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(3);"><span id="universitySearchResultName_3">&nbsp;</span></a>
						<span id="universitySearchResultCount_3">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(4);"><span id="universitySearchResultName_4">&nbsp;</span></a>
						<span id="universitySearchResultCount_4">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(5);"><span id="universitySearchResultName_5">&nbsp;</span></a>
						<span id="universitySearchResultCount_5">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(6);"><span id="universitySearchResultName_6">&nbsp;</span></a>
						<span id="universitySearchResultCount_6">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(7);"><span id="universitySearchResultName_7">&nbsp;</span></a>
						<span id="universitySearchResultCount_7">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(8);"><span id="universitySearchResultName_8">&nbsp;</span></a>
						<span id="universitySearchResultCount_8">&nbsp;</span>
					</li>
					<li class="universitySearchResult" >
						<a href="#none" onclick="universitySelect(9);"><span id="universitySearchResultName_9">&nbsp;</span></a>
						<span id="universitySearchResultCount_9">&nbsp;</span>
					</li>						
				</ul>
			</div>

    	</div>
    	
    	<h4 align="left">희망직종</h4>
		<div class="form-group" align="left">
			<label for="name">희망 직종 1</label>
			<select id="job1_name" name="job1_name" placeholder="job1_name" style="width:160px;">
				<option value="의료" 	<c:if test="${requestScope.mdto.job1_name eq '의료'}"> selected</c:if> >의료</option>
				<option value="IT/인터넷"	<c:if test="${requestScope.mdto.job1_name eq 'IT/인터넷'}"> selected</c:if> >IT/인터넷</option>
				<option value="전문직" 	<c:if test="${requestScope.mdto.job1_name eq '전문직'}"> selected</c:if> >전문직</option>
				<option value="미디어" 	<c:if test="${requestScope.mdto.job1_name eq '미디어'}"> selected</c:if> >미디어</option>
				<option value="유통/무역" <c:if test="${requestScope.mdto.job1_name eq '유통/무역'}"> selected</c:if> >유통/무역</option>
				<option value="경영/사무" <c:if test="${requestScope.mdto.job1_name eq '경영/사무'}"> selected</c:if> >경영/사무</option>
				<option value="서비스" 	<c:if test="${requestScope.mdto.job1_name eq '서비스'}"> selected</c:if> >서비스</option>
				<option value="생산/제조"	<c:if test="${requestScope.mdto.job1_name eq '생산/제조'}"> selected</c:if> >생산/제조</option>
				<option value="교육" 	<c:if test="${requestScope.mdto.job1_name eq '교육'}"> selected</c:if> >교육</option>								
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<label for="name">희망 직종 2</label>
			<select id="job2_name" name="job2_name" placeholder="job2_name" style="width:160px;">
			</select>
		</div>
		
		<h4 align="left">주소</h4>
		<div class="form-group" align="left">
		
			<input type="text" name="postcode" id="postcode" placeholder="우편번호" style="width:240px;" value="${postcode}"/>&nbsp;
			<input type="button" onclick="execDaumPostcode();" value="우편 번호 검색" class="btn" width="240px" />
			<br/><br/>
			<input type="text" name="address" id="address" placeholder="주소" readonly="readonly"  style="width:240px;" value="${address}"/> &nbsp;
			<input type="text" name="address2" id="address2" placeholder="상세주소"  style="width:240px;" value="${address2}"/>
			
		</div>
		
    	</center>
    </div>
    <div id="menu2" class="tab-pane fade" >
    <center style="width:500px; margin-left:auto; margin-right:auto;">
      <h3>경력 사항</h3>
      <hr>
      	<h4 align="left">경력</h4>
		<div class="form-group" align="left">
     		<label for="name">회사</label>
     		<input class="form-control"  id="prev_company" name="prev_company" type="text" placeholder="company" value="${mdto.prev_company}" autocomplete="off" />
		</div>
		<div class="form-group" align="left">
     		<label for="name">직함</label>
     		<input class="form-control"  id="prev_title" name="prev_title" type="text" placeholder="job title" value="${mdto.prev_title}" autocomplete="off" />
		</div>
		<div class="form-group" align="left">	
			<label for="phone">입사일</label><div></div>
			<div class="form-group row" style="margin-left:0px">
			<input type="date" value="${requestScope.mdto.prev_startdate}" id="prev_startdate" name="prev_startdate" />
			</div>
		</div>
		<div class="form-group" align="left">	
			<label for="phone">퇴사일</label><div></div>
			
			<div class="form-group row" style="margin-left:0px">
			<input type="date" value="${requestScope.mdto.prev_finishdate}" id="prev_finishdate" name="prev_finishdate" />
			</div>
		</div>
		<div class="form-group" align="left">
     		<label for="introduction">직무내용</label>
     		<td><textarea textarea style="resize: none;" id="prev_jobcontent" name="prev_jobcontent" class="form-control" placeholder="job specifications"  maxlength="2048" cols="40" rows="3" style="height:100px" >${requestScope.mdto.prev_jobcontent}</textarea></td>
        </div>
	</center>	
    </div>
    <div id="menu3" class="tab-pane fade">
    <center style="width:500px; margin-left:auto; margin-right:auto;">
      	<h3>공개 설정</h3>
      	<hr>
    	<div class="form-group row" align="left" style="font-size:15px;">
     		<label class="col-sm-3" for="">전화번호</label>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="active col-sm-2">
     		<input type="radio" id="public_phone" name="public_phone" autocomplete="off" value=1 <c:if test="${mdto.public_phone eq 1}"> checked</c:if> > 공개
     		</label>
     		<label class="col-sm-3">
     		<input type="radio" id="public_phone" name="public_phone" autocomplete="off" value=0 <c:if test="${mdto.public_phone eq 0}"> checked</c:if> > 비공개
     		</label>
    	</div>
    	<div class="form-group row" align="left" style="font-size:15px;">
     		<label class="col-sm-3" for="">주소</label>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="active col-sm-2">
     		<input type="radio" id="public_addr" name="public_addr" autocomplete="off" value=1 <c:if test="${mdto.public_addr eq 1}"> checked</c:if> > 공개
     		</label>
     		<label class="col-sm-3">
     		<input type="radio" id="public_addr" name="public_addr" autocomplete="off" value=0 <c:if test="${mdto.public_addr eq 0}"> checked</c:if> > 비공개
     		</label>
    	</div>
    	<div class="form-group row" align="left" style="font-size:15px;">
     		<label class="col-sm-3" for="">학력</label>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="active col-sm-2">
     		<input type="radio" id="public_school" name="public_school" autocomplete="off" value=1 <c:if test="${mdto.public_school eq 1}"> checked</c:if> > 공개
     		</label>
     		<label class="col-sm-3">
     		<input type="radio" id="public_school" name="public_school" autocomplete="off" value=0 <c:if test="${mdto.public_school eq 0}"> checked</c:if> > 비공개
     		</label>
    	</div>
    	<div class="form-group row" align="left" style="font-size:15px;">
     		<label class="col-sm-3" for="">관심분야</label>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="active col-sm-2">
     		<input type="radio" id="public_interest" name="public_interest" autocomplete="off" value=1 <c:if test="${mdto.public_interest eq 1}"> checked</c:if> > 공개
     		</label>
     		<label class="col-sm-3">
     		<input type="radio" id="public_interest" name="public_interest" autocomplete="off" value=0 <c:if test="${mdto.public_interest eq 0}"> checked</c:if> > 비공개
     		</label>
    	</div>
    	<div class="form-group row" align="left" style="font-size:15px;">
     		<label class="col-sm-3" for="">자격증&어학</label>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="active col-sm-2">
     		<input type="radio" id="public_cert" name="public_cert" autocomplete="off" value=1 <c:if test="${mdto.public_cert eq 1}"> checked</c:if> > 공개
     		</label>
     		<label class="col-sm-3">
     		<input type="radio" id="public_cert" name="public_cert" autocomplete="off" value=0 <c:if test="${mdto.public_cert eq 0}"> checked</c:if> > 비공개
     		</label>
    	</div>
    	<div class="form-group row" align="left" style="font-size:15px;">
     		<label class="col-sm-3" for="">자기소개</label>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="active col-sm-2">
     		<input type="radio" id="public_intro" name="public_intro" autocomplete="off" value=1 <c:if test="${mdto.public_intro eq 1}"> checked</c:if> > 공개
     		</label>
     		<label class="col-sm-3">
     		<input type="radio" id="public_intro" name="public_intro" autocomplete="off" value=0 <c:if test="${mdto.public_intro eq 0}"> checked</c:if> > 비공개
     		</label>
    	</div>
    	<div class="form-group row" align="left" style="font-size:15px;">
     		<label class="col-sm-3" for="">경력사항</label>
     		<div class="btn-group" data-toggle="buttons"></div>
     		<label class="active col-sm-2">
     		<input type="radio" id="public_career" name="public_career" autocomplete="off" value=1 <c:if test="${mdto.public_career eq 1}"> checked</c:if> > 공개
     		</label>
     		<label class="col-sm-3">
     		<input type="radio" id="public_career" name="public_career" autocomplete="off" value=0 <c:if test="${mdto.public_career eq 0}"> checked</c:if> > 비공개
     		</label>
    	</div>
    </center>
    </div>
  </div>
</div>
</div>							


							<div class="modal-footer"> 
								<input type="button" class="btn btn-outline-dark" value="수정"  onclick="checkForm();"/>
								<!-- 유효성 체크를 위해 submit에서 button으로 변경하고 checkForm() 에서 submit 시켜준다. -->
								<!-- 수정하면 먼저 서버에 이미지 업로드 부터 수행한다. 그뒤 ./imageUpload.image 여기서 ./reviseMyInfo.mem 으로 넘겨줄것 -->
							</div>
						</div>

					</div>
				</div>
	
	</div>
	<!-- 스크랩 시작 -->	
	<div class="container">
		<div class="modal container" id="SCModal" role="dialog" >
			<div class="modal-scrap" style="width:100%">
				<!-- Modal content-->
				<div class="modal-content" style="">
					<div class="modal-header" style="">						
						<input type="button" class="close btn btn-danger" style="float:right; weight:100px; height:30px;" data-dismiss="modal" value="&nbsp;&times;&nbsp;">
					</div>
				<div id="addModalShowPost">
				
				</div>
				</div>
			</div>
		</div>
	</div>
	</form>
<!-- 스크랩 끝 -->
	
	<jsp:include page="/include/footer.jsp"/>

	<script src="./js/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>

	<script src="./js/jquery-1.9.1.min.js"></script>
	<script src="./js/schoolSearch.js"></script>
	<script src="./js/jobCode.js"></script>
	<script src="./js/postcode.v2.js"></script>
	<script src="./js/postCode.js"></script>
	<script src="./js/infiniteScrollMyInfo.js"></script>
	<script src="./js/asked.js"></script>
	
	<script src="./js/showPost.js"></script>
	
	<script src="./js/forwardComment.js"></script>
	<script src="./js/likePost.js"></script>

	<script src="./js/forwardLikeCount.js"></script>
	
	<script type="text/javascript">
    	
		// 이미지 변경했을때 미리보기 기능
	    function readURL(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            
	            reader.onload = function (e) {
	                $('#profileImage').attr('src', e.target.result);
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	    
	    $("#profileImageFileButton").change(function(){
	        readURL(this);
	    });
	    
	    
	    /* profile 사진 클릭하면  파일 업로드 창 뜨게 해주는 로직*/    
	    function clickEvent(){
	    	document.getElementById("profileImageFileButton").click();
	    };
	    
		function onlyNumber() {
			// 아스키 코드표를 이용해서 숫자인지 체크 
			// event.keyCode 는 text 에 입력받은 값이다.
			// 48 -> 0 / 57 -> 9
			if((event.keyCode < 48) || (event.keyCode > 57)) {
				window.alert("숫자만 입력하세요");
				// 입력값 방지를 위함
				event.returnValue = false; // 리턴값을 false로 주어 영문자가 입력되는 것을 방지
			}
			
		}
		
		function checkForm(){
			
			var phone1 = document.getElementById("m_phone1").value;
			var phone2 = document.getElementById("m_phone2").value;
			var phone3 = document.getElementById("m_phone3").value;
			//alert("'" + phone1 + "','" + phone2 + "','" + phone2 + "'");
			if (phone1.length == 0 && phone2.length == 0 && phone3.length == 0){// 전화 번호 수정을 안했다면 그냥 submit
				document.infoForm.submit();
			} else {  // 하나라도 입력이 되어있다면 아래 체크
				var phone = phone1 + phone2 + phone3;
				if (phone.length == 11 || (phone.length == 10 && document.getElementById("m_phone2").value.length == 3)){ 
					//11자 이거나, 10자이면서 2번째 번호칸이 3자인경우
					document.infoForm.submit();
				} else { // 제대로 입력 되었다면
					alert("번호를 쓰지말던가 입력하려면(10자, 11자) 제대로 입력 하세요");
				}
			}
		}
		
    </script>
    
</body>
</html>