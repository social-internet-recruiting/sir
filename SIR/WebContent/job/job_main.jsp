<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   width: 1000px;
   height: 250px;
   background-color: yellow;
   text-align:center;
   padding-top:100px;
}

.paging {
	text-align:center;
 }

</style>
<body>
<!-- header 부분  시작-->
<jsp:include page="/include/top.jsp"/>
<!-- header 부분 끝 -->
   

<div class="container">
   <h2>추천 공고</h2>
   <div class="job_recommand">
   추천 내용 넣기
   </div><!-- End of job_recommand -->
   <div class="job_search">
   <h2>채용정보 상세검색</h2>
   <form action="text_search.job" method="post">
   	<input type="text" name="company" placeholder="회사 이름을 입력하세요" />
   	<input type="submit" value="검색" />
   </form>
   </div><!-- End of job_search -->
   
   <form action="check_search.job" method="post">
   <div class="job_check_one">
      <!-- 직종별 분류 -->
<h3>직종별</h3>   
<ul class="nav nav-tabs" role="tablist" id="job_ck">
  <li role="presentation" class="active"><a href="#A" aria-controls="A" role="tab" data-toggle="tab" style="font-size:20px;">경영/사무</a></li>
  <li role="presentation"><a href="#B" aria-controls="B" role="tab" data-toggle="tab" style="font-size:20px;">의료</a></li>
  <li role="presentation"><a href="#C" aria-controls="C" role="tab" data-toggle="tab" style="font-size:20px;">서비스</a></li>
  <li role="presentation"><a href="#D" aria-controls="D" role="tab" data-toggle="tab" style="font-size:20px;">생산/제조</a></li>
  <li role="presentation"><a href="#E" aria-controls="E" role="tab" data-toggle="tab" style="font-size:20px;">유통/무역</a></li>
  <li role="presentation"><a href="#F" aria-controls="F" role="tab" data-toggle="tab" style="font-size:20px;">교육</a></li>
  <li role="presentation"><a href="#G" aria-controls="G" role="tab" data-toggle="tab" style="font-size:20px;">전문직</a></li>
  <li role="presentation"><a href="#H" aria-controls="H" role="tab" data-toggle="tab" style="font-size:20px;">IT/인터넷</a></li>
  <li role="presentation"><a href="#I" aria-controls="I" role="tab" data-toggle="tab" style="font-size:20px;">미디어</a></li>
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="A">
     <label>기획/전략/경영</label><input type="checkbox" name="AA" value="기획/전략/경영"  />
     <label>인사/교육/노무</label><input type="checkbox" name="AB" value="인사/교육/노무"  />
     <label>마케팅/광고/분석</label><input type="checkbox" name="AC" value="마케팅/광고/분석"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="B">
     <label>간호사</label><input type="checkbox" name="BA" value="간호사"  />
     <label>간호조무사</label><input type="checkbox" name="BB" value="간호조무사"  />
     <label>세무/원무/코디</label><input type="checkbox" name="BC" value="세무/원무/코디"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="C">
     <label>여행/관광/항공</label><input type="checkbox" name="CA" value="여행/관광/항공"  />
     <label>요리/제빵사/영양사</label><input type="checkbox" name="CB" value="요리/제빵사/영양사"  />
     <label>사무/원무/코디</label><input type="checkbox" name="CC" value="사무/원무/코디"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="D">
     <label>생산관리/품질관리</label><input type="checkbox" name="DA" value="생산관리/품질관리"  />
     <label>섬유/의료/패션</label><input type="checkbox" name="DB" value="섬유/의료/패션"  />
     <label>전기/전자/제어</label><input type="checkbox" name="DC" value="전기/전자/제어"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="E">
     <label>구매/자제/재고</label><input type="checkbox" name="EA" value="구매/자제/재고"  />
     <label>물류/유통/운송</label><input type="checkbox" name="EB" value="물류/유통/운송"  />
     <label>해외영업/무역영업</label><input type="checkbox" name="EC" value="해외영업/무역영업"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="F">
     <label>외국어/어학원</label><input type="checkbox" name="FA" value="외국어/어학원"  />
     <label>유치원/보육</label><input type="checkbox" name="FB" value="유치원/보육"  />
     <label>전문직업/IT강사</label><input type="checkbox" name="FC" value="전문직업/IT강사"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="G">
     <label>경영분석/컨설턴트</label><input type="checkbox" name="GA" value="경영분석/컨설턴트"  />
     <label>세무회계/CPA</label><input type="checkbox" name="GB" value="세무회계/CPA"  />
     <label>외국어/번역/통역</label><input type="checkbox" name="GC" value="외국어/번역/통역"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="H">
     <label>웹개발</label><input type="checkbox" name="HA" value="웹개발"  />
     <label>응용프로그램개발</label><input type="checkbox" name="HB" value="응용프로그램개발"  />
     <label>게임</label><input type="checkbox" name="HC" value="게임"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="I">
     <label>공연/무대/스텝</label><input type="checkbox" name="IA" value="공연/무대/스텝"  />
     <label>영화/출판/편집</label><input type="checkbox" name="IB" value="영화/출판/편집"  />
     <label>방송/연출/PD/감독</label><input type="checkbox" name="IC" value="방송/연출/PD/감독"  />
  </div>
</div><!--End of tab-content--><hr/>
   </div><!-- End of job_check_one -->

<!-- 지역별 분류 -->
<div class="job_check_two">
<h3>근무 지역</h3>
<ul class="nav nav-tabs" role="tablist" id="region_ck">
  <li role="presentation" class="active"><a href="#SE" aria-controls="SE" role="tab" data-toggle="tab" style="font-size:15px;">서울</a></li>
  <li role="presentation"><a href="#KK" aria-controls="KK" role="tab" data-toggle="tab" style="font-size:15px;">경기</a></li>
  <li role="presentation"><a href="#IC" aria-controls="IC" role="tab" data-toggle="tab" style="font-size:15px;">인천</a></li>
  <li role="presentation"><a href="#BS" aria-controls="BS" role="tab" data-toggle="tab" style="font-size:15px;">부산</a></li>
  <li role="presentation"><a href="#DG" aria-controls="DG" role="tab" data-toggle="tab" style="font-size:15px;">대구</a></li>
  <li role="presentation"><a href="#GJ" aria-controls="GJ" role="tab" data-toggle="tab" style="font-size:15px;">광주</a></li>
  <li role="presentation"><a href="#DJ" aria-controls="DJ" role="tab" data-toggle="tab" style="font-size:15px;">대전</a></li>
  <li role="presentation"><a href="#WS" aria-controls="WS" role="tab" data-toggle="tab" style="font-size:15px;">울산</a></li>
  <li role="presentation"><a href="#SJ" aria-controls="SJ" role="tab" data-toggle="tab" style="font-size:15px;">세종</a></li>
  <li role="presentation"><a href="#KW" aria-controls="KW" role="tab" data-toggle="tab" style="font-size:15px;">강원</a></li>
  <li role="presentation"><a href="#KN" aria-controls="KN" role="tab" data-toggle="tab" style="font-size:15px;">경남</a></li>
  <li role="presentation"><a href="#KB" aria-controls="KB" role="tab" data-toggle="tab" style="font-size:15px;">경북</a></li>
  <li role="presentation"><a href="#JN" aria-controls="JN" role="tab" data-toggle="tab" style="font-size:15px;">전남</a></li>
  <li role="presentation"><a href="#JB" aria-controls="JB" role="tab" data-toggle="tab" style="font-size:15px;">전북</a></li>
  <li role="presentation"><a href="#CN" aria-controls="CN" role="tab" data-toggle="tab" style="font-size:15px;">충남</a></li>
  <li role="presentation"><a href="#CB" aria-controls="CB" role="tab" data-toggle="tab" style="font-size:15px;">충북</a></li>
  <li role="presentation"><a href="#JJ" aria-controls="JJ" role="tab" data-toggle="tab" style="font-size:15px;">제주</a></li>
</ul>

<div class="tab-content">
  <div role="tabpanel" class="tab-pane active" id="SE">
  	 <label>서울전체</label><input type="checkbox" name="" value=""  />
     <label>강남구</label><input type="checkbox" name="" value=""  />
     <label>강동구</label><input type="checkbox"  name="" value=""  />
     <label>강북구</label><input type="checkbox" name="" value=""  />
     <label>강서구</label><input type="checkbox" name="" value=""  />
     <label>관악구</label><input type="checkbox" name="" value=""  />
     <label>광진구</label><input type="checkbox" name="" value=""  />
     <label>구로구</label><input type="checkbox" name="" value=""  />
     <label>금천구</label><input type="checkbox" name="" value=""  />
     <label>노원구</label><input type="checkbox" name="" value=""  />
     <label>도봉구</label><input type="checkbox" name="" value=""  />
     <label>동대문구</label><input type="checkbox" name="" value=""  />
     <label>동작구</label><input type="checkbox" name="" value=""  />
     <label>마포구</label><input type="checkbox" name="" value=""  />
     <label>서대문구</label><input type="checkbox" name="" value=""  />
     <label>서초구</label><input type="checkbox" name="" value=""  />
     <label>성동구</label><input type="checkbox" name="" value=""  />
     <label>성북구</label><input type="checkbox" name="" value=""  />
     <label>송파구</label><input type="checkbox" name="" value=""  />
     <label>양천구</label><input type="checkbox" name="" value=""  />
     <label>영등포구</label><input type="checkbox" name="" value=""  />
     <label>용산구</label><input type="checkbox" name="" value=""  />
     <label>은평구</label><input type="checkbox" name="" value=""  />
     <label>종로구</label><input type="checkbox" name="" value=""  />
     <label>중구</label><input type="checkbox" name="" value=""  />
     <label>중령구</label><input type="checkbox" name="" value=""  />
  </div>
   <div role="tabpanel" class="tab-pane" id="KK">
  	 <label>경기전체</label><input type="checkbox" name="" value=""  />
     <label>가평군</label><input type="checkbox" name="" value=""  />
     <label>고양시</label><input type="checkbox"  name="" value=""  />
     <label>고양시 덕양구</label><input type="checkbox" name="" value=""  />
     <label>고양시 일산동구</label><input type="checkbox" name="" value=""  />
     <label>고양시 일산서구</label><input type="checkbox" name="" value=""  />
     <label>과천시</label><input type="checkbox" name="" value=""  />
     <label>광명시</label><input type="checkbox" name="" value=""  />
     <label>광주시</label><input type="checkbox" name="" value=""  />
     <label>구리시</label><input type="checkbox" name="" value=""  />
     <label>군포시</label><input type="checkbox" name="" value=""  />
     <label>김포시</label><input type="checkbox" name="" value=""  />
     <label>남양주시</label><input type="checkbox" name="" value=""  />
     <label>동두천시</label><input type="checkbox" name="" value=""  />
     <label>부천시</label><input type="checkbox" name="" value=""  />
     <label>부천시 소사구</label><input type="checkbox" name="" value=""  />
     <label>부천시 오정구</label><input type="checkbox" name="" value=""  />
     <label>부천시 원미구</label><input type="checkbox" name="" value=""  />
     <label>성남시</label><input type="checkbox" name="" value=""  />
     <label>성남시 분당구</label><input type="checkbox" name="" value=""  />
     <label>성남시 수정구</label><input type="checkbox" name="" value=""  />
     <label>성남시 중원구</label><input type="checkbox" name="" value=""  />
     <label>수원시</label><input type="checkbox" name="" value=""  />
     <label>수원시 권선구</label><input type="checkbox" name="" value=""  />
     <label>수원시 영통구</label><input type="checkbox" name="" value=""  />
     <label>수원시 장안구</label><input type="checkbox" name="" value=""  />
     <label>수원시 팔달구</label><input type="checkbox" name="" value=""  />
     <label>시흥시</label><input type="checkbox" name="" value=""  />
     <label>안산시</label><input type="checkbox" name="" value=""  />
     <label>안산시 단원구</label><input type="checkbox" name="" value=""  />
     <label>안산시 상록구</label><input type="checkbox" name="" value=""  />
     <label>안성시</label><input type="checkbox" name="" value=""  />
     <label>안양시</label><input type="checkbox" name="" value=""  />
     <label>안양시 동안구</label><input type="checkbox" name="" value=""  />
     <label>안양시 만안구</label><input type="checkbox" name="" value=""  />
     <label>양주시</label><input type="checkbox" name="" value=""  />
     <label>양평군</label><input type="checkbox" name="" value=""  />
     <label>여주시</label><input type="checkbox" name="" value=""  />
     <label>연천군</label><input type="checkbox" name="" value=""  />
     <label>오산시</label><input type="checkbox" name="" value=""  />
     <label>용인시</label><input type="checkbox" name="" value=""  />
     <label>용인시 기흥구</label><input type="checkbox" name="" value=""  />
     <label>용인시 수지구</label><input type="checkbox" name="" value=""  />
     <label>용인시 처인구</label><input type="checkbox" name="" value=""  />
     <label>의왕시</label><input type="checkbox" name="" value=""  />
     <label>의정부시</label><input type="checkbox" name="" value=""  />
     <label>이천시</label><input type="checkbox" name="" value=""  />
     <label>파주시</label><input type="checkbox" name="" value=""  />
     <label>평택시</label><input type="checkbox" name="" value=""  />
     <label>포천시</label><input type="checkbox" name="" value=""  />
     <label>하남시</label><input type="checkbox" name="" value=""  />
     <label>화성시</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="IC">
     <label>인천전체</label><input type="checkbox" name="" value=""  />
     <label>강화군</label><input type="checkbox" name="" value=""  />
     <label>계양구</label><input type="checkbox"  name="" value=""  />
     <label>남구</label><input type="checkbox" name="" value=""  />
     <label>남동구</label><input type="checkbox" name="" value=""  />
     <label>동구</label><input type="checkbox" name="" value=""  />
     <label>부평구</label><input type="checkbox" name="" value=""  />
     <label>서구</label><input type="checkbox" name="" value=""  />
     <label>연수구</label><input type="checkbox" name="" value=""  />
     <label>옹진군</label><input type="checkbox" name="" value=""  />
     <label>중구</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="BS">
    <label>부산전체</label><input type="checkbox" id="bs_all" name="bs_all" value="부산전체"  />
    <label>강서구</label><input type="checkbox" id="bs_01" name="bs_01" value="부산강서구"  />
    <label>금정구</label><input type="checkbox" id="bs_02" name="bs_02" value="부산금정구"  />
    <label>기장군</label><input type="checkbox" id="bs_03" name="bs_03" value="부산기장군"  />
    <label>남구</label><input type="checkbox" id="bs_04" name="bs_04" value="부산남구"  />
    <label>동구</label><input type="checkbox" id="bs_05" name="bs_05" value="부산동구"  />
    <label>동래구</label><input type="checkbox" id="bs_06" name="bs_06" value="부산동래구"  />
    <label>부산진구</label><input type="checkbox" id ="bs_07" name="bs_07" value="부산진구"  />
    <label>북구</label><input type="checkbox" id ="bs_08" name="bs_08" value="부산북구"  />
    <label>사상구</label><input type="checkbox" id ="bs_09" name="bs_09" value="부산사상구"  />
    <label>사하구</label><input type="checkbox" id ="bs_10" name="bs_10" value="부산사하구"  />
    <label>서구</label><input type="checkbox" id ="bs_11" name="bs_11" value="부산서구"  />
    <label>수영구</label><input type="checkbox" id ="bs_12" name="bs_12" value="부산수영구"  />
    <label>연제구</label><input type="checkbox" id ="bs_13" name="bs_13" value="부산연제구"  />
    <label>영도구</label><input type="checkbox" id ="bs_14" name="bs_14" value="부산영도구"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="DG">
     <label>대구전체</label><input type="checkbox" name="" value=""  />
     <label>남구</label><input type="checkbox" name="" value=""  />
     <label>달서구</label><input type="checkbox"  name="" value=""  />
     <label>달성군</label><input type="checkbox" name="" value=""  />
     <label>동구</label><input type="checkbox" name="" value=""  />
     <label>북구</label><input type="checkbox" name="" value=""  />
     <label>서구</label><input type="checkbox" name="" value=""  />
     <label>수성구</label><input type="checkbox" name="" value=""  />
     <label>중구</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="GJ">
     <label>광주전체</label><input type="checkbox" name="" value=""  />
     <label>광산구</label><input type="checkbox" name="" value=""  />
     <label>남구</label><input type="checkbox"  name="" value=""  />
     <label>동구</label><input type="checkbox" name="" value=""  />
     <label>북구</label><input type="checkbox" name="" value=""  />
     <label>서구</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="DJ">
     <label>대전전체</label><input type="checkbox" name="" value=""  />
     <label>대덕구</label><input type="checkbox" name="" value=""  />
     <label>동구</label><input type="checkbox"  name="" value=""  />
     <label>서구</label><input type="checkbox" name="" value=""  />
     <label>유성구</label><input type="checkbox" name="" value=""  />
     <label>중구</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="WS">
     <label>울산전체</label><input type="checkbox" name="" value=""  />
     <label>남구</label><input type="checkbox" name="" value=""  />
     <label>동구</label><input type="checkbox"  name="" value=""  />
     <label>북구</label><input type="checkbox" name="" value=""  />
     <label>울주군</label><input type="checkbox" name="" value=""  />
     <label>중구</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="SJ">
     <label>세종특별자치시</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="KW">
     <label>강원전체</label><input type="checkbox" name="" value=""  />
     <label>강릉시</label><input type="checkbox" name="" value=""  />
     <label>고성군</label><input type="checkbox"  name="" value=""  />
     <label>동해시</label><input type="checkbox" name="" value=""  />
     <label>삼척시</label><input type="checkbox" name="" value=""  />
     <label>속초시</label><input type="checkbox" name="" value=""  />
     <label>양구군</label><input type="checkbox" name="" value=""  />
     <label>양양군</label><input type="checkbox" name="" value=""  />
     <label>영월군</label><input type="checkbox" name="" value=""  />
     <label>원주시</label><input type="checkbox" name="" value=""  />
     <label>인제군</label><input type="checkbox" name="" value=""  />
     <label>정선군</label><input type="checkbox" name="" value=""  />
     <label>철원군</label><input type="checkbox" name="" value=""  />
     <label>춘천시</label><input type="checkbox" name="" value=""  />
     <label>태백시</label><input type="checkbox" name="" value=""  />
     <label>평창군</label><input type="checkbox" name="" value=""  />
     <label>홍청군</label><input type="checkbox" name="" value=""  />
     <label>화천군</label><input type="checkbox" name="" value=""  />
     <label>횡성군</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="KN">
    <label>경남전체</label><input type="checkbox" name="" value=""  />
    <label>거제시</label><input type="checkbox" name="" value=""  />
    <label>거창군</label><input type="checkbox" name="" value=""  />
    <label>고성군</label><input type="checkbox" name="" value=""  />
    <label>김해시</label><input type="checkbox" name="" value=""  />
    <label>남해군</label><input type="checkbox" name="" value=""  />
    <label>밀양시</label><input type="checkbox" name="" value=""  />
    <label>사천시</label><input type="checkbox" name="" value=""  />
    <label>산청군</label><input type="checkbox" name="" value=""  />
    <label>양산시</label><input type="checkbox" name="" value=""  />
    <label>의령군</label><input type="checkbox" name="" value=""  />
    <label>진주시</label><input type="checkbox" name="" value=""  />
    <label>창년군</label><input type="checkbox" name="" value=""  />
    <label>창원시</label><input type="checkbox" name="" value=""  />
    <label>창원시 마산합포구</label><input type="checkbox" name="" value=""  />
    <label>창원시 마산회원구</label><input type="checkbox" name="" value=""  />
    <label>창원시 성산구</label><input type="checkbox" name="" value=""  />
    <label>창원시 의창구</label><input type="checkbox" name="" value=""  />
    <label>창원시 진해구</label><input type="checkbox" name="" value=""  />
    <label>통영시</label><input type="checkbox" name="" value=""  />
    <label>하동군</label><input type="checkbox" name="" value=""  />
    <label>함안군</label><input type="checkbox" name="" value=""  />
    <label>함양군</label><input type="checkbox" name="" value=""  />
    <label>합천군</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="KB">
    <label>경북전체</label><input type="checkbox" name="" value=""  />
    <label>경산시</label><input type="checkbox" name="" value=""  />
    <label>경주시</label><input type="checkbox" name="" value=""  />
    <label>고령군</label><input type="checkbox" name="" value=""  />
    <label>구미시</label><input type="checkbox" name="" value=""  />
    <label>군위군</label><input type="checkbox" name="" value=""  />
    <label>김천시</label><input type="checkbox" name="" value=""  />
    <label>문경시</label><input type="checkbox" name="" value=""  />
    <label>봉화군</label><input type="checkbox" name="" value=""  />
    <label>상주시</label><input type="checkbox" name="" value=""  />
    <label>성주군</label><input type="checkbox" name="" value=""  />
    <label>안동시</label><input type="checkbox" name="" value=""  />
    <label>영덕군</label><input type="checkbox" name="" value=""  />
    <label>영양군</label><input type="checkbox" name="" value=""  />
    <label>영주시</label><input type="checkbox" name="" value=""  />
    <label>영천시</label><input type="checkbox" name="" value=""  />
    <label>예천군</label><input type="checkbox" name="" value=""  />
    <label>울릉군</label><input type="checkbox" name="" value=""  />
    <label>울진군</label><input type="checkbox" name="" value=""  />
    <label>의성군</label><input type="checkbox" name="" value=""  />
    <label>청도군</label><input type="checkbox" name="" value=""  />
    <label>청송군</label><input type="checkbox" name="" value=""  />
    <label>칠곡군</label><input type="checkbox" name="" value=""  />
    <label>포항시</label><input type="checkbox" name="" value=""  />
    <label>포항시 남구</label><input type="checkbox" name="" value=""  />
    <label>포항시 북구</label><input type="checkbox" name="" value=""  />
  </div>
    <div role="tabpanel" class="tab-pane" id="JN">
    <label>전남전체</label><input type="checkbox" name="" value=""  />
    <label>강진군</label><input type="checkbox" name="" value=""  />
    <label>고흥군</label><input type="checkbox" name="" value=""  />
    <label>곡성군</label><input type="checkbox" name="" value=""  />
    <label>광양시</label><input type="checkbox" name="" value=""  />
    <label>구례군</label><input type="checkbox" name="" value=""  />
    <label>나주시</label><input type="checkbox" name="" value=""  />
    <label>담양군</label><input type="checkbox" name="" value=""  />
    <label>목포시</label><input type="checkbox" name="" value=""  />
    <label>무안군</label><input type="checkbox" name="" value=""  />
    <label>보성군</label><input type="checkbox" name="" value=""  />
    <label>순천시</label><input type="checkbox" name="" value=""  />
    <label>신안군</label><input type="checkbox" name="" value=""  />
    <label>여수시</label><input type="checkbox" name="" value=""  />
    <label>영광군</label><input type="checkbox" name="" value=""  />
    <label>영암군</label><input type="checkbox" name="" value=""  />
    <label>완도군</label><input type="checkbox" name="" value=""  />
    <label>장성군</label><input type="checkbox" name="" value=""  />
    <label>함평군</label><input type="checkbox" name="" value=""  />
    <label>해남군</label><input type="checkbox" name="" value=""  />
    <label>화순군</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="JN">
    <label>전북전체</label><input type="checkbox" name="" value=""  />
    <label>고창군</label><input type="checkbox" name="" value=""  />
    <label>군산시</label><input type="checkbox" name="" value=""  />
    <label>김제시</label><input type="checkbox" name="" value=""  />
    <label>남원시</label><input type="checkbox" name="" value=""  />
    <label>무주군</label><input type="checkbox" name="" value=""  />
    <label>부안군</label><input type="checkbox" name="" value=""  />
    <label>순창군</label><input type="checkbox" name="" value=""  />
    <label>완주군</label><input type="checkbox" name="" value=""  />
    <label>익산시</label><input type="checkbox" name="" value=""  />
    <label>임실군</label><input type="checkbox" name="" value=""  />
    <label>장수군</label><input type="checkbox" name="" value=""  />
    <label>전주시</label><input type="checkbox" name="" value=""  />
    <label>전주시 덕진구</label><input type="checkbox" name="" value=""  />
    <label>전주시 완산구</label><input type="checkbox" name="" value=""  />
    <label>정읍시</label><input type="checkbox" name="" value=""  />
    <label>진안군</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="CN">
    <label>충남전체</label><input type="checkbox" name="" value=""  />
    <label>계룡시</label><input type="checkbox" name="" value=""  />
    <label>공주시</label><input type="checkbox" name="" value=""  />
    <label>금산군</label><input type="checkbox" name="" value=""  />
    <label>논산시</label><input type="checkbox" name="" value=""  />
    <label>당진시</label><input type="checkbox" name="" value=""  />
    <label>보령시</label><input type="checkbox" name="" value=""  />
    <label>부여군</label><input type="checkbox" name="" value=""  />
    <label>서산시</label><input type="checkbox" name="" value=""  />
    <label>사천군</label><input type="checkbox" name="" value=""  />
    <label>아산시</label><input type="checkbox" name="" value=""  />
    <label>연기군</label><input type="checkbox" name="" value=""  />
    <label>예산군</label><input type="checkbox" name="" value=""  />
    <label>천안시</label><input type="checkbox" name="" value=""  />
    <label>천안시 동남구</label><input type="checkbox" name="" value=""  />
    <label>천안시 서북구</label><input type="checkbox" name="" value=""  />
    <label>청양군</label><input type="checkbox" name="" value=""  />
    <label>태안군</label><input type="checkbox" name="" value=""  />
    <label>홍성군</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="CB">
    <label>충북전체</label><input type="checkbox" name="" value=""  />
    <label>괴산군</label><input type="checkbox" name="" value=""  />
    <label>단양군</label><input type="checkbox" name="" value=""  />
    <label>보은군</label><input type="checkbox" name="" value=""  />
    <label>영동군</label><input type="checkbox" name="" value=""  />
    <label>옥천군</label><input type="checkbox" name="" value=""  />
    <label>음성군</label><input type="checkbox" name="" value=""  />
    <label>제천시</label><input type="checkbox" name="" value=""  />
    <label>증평군</label><input type="checkbox" name="" value=""  />
    <label>진천군</label><input type="checkbox" name="" value=""  />
    <label>청원군</label><input type="checkbox" name="" value=""  />
    <label>청주시</label><input type="checkbox" name="" value=""  />
    <label>청주시 상당구</label><input type="checkbox" name="" value=""  />
    <label>청주시 서원구</label><input type="checkbox" name="" value=""  />
    <label>청주시 청원구</label><input type="checkbox" name="" value=""  />
    <label>청주시 흥덕구</label><input type="checkbox" name="" value=""  />
    <label>충주시</label><input type="checkbox" name="" value=""  />
  </div>
  <div role="tabpanel" class="tab-pane" id="JJ">
     <label>제주전체</label><input type="checkbox" name="" value=""  />
     <label>서귀포시</label><input type="checkbox" name="" value=""  />
     <label>제주시</label><input type="checkbox" name="" value=""  />
  </div>
</div><!--End of tab-content--><hr/>
<h3>경력</h3>
 <label>신입</label><input type="checkbox" name="newcomer" value="신입" />
 <label>경력</label><input type="checkbox" name="career" value="경력" />
 <select name="career_up">
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
<select name="career_down">
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
 <label>경력무관</label><input type="checkbox" name="career_no" value="경력무관"/>
<hr/>
<h3>학력</h3>
<select name="qualify_up">
	<option value="없음">전체</option>
    <option value="고등학교졸업이상">고등학교졸업이상</option>
    <option value="2년제졸업이상">2년제졸업이상</option>
    <option value="4년제졸업이상">4년제졸업이상</option>
    <option value="석사졸업이상">석사졸업이상</option>
    <option value="박사졸업이상">박사졸업이상</option>
 </select>
~
<select name="qualify_down">
	<option value="없음">전체</option>
    <option value="고등학교졸업이하">고등학교졸업이하</option>
    <option value="2년제졸업이하">2년제졸업이하</option>
    <option value="4년제졸업이하">4년제졸업이하</option>
    <option value="석사졸업이하">석사졸업이하</option>
    <option value="박사졸업이하">박사졸업이하</option>
 </select>
 <label>학력무관</label><input type="checkbox" name="qualify_no" value="학력무관" />
<hr/>
<h3>연봉</h3>
<select name="income_up">
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
<label>회사내규에 따름 포함</label><input type="checkbox" name="income_no" value="없음" />
<input type="submit" value="검색하기" />
<hr/>
</div><!-- End of job_check_two -->
</form><!-- End of check_search.job -->
<div class="job_list">

<table class="table">
      <tr align="center">
			<td>기업명</td>
			<td>제목</td>
			<td>지원자격</td>
			<td>근무조건</td>
			<td>마감일</td>
		</tr>
	<c:forEach var="v1" items="${v1}">
	  <c:if test="${empty v1}">
         <tr>
         	<td colspan="5" align="center"><font color="red">회사 목록이 없습니다</font></td>
         </tr>
      </c:if>
      <tr align="center">
         <td>${v1.co_title}</td>
         <td><a href="#" onclick="window.open('job_detail.job?job_idx=${v1.job_idx}','${v1.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">${v1.recruit_notice}</a></td>
         <td>${v1.qualify_up} /${v1.career} ${v1.career_up}</td>
         <td>${v1.income_up}만원 ▲<br/>
         </td>
         <td>${v1.applicate_period1} ~ ${v1.applicate_period2}</td>
      </tr>
      </c:forEach>

	<c:forEach var="v2" items="${v2}">
	  <c:if test="${empty v2}">
         <tr>
         	<td colspan="5" align="center"><font color="red">회사 목록이 없습니다</font></td>
         </tr>
      </c:if>
      <tr align="center">
         <td>${v2.co_title}</td>
         <td><a href="#" onclick="window.open('job_detail.job?job_idx=${v2.job_idx}','${v2.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">${v2.recruit_notice}</a></td>
         <td>${v2.qualify_up} /${v2.career} ${v2.career_up}</td>
         <td>${v2.income_up}만원 ▲<br/>
         </td>
         <td>${v2.applicate_period1} ~ ${v2.applicate_period2}</td>
      </tr>
      </c:forEach> 
      
      <c:forEach var="v3" items="${v3}">
      <c:if test="${empty v3}">
         <tr>
         	<td colspan="5" align="center"><font color="red">회사 목록이 없습니다</font></td>
         </tr>
      </c:if>
      <tr align="center">
         <td>${v3.co_title}</td>
         <td><a href="#" onclick="window.open('job_detail.job?job_idx=${v3.job_idx}','${v3.recruit_notice}','width=700,height=700,left=250,right=150,resize=no,scrollbars=yes');">${v3.recruit_notice}</a></td>
         <td>${v3.qualify_up} /${v3.career} ${v3.career_up}</td>
         <td>${v3.income_up}만원 ▲<br/>
         </td>
         <td>${v3.applicate_period1} ~ ${v3.applicate_period2}</td>
      </tr>
      </c:forEach> 
</table>

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
<script type="text/javascript">
// $(document).ready(function() {
	
// 	$("#bs_all").click(function() {
// 		$('input:checkbox[name="bs"]').attr("checked", true); 
// 	});
	
	
// });
   </script>
   
</body>
</html>