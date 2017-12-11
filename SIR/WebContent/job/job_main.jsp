<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="./css/bootstrap.css">
<link rel="stylesheet" href="./css/custom.css">
<title>Insert title here</title>
</head>
<style>
.job_recommand {
	width: 1000px;
	height: 250px;
	background-color: yellow;
	text-align:center;
	padding-top:100px;
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
	<form>
	<input type="text"><input type="button" value="검색" />
	</form>
	</div><!-- End of job_search -->
	
	<form>
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
  	<label for="check_AA">기획/전략/경영</label><input type="checkbox" id="check_AA" name="AA" value="AA"  />
  	<label for="check_AB">인사/교육/노무</label><input type="checkbox" id="check_AB" name="AB" value="AB"  />
  	<label for="check_AC">마케팅/광고/분석</label><input type="checkbox" id="check_AC" name="AC" value="AC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="B">
  	<label for="check_BA">간호사</label><input type="checkbox" id="check_BA" name="BA" value="BA"  />
  	<label for="check_BB">간호조무사</label><input type="checkbox" id="check_BB" name="BB" value="BB"  />
  	<label for="check_BC">세무/원무/코디</label><input type="checkbox" id="check_BC" name="BC" value="BC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="C">
  	<label for="check_CA">여행/관광/항공</label><input type="checkbox" id="check_cA" name="cA" value="cA"  />
  	<label for="check_CB">요리/제빵사/영양사</label><input type="checkbox" id="check_cB" name="cB" value="cB"  />
  	<label for="check_CC">사무/원무/코디</label><input type="checkbox" id="check_cC" name="cC" value="cC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="D">
  	<label for="check_DA">생산관리/품질관리</label><input type="checkbox" id="check_DA" name="DA" value="DA"  />
  	<label for="check_DB">섬유/의료/패션</label><input type="checkbox" id="check_DB" name="DB" value="DB"  />
  	<label for="check_DC">전기/전자/제어</label><input type="checkbox" id="check_DC" name="DC" value="DC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="E">
  	<label for="check_EA">구매/자제/재고</label><input type="checkbox" id="check_EA" name="EA" value="EA"  />
  	<label for="check_EB">물류/유통/운송</label><input type="checkbox" id="check_EB" name="EB" value="EB"  />
  	<label for="check_EC">해외영업/무역영업</label><input type="checkbox" id="check_EC" name="EC" value="EC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="F">
  	<label for="check_FA">외국어/어학원</label><input type="checkbox" id="check_FA" name="FA" value="FA"  />
  	<label for="check_FB">유치원/보육</label><input type="checkbox" id="check_FB" name="FB" value="FB"  />
  	<label for="check_FC">전문직업/IT강사</label><input type="checkbox" id="check_FC" name="FC" value="FC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="G">
  	<label for="check_GA">경영분석/컨설턴트</label><input type="checkbox" id="check_GA" name="GA" value="GA"  />
  	<label for="check_GB">세무회계/CPA</label><input type="checkbox" id="check_GB" name="GB" value="GB"  />
  	<label for="check_GC">외국어/번역/통역</label><input type="checkbox" id="check_GC" name="GC" value="GC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="H">
  	<label for="check_HA">웹개발</label><input type="checkbox" id="check_HA" name="HA" value="HA"  />
  	<label for="check_HB">응용프로그램개발</label><input type="checkbox" id="check_HB" name="HB" value="HB"  />
  	<label for="check_HC">게임</label><input type="checkbox" id="check_HC" name="HC" value="HC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="I">
  	<label for="check_IA">공연/무대/스텝</label><input type="checkbox" id="check_IA" name="IA" value="IA"  />
  	<label for="check_IB">영화/출판/편집</label><input type="checkbox" id="check_IB" name="IB" value="IB"  />
  	<label for="check_IC">방송/연출/PD/감독</label><input type="checkbox" id="check_IC" name="IC" value="IC"  />
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
  <div role="tabpanel" class="tab-pane" id="IC">
  	<label for="IC_01">인천전체</label><input type="checkbox" id="IC_01" name="IC_01" value="IC_01"  />
  	<label for="IC_02">강화군</label><input type="checkbox" id="IC_02" name="IC_02" value="IC_02"  />
  	<label for="IC_03">계양구</label><input type="checkbox" id="IC_03" name="IC_03" value="IC_03"  />
  	<label for="IC_04">남구</label><input type="checkbox" id="IC_04" name="IC_04" value="IC_04"  />
  	<label for="IC_05">남동구</label><input type="checkbox" id="IC_05" name="IC_05" value="IC_05"  />
  	<label for="IC_06">동구</label><input type="checkbox" id="IC_06" name="IC_06" value="IC_06"  />
  	<label for="IC_07">부평구</label><input type="checkbox" id="IC_07" name="IC_07" value="IC_07"  />
  	<label for="IC_08">서구</label><input type="checkbox" id="IC_08" name="IC_08" value="IC_08"  />
  	<label for="IC_09">연수구</label><input type="checkbox" id="IC_09" name="IC_09" value="IC_09"  />
  	<label for="IC_10">옹진군</label><input type="checkbox" id="IC_10" name="IC_10" value="IC_10"  />
  	<label for="IC_11">중구</label><input type="checkbox" id="IC_11" name="IC_11" value="IC_11"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="BS">
 	<label for="BS_01">부산전체</label><input type="checkbox" id="BS_01" name="BS_01" value="BS_01"  />
 	<label for="BS_02">강서구</label><input type="checkbox" id="BS_02" name="BS_02" value="BS_02"  />
 	<label for="BS_03">금정구</label><input type="checkbox" id="BS_03" name="BS_03" value="BS_03"  />
 	<label for="BS_04">기장군</label><input type="checkbox" id="BS_04" name="BS_04" value="BS_04"  />
 	<label for="BS_05">남구</label><input type="checkbox" id="BS_05" name="BS_05" value="BS_05"  />
 	<label for="BS_06">동구</label><input type="checkbox" id="BS_06" name="BS_06" value="BS_06"  />
 	<label for="BS_07">동래구</label><input type="checkbox" id="BS_07" name="BS_07" value="BS_07"  />
 	<label for="BS_08">부산진구</label><input type="checkbox" id="BS_08" name="BS_08" value="BS_08"  />
 	<label for="BS_09">북구</label><input type="checkbox" id="BS_09" name="BS_09" value="BS_09"  />
 	<label for="BS_10">사상구</label><input type="checkbox" id="BS_10" name="BS_10" value="BS_10"  />
 	<label for="BS_11">사하구</label><input type="checkbox" id="BS_11" name="BS_11" value="BS_11"  />
 	<label for="BS_12">서구</label><input type="checkbox" id="BS_12" name="BS_12" value="BS_12"  />
 	<label for="BS_13">수영구</label><input type="checkbox" id="BS_13" name="BS_13" value="BS_13"  />
 	<label for="BS_14">연제구</label><input type="checkbox" id="BS_14" name="BS_14" value="BS_14"  />
 	<label for="BS_15">영도구</label><input type="checkbox" id="BS_15" name="BS_15" value="BS_15"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="KN">
 	<label for="KN_01">경남전체</label><input type="checkbox" id="KN_01" name="KN_01" value="KN_01"  />
 	<label for="KN_02">거제시</label><input type="checkbox" id="KN_02" name="KN_02" value="KN_02"  />
 	<label for="KN_03">거창군</label><input type="checkbox" id="KN_03" name="KN_03" value="KN_03"  />
 	<label for="KN_04">고성군</label><input type="checkbox" id="KN_04" name="KN_04" value="KN_04"  />
 	<label for="KN_05">김해시</label><input type="checkbox" id="KN_05" name="KN_05" value="KN_05"  />
 	<label for="KN_06">남해군</label><input type="checkbox" id="KN_06" name="KN_06" value="KN_06"  />
 	<label for="KN_07">밀양시</label><input type="checkbox" id="KN_07" name="KN_07" value="KN_07"  />
 	<label for="KN_08">사천시</label><input type="checkbox" id="KN_08" name="KN_08" value="KN_08"  />
 	<label for="KN_09">산청군</label><input type="checkbox" id="KN_09" name="KN_09" value="KN_09"  />
 	<label for="KN_10">양산시</label><input type="checkbox" id="KN_10" name="KN_10" value="KN_10"  />
 	<label for="KN_11">의령군</label><input type="checkbox" id="KN_11" name="KN_11" value="KN_11"  />
 	<label for="KN_12">진주시</label><input type="checkbox" id="KN_12" name="KN_12" value="KN_12"  />
 	<label for="KN_13">창년군</label><input type="checkbox" id="KN_13" name="KN_13" value="KN_13"  />
 	<label for="KN_14">창원시</label><input type="checkbox" id="KN_14" name="KN_14" value="KN_14"  />
 	<label for="KN_15">창원시 마산합포구</label><input type="checkbox" id="KN_15" name="KN_15" value="KN_15"  />
 	<label for="KN_16">창원시 마산회원구</label><input type="checkbox" id="KN_16" name="KN_16" value="KN_16"  />
 	<label for="KN_17">창원시 성산구</label><input type="checkbox" id="KN_17" name="KN_17" value="KN_17"  />
 	<label for="KN_18">창원시 의창구</label><input type="checkbox" id="KN_18" name="KN_18" value="KN_18"  />
 	<label for="KN_19">창원시 진해구</label><input type="checkbox" id="KN_19" name="KN_19" value="KN_19"  />
 	<label for="KN_20">통영시</label><input type="checkbox" id="KN_20" name="KN_20" value="KN_20"  />
 	<label for="KN_21">하동군</label><input type="checkbox" id="KN_21" name="KN_21" value="KN_21"  />
 	<label for="KN_22">함안군</label><input type="checkbox" id="KN_22" name="KN_22" value="KN_22"  />
 	<label for="KN_23">함양군</label><input type="checkbox" id="KN_23" name="KN_23" value="KN_23"  />
 	<label for="KN_24">합천군</label><input type="checkbox" id="KN_24" name="KN_24" value="KN_24"  />
  </div>
</div><!--End of tab-content--><hr/>
<h3>경력</h3>
 <label for="newcomer">신입</label><input type="checkbox" id="newcomer" value="newcomer" name="newcomer"/>
 <label for="career">경력</label><input type="checkbox" id="career" value="career" name="career"/>
 <select>
 	<option>1년</option>
 	<option>2년</option>
 	<option>3년</option>
 	<option>4년</option>
 	<option>5년</option>
 	<option>6년</option>
 	<option>7년</option>
 	<option>8년</option>
 	<option>9년</option>
 	<option>10년</option>
 </select>
~
<select>
 	<option>1년</option>
 	<option>2년</option>
 	<option>3년</option>
 	<option>4년</option>
 	<option>5년</option>
 	<option>6년</option>
 	<option>7년</option>
 	<option>8년</option>
 	<option>9년</option>
 	<option>10년</option>
 </select>
 <label for="career_no">경력무관</label><input type="checkbox" class="career_no" value="career_no" name="career_no"/>
<hr/>
<h3>학력</h3>
<select>
	<option>중학교졸업</option>
 	<option>고등학교졸업</option>
 	<option>2년제 졸업</option>
 	<option>4년제 졸업</option>
 	<option>대학원 졸업</option>
 </select>
~
<select>
 	<option>중학교졸업</option>
 	<option>고등학교졸업</option>
 	<option>2년제 졸업</option>
 	<option>4년제 졸업</option>
 	<option>대학원 졸업</option>
 </select>
 <label for="career_no">경력무관</label><input type="checkbox" class="career_no" value="career_no" name="career_no"/>
<hr/>
<h3>연봉</h3>
<select>
 	<option>전체</option>
 	<option>1400만원이상</option>
 	<option>1600만원이상</option>
 	<option>1800만원이상</option>
 	<option>2200만원이상</option>
 	<option>2400만원이상</option>
 	<option>2600만원이상</option>
 	<option>2800만원이상</option>
 	<option>3000만원이상</option>
 	
 </select>
<label for="career_no">회사내규에 따름 포함</label><input type="checkbox" class="career_no" value="career_no" name="career_no"/>
<hr/>
</div><!-- End of job_check_two -->
</form>
	<div class="job_list">
	</div><!-- End of job_list -->
</div><!-- End of container -->
<!-- footer 부분 시작 -->
<jsp:include page="/include/footer.jsp"/>
<!-- footer 부분 끝 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="./js/bootstrap.js"></script>

	
</body>
</html>