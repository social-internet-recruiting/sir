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
     <label>기획/전략/경영</label><input type="checkbox" name="Check_job" value="AA"  />
     <label>인사/교육/노무</label><input type="checkbox" name="Check_job" value="AB"  />
     <label>마케팅/광고/분석</label><input type="checkbox" name="Check_job" value="AC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="B">
     <label>간호사</label><input type="checkbox" name="Check_job" value="BA"  />
     <label>간호조무사</label><input type="checkbox" name="Check_job" value="BB"  />
     <label>세무/원무/코디</label><input type="checkbox" name="Check_job" value="BC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="C">
     <label>여행/관광/항공</label><input type="checkbox" name="Check_job" value="CA"  />
     <label>요리/제빵사/영양사</label><input type="checkbox" name="Check_job" value="CB"  />
     <label>사무/원무/코디</label><input type="checkbox" name="Check_job" value="CC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="D">
     <label>생산관리/품질관리</label><input type="checkbox" name="Check_job" value="DA"  />
     <label>섬유/의료/패션</label><input type="checkbox" name="Check_job" value="DB"  />
     <label>전기/전자/제어</label><input type="checkbox" name="Check_job" value="DC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="E">
     <label>구매/자제/재고</label><input type="checkbox" name="Check_job" value="EA"  />
     <label>물류/유통/운송</label><input type="checkbox" name="Check_job" value="EB"  />
     <label>해외영업/무역영업</label><input type="checkbox" name="Check_job" value="EC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="F">
     <label>외국어/어학원</label><input type="checkbox" name="Check_job" value="FA"  />
     <label>유치원/보육</label><input type="checkbox" name="Check_job" value="FB"  />
     <label>전문직업/IT강사</label><input type="checkbox" name="Check_job" value="FC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="G">
     <label>경영분석/컨설턴트</label><input type="checkbox" name="Check_job" value="GA"  />
     <label>세무회계/CPA</label><input type="checkbox" name="Check_job" value="GB"  />
     <label>외국어/번역/통역</label><input type="checkbox" name="Check_job" value="GC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="H">
     <label>웹개발</label><input type="checkbox" name="Check_job" value="HA"  />
     <label>응용프로그램개발</label><input type="checkbox" name="Check_job" value="HB"  />
     <label>게임</label><input type="checkbox" name="Check_job" value="HC"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="I">
     <label>공연/무대/스텝</label><input type="checkbox" name="Check_job" value="IA"  />
     <label>영화/출판/편집</label><input type="checkbox" name="Check_job" value="IB"  />
     <label>방송/연출/PD/감독</label><input type="checkbox" name="Check_job" value="IC"  />
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
  <div role="tabpanel" class="tab-pane" id="SE"> 
  </div>
  <div role="tabpanel" class="tab-pane" id="IC">
     <label>인천전체</label><input type="checkbox" name="Check_region" value="인천"  />
     <label>강화군</label><input type="checkbox" name="Check_region" value="인천 강화군"  />
     <label>계양구</label><input type="checkbox"  name="Check_region" value="인천 계양구"  />
     <label>남구</label><input type="checkbox" name="Check_region" value="인천 남구"  />
     <label>남동구</label><input type="checkbox" name="Check_region" value="인천 남동구"  />
     <label>동구</label><input type="checkbox" name="Check_region" value="인천 동구"  />
     <label>부평구</label><input type="checkbox" name="Check_region" value="인천 부평구"  />
     <label>서구</label><input type="checkbox" name="Check_region" value="인천 서구"  />
     <label>연수구</label><input type="checkbox" name="Check_region" value="인천 연수구"  />
     <label>옹진군</label><input type="checkbox" name="Check_region" value="인천 옹진군"  />
     <label>중구</label><input type="checkbox" name="Check_region" value="인천 중구"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="BS">
    <label>부산전체</label><input type="checkbox" name="Check_region" value="부산"  />
    <label>강서구</label><input type="checkbox" name="Check_region" value="부산 강서구"  />
    <label>금정구</label><input type="checkbox" name="Check_region" value="부산 금정구"  />
    <label>기장군</label><input type="checkbox" name="Check_region" value="부산 기장군"  />
    <label>남구</label><input type="checkbox" name="Check_region" value="부산 남구"  />
    <label>동구</label><input type="checkbox" name="Check_region" value="부산 동구"  />
    <label>동래구</label><input type="checkbox" name="Check_region" value="부산 동래구"  />
    <label>부산진구</label><input type="checkbox" name="Check_region" value="부산 진구"  />
    <label>북구</label><input type="checkbox" name="Check_region" value="부산 북구"  />
    <label>사상구</label><input type="checkbox" name="Check_region" value="부산 사상구"  />
    <label>사하구</label><input type="checkbox" name="Check_region" value="부산 사하구"  />
    <label>서구</label><input type="checkbox" name="Check_region" value="부산 서구"  />
    <label>수영구</label><input type="checkbox" name="Check_region" value="부산 수영구"  />
    <label>연제구</label><input type="checkbox" name="Check_region" value="부산 연제구"  />
    <label>영도구</label><input type="checkbox" name="Check_region" value="부산 영도구"  />
  </div>
  <div role="tabpanel" class="tab-pane" id="KN">
    <label>경남전체</label><input type="checkbox" name="Check_region" value="경남"  />
    <label>거제시</label><input type="checkbox" name="Check_region" value="경남 거제시"  />
    <label>거창군</label><input type="checkbox" name="Check_region" value="경남 거창군"  />
    <label>고성군</label><input type="checkbox" name="Check_region" value="경남 고성군"  />
    <label>김해시</label><input type="checkbox" name="Check_region" value="경남 김해시"  />
    <label>남해군</label><input type="checkbox" name="Check_region" value="경남 남해군"  />
    <label>밀양시</label><input type="checkbox" name="Check_region" value="경남 밀양시"  />
    <label>사천시</label><input type="checkbox" name="Check_region" value="경남 사천시"  />
    <label>산청군</label><input type="checkbox" name="Check_region" value="경남 산청군"  />
    <label>양산시</label><input type="checkbox" name="Check_region" value="경남 양산시"  />
    <label>의령군</label><input type="checkbox" name="Check_region" value="경남 의령군"  />
    <label>진주시</label><input type="checkbox" name="Check_region" value="경남 진주시"  />
    <label>창년군</label><input type="checkbox" name="Check_region" value="경남 창년군"  />
    <label>창원시</label><input type="checkbox" name="Check_region" value="경남 창원시"  />
    <label>창원시 마산합포구</label><input type="checkbox" name="Check_region" value="경남 창원시 마산 합포구"  />
    <label>창원시 마산회원구</label><input type="checkbox" name="Check_region" value="경남 창원시 마산  회원구"  />
    <label>창원시 성산구</label><input type="checkbox" name="Check_region" value="경남 창원시 성산구"  />
    <label>창원시 의창구</label><input type="checkbox" name="Check_region" value="경남 창원시 의창구"  />
    <label>창원시 진해구</label><input type="checkbox" name="Check_region" value="경남 창원시 진해구"  />
    <label>통영시</label><input type="checkbox" name="Check_region" value="경남 통영시"  />
    <label>하동군</label><input type="checkbox" name="Check_region" value="경남 하동군"  />
    <label>함안군</label><input type="checkbox" name="Check_region" value="경남 함안군"  />
    <label>함양군</label><input type="checkbox" name="Check_region" value="경남 함양군"  />
    <label>합천군</label><input type="checkbox" name="Check_region" value="경남 합천군"  />
  </div>
</div><!--End of tab-content--><hr/>
<h3>경력</h3>
 <label>신입</label><input type="checkbox" name="career" value="신입" />
 <label>경력</label><input type="checkbox" name="career" value="경력" />
 <select name="career_up">
    <option value="1년  이상">1년 이상</option>
    <option value="2년 이상">2년 이상</option>
    <option value="3년 이상">3년 이상</option>
    <option value="4년 이상">4년 이상</option>
    <option value="5년 이상">5년 이상</option>
    <option value="6년 이상">6년 이상</option>
    <option value="7년 이상">7년 이상</option>
    <option value="8년 이상">8년 이상</option>
    <option value="9년 이상">9년 이상</option>
    <option value="10년 이상">10년 이상</option>
 </select>
~
<select name="career_down">
    <option value="1년 이하">1년 이하</option>
    <option value="2년 이하">2년 이하</option>
    <option value="3년 이하">3년 이하</option>
    <option value="4년 이하">4년 이하</option>
    <option value="5년 이하">5년 이하</option>
    <option value="6년 이하">6년 이하</option>
    <option value="7년 이하">7년 이하</option>
    <option value="8년 이하">8년 이하</option>
    <option value="9년 이하">9년 이하</option>
    <option value="10년 이하">10년 이하</option>
 </select>
 <label>경력무관</label><input type="checkbox" name="career" value="경력무관"/>
<hr/>
<h3>학력</h3>
<select name="qualify_school1">
	<option value="">전체</option>
    <option value="고등학교졸업 이상">고등학교졸업 이상</option>
    <option value="2년제졸업 이상">2년제졸업 이상</option>
    <option value="4년제졸업 이상">4년제졸업 이상</option>
    <option value="석사졸업 이상">석사 졸업 이상</option>
    <option value="박사졸업 이상">박사 졸업 이상</option>
 </select>
~
<select name="qualify_school2">
	<option value="">전체</option>
    <option value="고등학교졸업 이하">고등학교졸업 이하</option>
    <option value="2년제졸업 이하">2년제 졸업 이하</option>
    <option value="4년제졸업 이하">4년제 졸업 이하</option>
    <option value="석사졸업 이하">석사졸업 이하</option>
    <option value="박사졸업 이하">박사졸업 이하</option>
 </select>
 <label>학력무관</label><input type="checkbox" name="School" value="경력무관" />
<hr/>
<h3>연봉</h3>
<select name="income_up">

    <option value="">전체</option>
    <option value="1400만원 이상">1400만원 이상</option>
    <option value="1600만원 이상">1600만원 이상</option>
    <option value="1800만원 이상">1800만원 이상</option>
    <option value="2000만원 이상">2000만원 이상</option>
    <option value="2200만원 이상">2200만원이상</option>
    <option value="2400만원 이상">2400만원이상</option>
    <option value="2600만원 이상">2600만원이상</option>
    <option value="2800만원 이상">2800만원이상</option>
    <option value="3000만원 이상">3000만원이상</option>
    <option value="3200만원 이상">3200만원이상</option>
    <option value="3400만원 이상">3400만원이상</option>
    <option value="3600만원 이상">3600만원이상</option>
    <option value="3800만원 이상">3800만원이상</option>
    <option value="4000만원 이상">4000만원이상</option>
 </select>
<label>회사내규에 따름 포함</label><input type="checkbox" name="income" value="회사내규에 따름 포함" />
<input type="submit" value="검색하기" />
<hr/>
</div><!-- End of job_check_two -->

<div class="job_list">
<jsp:include page="/job/job_list.jsp" />
<table class="table">
	
	<!-- 	<tr align="center">
			<th>기업명</th>
			<th>제목</th>
			<th>지원자격</th>
			<th>근무조건</th>
			<th>마감일</th>
		</tr> -->
<%-- 	<c:forEach var="v" items="${requestScope.v}">
	
      <tr align="center">
         <td>${v.co_title}</td>
         <td>${v.recruit_notice}</td>
         <td>${v.qualify_school1} | ${v.qualify_career1}</td>
         <td>${v.position}<br/>
            ${v.salary1} ~ ${v.salary2}
         </td>
         <td>${v.applicate_period2}<Br/></td>
      </tr>
      </c:forEach> --%>
</table>
</div><!-- End of job_list -->
</form><!-- End of check_search.job -->
</div><!-- End of container -->
<!-- footer 부분 시작 -->
<jsp:include page="/include/footer.jsp"/>
<!-- footer 부분 끝 -->
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="./js/bootstrap.js"></script>

   
</body>
</html>