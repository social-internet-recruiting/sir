<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="net.cookie.controller.CookieAction"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<title>SIR</title>
</head>
<style>
.job_recommand {
   width: 500px;
   height: 150px;
}

.paging {
	text-align:center;
 }
.list-group-button {
  position: relative;
  display: block;
  padding: 10px 15px;
  margin-bottom: -1px;
}

.list-group-checkbox {
  position: relative;
  display: block;
}
.list-group-item-img {
    position: relative;
    display: block;
    padding: 0;
    margin-bottom: -1px;
    background-color: #fff;
    border: 1px solid #ddd;
}

</style>
<!-- header 부분  시작-->
<jsp:include page="/include/top.jsp"/>
<!-- header 부분 끝 -->
<body class="wrapper" style="background-color:gray;">

<div class="container" style="background-color:white;margin-top:-25px;" >   
	<br/>
	<div class="btn-danger">
	<h2>채용정보</h2>
	</div>
	<div class="job_recommand list-group" style="width:100%;">
   		<div border="1" class="list-group" style="background-color:rgb(230,120,150); width:100%; height:280%">
   			<c:forEach var="job" items="${job2}">				
   					<div class="list-group-item" style="float:left; width:100%; background-color:rgb(0,0,0);" >
   						<b style="font-size:25px; color:white;">${job.co_title}</b>
   					</div>				
   					<span class="list-group-item" style="float:left; width:25%;">
   						<b style="font-size:20px;" >${job.recruit_notice}</b>
   					</span>
   					<span class="list-group-item" style="float:left; width:25%;">
   						<b style="font-size:20px;">${job.income_up}만원</b>
   					</span>
   					<span class="list-group-item" style="float:left; width:25%;">
						<b style="font-size:20px;">▲/${job.position}</b>
					</span>			
					<div class="list-group-button btn btn-warning" style="float:right; width:25%;">
						<div style="font-size:20px; width:100%;" href="#" 
						onclick="window.open('job_detail.job?job_idx=${job.job_idx}',
						'${job.recruit_notice}',
						'width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">모집개요</div>
					</div>					
			</c:forEach>
		</div>	
	</div><!-- End of job_recommand -->
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><br/></div>
		<div><hr/></div>
	<div class="job_search list-group">
		<div class="btn-danger">
		<h2>채용정보 상세검색</h2>
		</div>
		<div class="list-group">
			<form action="text_search.job" method="post" style="width:100%;">
				<div class="list-group-item-img" style="float:left;width:75%;font-size:20px;">
					<input style="width:100%; height:50px;" class="search" type="text" name="company" placeholder="회사 이름을 입력하세요" />
				</div>
				<div class="list-group-item-img" style="float:left;width:25%;font-size:20px;" >
					<input style="width:100%; height:50px;" class="btn-warning"  type="submit" value="검색" />
				</div>				
			</form>
		</div>
	</div><!-- End of job_search -->
		<div><br/></div>
		<div><br/></div>
   		<div><br/></div>
		<div><hr/></div>
	<form action="check_search.job" method="post">
	<div class="job_check_one">
	<!-- 직종별 분류 -->
		<div class="btn-danger">
		<h2>직종별</h2>
		</div>  
		<ul class="nav nav-tabs list-group" role="tablist" id="job_ck" style="width:100%;">
			<li class="active list-group-button btn btn-outline-dark" style="width:11.1%" role="presentation" href="#A" aria-controls="A" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>경영/사무</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#B" aria-controls="B" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>의료</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#C" aria-controls="C" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>서비스</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#D" aria-controls="D" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>생산/제조</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#E" aria-controls="E" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>유통/무역</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#F" aria-controls="F" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>교육</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#G" aria-controls="G" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>전문직</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#H" aria-controls="H" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>IT/인터넷</b></span></li>
			<li class="list-group-button btn btn-outline-dark" style="width:11.111%" role="presentation" href="#I" aria-controls="I" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>미디어</b></span></li>
		</ul>

	<div class="tab-content">
		<div role="tabpanel" class="tab-pane active list-group-checkbox" id="A">		
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="AA" value="기획/전략/경영" > 기획/전략/경영</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="AB" value="인사/교육/노무"  /> 인사/교육/노무</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="AC" value="마케팅/광고/분석"  /> 마케팅/광고/분석</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="B">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="BA" value="간호사"  /> 간호사</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="BB" value="간호조무사"  /> 간호조무사</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="BC" value="세무/원무/코디"  /> 세무/원무/코디</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="C">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="CA" value="여행/관광/항공"  /> 여행/관광/항공</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="CB" value="요리/제빵사/영양사"  /> 요리/제빵사/영양사</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="CC" value="사무/원무/코디"  /> 사무/원무/코디</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="D">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="DA" value="생산관리/품질관리"  /> 생산관리/품질관리</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="DB" value="섬유/의료/패션"  /> 섬유/의료/패션</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="DC" value="전기/전자/제어"  /> 전기/전자/제어</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="E">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="EA" value="구매/자제/재고"  /> 구매/자제/재고</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="EB" value="물류/유통/운송"  /> 물류/유통/운송</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="EC" value="해외영업/무역영업"  /> 해외영업/무역영업</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="F">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="FA" value="외국어/어학원"  /> 외국어/어학원</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="FB" value="유치원/보육"  /> 유치원/보육</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="FC" value="전문직업/IT강사"  /> 전문직업/IT강사</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="G">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="GA" value="경영분석/컨설턴트"  /> 경영분석/컨설턴트</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="GB" value="세무회계/CPA"  /> 세무회계/CPA</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="GC" value="외국어/번역/통역"  /> 외국어/번역/통역</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="H">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="HA" value="웹개발"  /> 웹개발</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="HB" value="응용프로그램개발"  /> 응용프로그램개발</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="HC" value="게임"  /> 게임</label>
		</div>
		<div role="tabpanel" class="tab-pane" id="I">
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="IA" value="공연/무대/스텝"  /> 공연/무대/스텝</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="IB" value="영화/출판/편집"  /> 영화/출판/편집</label>
			<label class="btn btn-outline-danger" style="font-size:20px;width:33%"><input type="checkbox" name="IC" value="방송/연출/PD/감독"  /> 방송/연출/PD/감독</label>
		</div>
	</div><!--End of tab-content--><hr/>
	</div><!-- End of job_check_one -->

<!-- 지역별 분류 -->
	<div class="job_check_two">
	<div class="btn-danger">
		<h2>근무지역</h2>
	</div> 
<ul class="nav nav-tabs list-group" role="tablist" id="region_ck">
  <li class="active list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" href="#SE" aria-controls="SE" role="tab" data-toggle="tab"><span style="font-size:20px;"><b>서울</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#KK" aria-controls="KK" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>경기</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#IC" aria-controls="IC" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>인천</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#BS" aria-controls="BS" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>부산</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#DG" aria-controls="DG" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>대구</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#GJ" aria-controls="GJ" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>광주</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#DJ" aria-controls="DJ" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>대전</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#WS" aria-controls="WS" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>울산</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#SJ" aria-controls="SJ" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>세종</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#KW" aria-controls="KW" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>강원</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#KN" aria-controls="KN" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>경남</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#KB" aria-controls="KB" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>경북</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#JN" aria-controls="JN" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>전남</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#JB" aria-controls="JB" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>전북</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#CN" aria-controls="CN" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>충남</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#CB" aria-controls="CB" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>충북</b></span></li>
  <li class="list-group-button btn btn-outline-dark" style="width:5.882%" role="presentation" role="presentation" href="#JJ" aria-controls="JJ" role="tab" data-toggle="tab" ><span style="font-size:20px;"><b>제주</b></span></li>
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="SE">
  	 <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서울전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 강남구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox"  name="" value=""  /> 강동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 강북구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 강서구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 관악구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 광진구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 구로구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 금천구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 노원구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 도봉구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동대문구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동작구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 마포구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서대문구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서초구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 성동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 성북구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 송파구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 양천구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영등포구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 용산구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 은평구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 종로구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 중구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 중령구</label>
  </div>
   <div role="tabpanel" class="tab-pane" id="KK">
  	 <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 경기전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 가평군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고양시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고양시 덕양구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고양시 일산동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고양시 일산서구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 과천시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 광명시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 광주시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 구리시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 군포시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 김포시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남양주시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동두천시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 부천시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 부천시 소사구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 부천시 오정구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 부천시 원미구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 성남시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 성남시 분당구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 성남시 수정구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 성남시 중원구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 수원시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 수원시 권선구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 수원시 영통구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 수원시 장안구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 수원시 팔달구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 시흥시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안산시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안산시 단원구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안산시 상록구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안성시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안양시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안양시 동안구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안양시 만안구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 양주시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 양평군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 여주시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 연천군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 오산시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 용인시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 용인시 기흥구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 용인시 수지구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 용인시 처인구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 의왕시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 의정부시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 이천시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 파주시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 평택시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 포천시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 하남시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 화성시</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="IC">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 인천전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 강화군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 계양구</label>>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 부평구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 연수구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 옹진군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 중구</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="BS">
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id="bs_all" name="bs_all" value="부산전체"  /> 부산전체</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id="bs_01" name="bs_01" value="부산강서구"  /> 강서구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id="bs_02" name="bs_02" value="부산금정구"  /> 금정구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id="bs_03" name="bs_03" value="부산기장군"  /> 기장군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id="bs_04" name="bs_04" value="부산남구"  /> 남구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id="bs_05" name="bs_05" value="부산동구"  /> 동구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id="bs_06" name="bs_06" value="부산동래구"  /> 동래구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_07" name="bs_07" value="부산진구"  /> 부산진구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_08" name="bs_08" value="부산북구"  /> 북구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_09" name="bs_09" value="부산사상구"  /> 사상구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_10" name="bs_10" value="부산사하구"  /> 사하구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_11" name="bs_11" value="부산서구"  /> 서구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_12" name="bs_12" value="부산수영구"  /> 수영구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_13" name="bs_13" value="부산연제구"  /> 연제구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" id ="bs_14" name="bs_14" value="부산영도구"  /> 영도구</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="DG">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 대구전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 달서구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 달성군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 북구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 수성구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 중구</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="GJ">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 광주전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 광산구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 북구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서구</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="DJ">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 대전전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 대덕구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 유성구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 중구</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="WS">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 울산전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 북구</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 울주군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 중구</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="SJ">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 세종특별자치시</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="KW">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 강원전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 강릉시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고성군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 동해시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 삼척시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 속초시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 양구군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 양양군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영월군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 원주시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 인제군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 정선군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 철원군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 춘천시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 태백시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 평창군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 홍청군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 화천군</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 횡성군</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="KN">
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 경남전체</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 거제시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 거창군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고성군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 김해시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남해군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 밀양시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 사천시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 산청군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 양산시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 의령군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 진주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 창년군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 창원시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 창원시 마산합포구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 창원시 마산회원구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 창원시 성산구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 창원시 의창구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 창원시 진해구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 통영시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 하동군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 함안군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 함양군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 합천군</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="KB">
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 경북전체</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 경산시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 경주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고령군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 구미시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 군위군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 김천시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 문경시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 봉화군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 상주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 성주군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 안동시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영덕군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영양군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영천시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 예천군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 울릉군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 울진군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 의성군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청도군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청송군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 칠곡군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 포항시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 포항시 남구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 포항시 북구</label>
  </div>
    <div role="tabpanel" class="tab-pane" id="JN">
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 전남전체</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 강진군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고흥군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 곡성군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 광양시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 구례군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 나주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 담양군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 목포시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 무안군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 보성군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 순천시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 신안군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 여수시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영광군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영암군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 완도군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 장성군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 함평군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 해남군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 화순군</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="JB">
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 전북전체</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 고창군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 군산시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 김제시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 남원시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 무주군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 부안군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 순창군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 완주군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 익산시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 임실군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 장수군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 전주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 전주시 덕진구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 전주시 완산구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 정읍시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 진안군</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="CN">
  	<label class="btn btn-outline-danger" style="width:19.66%;font-size:20px;"><input type="checkbox" name="" value=""  />충남전체</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 계룡시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 공주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 금산군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 논산시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 당진시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 보령시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 부여군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서산시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 사천군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 아산시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 연기군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 예산군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 천안시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 천안시 동남구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 천안시 서북구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청양군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 태안군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 홍성군</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="CB">
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 충북전체</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 괴산군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 단양군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 보은군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 영동군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 옥천군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 음성군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 제천시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 증평군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 진천군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청원군</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청주시</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청주시 상당구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청주시 서원구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청주시 청원구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 청주시 흥덕구</label>
    <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 충주시</label>
  </div>
  <div role="tabpanel" class="tab-pane" id="JJ">
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 제주전체</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 서귀포시</label>
     <label class="btn btn-outline-danger" style="font-size:20px;width:19.66%;"><input type="checkbox" name="" value=""  /> 제주시</label>
  </div>
</div><!--End of tab-content--><hr/>

	<div class="btn-danger">
		<h2>경력</h2>
	</div>
	<label class="btn btn-outline-danger" style="font-size:20px;width:25%;"><input type="checkbox" name="newcomer" value="신입" /> 신입</label>
	<label class="btn btn-outline-danger" style="font-size:20px;width:25%;"><input type="checkbox" name="career" value="경력" /> 경력</label>
	<select class="btn btn-outline-danger" style="font-size:20px;width:10.972%;height:42px;" name="career_up">
		<option value="없음">전체</option>
		<option value="1년이상">1년이상</option>
		<option value="2년이상">2년이상</option>
		<option value="3년이상">3년이상</option>
		<option value="4년이상">4년이상</option>
		<option value="5년이상">5년이상</option>
		<option value="6년이상">6년이상</option>
		<option value="7년이상">7년이상</option>
		<option value="8년이상">8년이상</option>
		<option value="9년이상">9년이상</option>
		<option value="10년 이상">10년이상</option>
	</select>
	~
	<select class="btn btn-outline-danger" style="font-size:20px;width:10.972%;height:42px;" name="career_down">
		<option value="없음">전체</option>
    	<option value="1년이하">1년이하</option>
    	<option value="2년이하">2년이하</option>
    	<option value="3년이하">3년이하</option>
    	<option value="4년이하">4년이하</option>
    	<option value="5년이하">5년이하</option>
    	<option value="6년이하">6년이하</option>
    	<option value="7년이하">7년이하</option>
    	<option value="8년이하">8년이하</option>
    	<option value="9년이하">9년이하</option>
    	<option value="10년이하">10년이하</option>
	</select>
	<label class="btn btn-outline-danger" style="font-size:20px;width:25%;"><input type="checkbox" name="career_no" value="경력무관"/> 경력무관</label>
<hr/>
	<!-- 학력 시작-->
	<div class="btn-danger">
		<h2>학력</h2>
	</div>
	<select class="btn btn-outline-danger" style="font-size:20px;width:24.29%;height:42px; name="qualify_up">
		<option value="없음">전체</option>
	    <option value="고등학교졸업이상">고등학교졸업이상</option>
	    <option value="2년제졸업이상">2년제졸업이상</option>
	    <option value="4년제졸업이상">4년제졸업이상</option>
	    <option value="석사졸업이상">석사졸업이상</option>
	    <option value="박사졸업이상">박사졸업이상</option>
	</select>
	~
	<select class="btn btn-outline-danger" style="font-size:20px;width:24.29%;height:42px; name="qualify_down">
		<option value="없음">전체</option>
	    <option value="고등학교졸업이하">고등학교졸업이하</option>
	    <option value="2년제졸업이하">2년제졸업이하</option>
	    <option value="4년제졸업이하">4년제졸업이하</option>
	    <option value="석사졸업이하">석사졸업이하</option>
	    <option value="박사졸업이하">박사졸업이하</option>
	</select>
	<label class="btn btn-outline-danger" style="font-size:20px;width:49.2%;"><input type="checkbox" name="qualify_no" value="학력무관" /> 학력무관</label>
	<!-- 학력 끝-->
	<hr/>
	
	<!-- 연봉 시작-->	
	<div class="btn-danger">
		<h2>연봉</h2>
	</div>
	<select class="btn btn-outline-danger" style="font-size:20px;width:50.5%;height:42px;" name="income_up">
		<option value="0">전체</option>
		<option value="1400">1400만원이상</option>
		<option value="1600">1600만원이상</option>
		<option value="1800">1800만원이상</option>
		<option value="2000">2000만원이상</option>
		<option value="2200">2200만원이상</option>
		<option value="2400">2400만원이상</option>
		<option value="2600">2600만원이상</option>
		<option value="2800">2800만원이상</option>
		<option value="3000">3000만원이상</option>
		<option value="3200">3200만원이상</option>
		<option value="3400">3400만원이상</option>
		<option value="3600">3600만원이상</option>
		<option value="3800">3800만원이상</option>
		<option value="4000">4000만원이상</option>
	</select>
	<label class="btn btn-outline-danger" style="font-size:20px;width:48.94%;"><input type="checkbox" name="income_no" value="없음" /> 회사내규에 따름 포함</label>
	<!-- 연봉 끝-->
	<hr/>
	<!-- 검색하기 시작-->
	<input class="btn btn-outline-info" style="font-size:20px;width:100%;" type="submit" value="검색하기" />
	<!-- 검색하기 끝 -->	
	<hr/>
</div><!-- End of job_check_two -->
</form><!-- End of check_search.job -->
<div class="job_list">

<table class="table" style="cursor:pointer;font-size:20px;">
      <tr class="btn-info" align="center" style="cursor:auto;">
			<td>기업명</td>
			<td>제목</td>
			<td>지원자격</td>
			<td>근무조건</td>
			<td>시작일 ~ 마감일</td>
		</tr>
	<c:forEach var="v1" items="${v1}">
	  <c:if test="${empty v1}">
         <tr>
         	<td colspan="5" align="center"><font color="red">회사 목록이 없습니다</font></td>
         </tr>
      </c:if>
      <tr class="btn-outline-dark" align="center" href="#" onclick="window.open('job_detail.job?job_idx=${v1.job_idx}','${v1.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">
         <td>${v1.co_title}</td>
         <td>${v1.recruit_notice}</td>
         <td>${v1.qualify_up} /${v1.career} ${v1.career_up}</td>
         <td>${v1.income_up}만원 ▲/${v1.position}</td>
         <td>${v1.applicate_period1} ~ ${v1.applicate_period2}</td>
      </tr>
      </c:forEach>

	<c:forEach var="v2" items="${v2}">
	  <c:if test="${empty v2}">
         <tr>
         	<td colspan="5" align="center"><font color="red">회사 목록이 없습니다</font></td>
         </tr>
      </c:if>
      <tr class="btn-outline-dark" align="center" href="#" onclick="window.open('job_detail.job?job_idx=${v2.job_idx}','${v2.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">
         <td>${v2.co_title}</td>
         <td>${v2.recruit_notice}</td>
         <td>${v2.qualify_up} /${v2.career} ${v2.career_up}</td>
         <td>${v2.income_up}만원 ▲/${v2.position}</td>
         <td>${v2.applicate_period1} ~ ${v2.applicate_period2}</td>
      </tr>
      </c:forEach> 
      
      <c:forEach var="v3" items="${v3}">
      <c:if test="${empty v3}">
         <tr>
         	<td colspan="5" align="center"><font color="red">회사 목록이 없습니다</font></td>
         </tr>
      </c:if>
      <tr class="btn-outline-dark" align="center" href="#" onclick="window.open('job_detail.job?job_idx=${v3.job_idx}','${v3.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">
         <td>${v3.co_title}</td>
         <td>${v3.recruit_notice}</td>
         <td>${v3.qualify_up} /${v3.career} ${v3.career_up}</td>
         <td>${v3.income_up}만원 ▲/${v3.position}</td>
         <td>${v3.applicate_period1} ~ ${v3.applicate_period2}</td>
      </tr>
      </c:forEach> 
</table>
		<p align="center">[ 목록 클릭시 기업 정보 확인 ]</p>
	

<div class="paging">
	<ul class="pagination">
       <c:set var="now" value="${nowPage}"/>
       <c:if test="${nowBlock >0 }">
          <li class="page-item">
          <a class="page-link" aria-label="Previous" href="job_main.job?nowBlock=${nowBlock-1 }&nowPage=${nowBlock*5-1}">
          <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
          </a>
          </li>
       </c:if>
       <c:forEach var="nowPage" begin="${nowBlock*5}" end="${nowBlock*5+4 }">
          <c:if test="${nowPage<totalPage }">
             <c:if test="${nowPage != now }">
                <li class="page-item"><a class="page-link" href="job_main.job?nowPage=${nowPage}&nowBlock=${nowBlock}">${nowPage+1 }</a></li>
             </c:if>
             <c:if test="${nowPage eq now }">
                <li class="page-item"><a class="page-link" href="job_main.job?nowPage=${nowPage}&nowBlock=${nowBlock}">${nowPage+1 }</a></li>
             </c:if>
          </c:if>
       </c:forEach>
       <c:if test="${totalBlock-1 > nowBlock }">
       <li class="page-item">
       <a class="page-link" aria-label="Next" href="job_main.job?nowBlock=${nowBlock+1 }&nowPage=${(nowBlock+1)*5}">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
       </a>
       </li>
       </c:if>
    </ul><!-- End of pagnation -->
    </div><!-- End of paging -->    
</div><!-- End of job_list -->
</div><!-- End of container -->
<!-- footer 부분 시작 -->
<jsp:include page="/include/footer.jsp"/>
<!-- footer 부분 끝 -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="./js/bootstrap.js"></script>
</body>
</html>