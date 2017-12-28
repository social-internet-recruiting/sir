package net.job.model;

import java.sql.Date;

public class jobDTO {
	private int job_idx;  //index 번호
	private String AA; //AA varchar(10) default '', -- 기획/전략/경영
	private String AB; //AB varchar(10) default '', -- 인사/교육/노무
	private String AC; //AC varchar(10) default '', -- 마케팅/광고/분석
	private String BA; //BA varchar(10) default '', -- 간호사
	private String BB; //BB varchar(10) default '', -- 간호조무사
	private String BC; //BC varchar(10) default '', -- 세무/원무/코디
	private String CA; //CA varchar(10) default '', -- 여행/관광/항공
	private String CB; //CB varchar(10) default '', -- 요리/제빵사/영양사
	private String CC; //CC varchar(10) default '', -- 사무/원무/코디
	private String DA; //DA varchar(10) default '', -- 생산관리/품질관리
	private String DB; //DB varchar(10) default '', -- 섬유/의료/패션
	private String DC; //DC varchar(10) default '', -- 전기/전자/제어
	private String EA; //EA varchar(10) default '', -- 구매/자제/재고
	private String EB; //EB varchar(10) default '', -- 물류/유통/운송
	private String EC; //EC varchar(10) default '', -- 해외영업/무역영업
	private String FA; //FA varchar(10) default '', -- 외국어/어학원
	private String FB; //FB varchar(10) default '', -- 유치원/보육
	private String FC; //FC varchar(10) default '', -- 전문직업/IT강사
	private String GA; //GA varchar(10) default '', -- 경영분석/컨설턴트
	private String GB; //GB varchar(10) default '', -- 세무회계/CPA
	private String GC; //GC varchar(10) default '', -- 외국어/번역/통역
	private String HA; //HA varchar(10) default '', -- 웹개발
	private String HB; //HB varchar(10) default '', -- 응용프로그램개발
	private String HC; //HC varchar(10) default '', -- 게임
	private String IA; //IA varchar(10) default '', -- 공연/무대/스텝
	private String IB; //IB varchar(10) default '', -- 영화/출판/편집
	private String IC; //IC varchar(10) default '', -- 방송/연출/PD/감독
	private String BS_ALL; //BS_01 varchar(10) default '', -- 부산 전체
	private String BS_01; //BS_02 varchar(10) default '', -- 부산 강서구
	private String BS_02; //BS_03 varchar(10) default '', -- 부산 금정구
	private String BS_03; //BS_04 varchar(10) default '', -- 부산 기장군
	private String BS_04; //BS_05 varchar(10) default '', -- 부산 남구
	private String BS_05; //BS_06 varchar(10) default '', -- 부산 동구
	private String BS_06; //BS_07 varchar(10) default '', -- 부산 동래구
	private String BS_07; //BS_08 varchar(10) default '', -- 부산 진구
	private String BS_08; //BS_09 varchar(10) default '', -- 부산 북구
	private String BS_09; //BS_10 varchar(10) default '', -- 부산 사상구
	private String BS_10; //BS_11 varchar(10) default '', -- 부산 사하구
	private String BS_11; //BS_12 varchar(10) default '', -- 부산 서구
	private String BS_12; //BS_13 varchar(10) default '', -- 부산 수영구
	private String BS_13; //BS_14 varchar(10) default '', -- 부산 연제구
	private String BS_14; //BS_15 varchar(10) default '', -- 부산 영도구
	private String newcomer; //newcomer varchar(10) default '', -- 신입
	private String career; //career varchar(10) default '', -- 경력
	private String career_up; //career_up varchar(10) default '' , -- 경력 이상
	private String career_down; //career_down varchar(10) default '', -- 경력 이하
	private String qualify_up; //qualify_up varchar(10) default '', -- 학력 이상
	private String qualify_down; //qualify_down varchar(10) default '', -- 학력 이하
	private int income_up; //income_up varchar(10) default '', -- 연봉 이상
	private String co_title; //co_title varchar(30) default '', -- 회사명
	private String recruit_notice; //recruit_notice varchar(100) default '', -- 채용공고
	private String logo; //logo varchar(10) default '', -- 로고
	private Date establish; //establish date default '2000-01-01', -- 설립일
	private String sales; //sales varchar(10) default '', -- 매출액 
	private int employees; //employees int(10) default 0, -- 사원수
	private String co_type; //co_type varchar(10) default '', -- 기업형태
	private String co_addr; //co_addr varchar(100) default '', -- 회사주소
	private String duty; //duty varchar(10) default '', -- 담당업무
	private String position; //position varchar(10) default '', -- 근무형태
	private int recruit_volume; //recruit_volume int(3), -- 모집인원
	private int applicant; //applicant int(3) default 0, -- 지원자
	private String qualify_license; //qualify_license varchar(50) default '', -- 자격증
	private String prefer; //prefer varchar(50) default '', -- 우대사항
	private Date applicate_period1; //applicate_period1 Date default '2000-01-01', -- 접수기간시작
	private Date applicate_period2; //applicate_period2 Date default '2000-01-01', -- 접수기간끝
	private String form; //form varchar(30) default '', -- 지원양식
	private String reception; //reception varchar(30) default '', -- 접수방법
	private String job_process; //job_process varchar(50) default '' -- 전형절차
	public int getJob_idx() {
		return job_idx;
	}
	public void setJob_idx(int job_idx) {
		this.job_idx = job_idx;
	}
	public String getAA() {
		return AA;
	}
	public void setAA(String aA) {
		AA = aA;
	}
	public String getAB() {
		return AB;
	}
	public void setAB(String aB) {
		AB = aB;
	}
	public String getAC() {
		return AC;
	}
	public void setAC(String aC) {
		AC = aC;
	}
	public String getBA() {
		return BA;
	}
	public void setBA(String bA) {
		BA = bA;
	}
	public String getBB() {
		return BB;
	}
	public void setBB(String bB) {
		BB = bB;
	}
	public String getBC() {
		return BC;
	}
	public void setBC(String bC) {
		BC = bC;
	}
	public String getCA() {
		return CA;
	}
	public void setCA(String cA) {
		CA = cA;
	}
	public String getCB() {
		return CB;
	}
	public void setCB(String cB) {
		CB = cB;
	}
	public String getCC() {
		return CC;
	}
	public void setCC(String cC) {
		CC = cC;
	}
	public String getDA() {
		return DA;
	}
	public void setDA(String dA) {
		DA = dA;
	}
	public String getDB() {
		return DB;
	}
	public void setDB(String dB) {
		DB = dB;
	}
	public String getDC() {
		return DC;
	}
	public void setDC(String dC) {
		DC = dC;
	}
	public String getEA() {
		return EA;
	}
	public void setEA(String eA) {
		EA = eA;
	}
	public String getEB() {
		return EB;
	}
	public void setEB(String eB) {
		EB = eB;
	}
	public String getEC() {
		return EC;
	}
	public void setEC(String eC) {
		EC = eC;
	}
	public String getFA() {
		return FA;
	}
	public void setFA(String fA) {
		FA = fA;
	}
	public String getFB() {
		return FB;
	}
	public void setFB(String fB) {
		FB = fB;
	}
	public String getFC() {
		return FC;
	}
	public void setFC(String fC) {
		FC = fC;
	}
	public String getGA() {
		return GA;
	}
	public void setGA(String gA) {
		GA = gA;
	}
	public String getGB() {
		return GB;
	}
	public void setGB(String gB) {
		GB = gB;
	}
	public String getGC() {
		return GC;
	}
	public void setGC(String gC) {
		GC = gC;
	}
	public String getHA() {
		return HA;
	}
	public void setHA(String hA) {
		HA = hA;
	}
	public String getHB() {
		return HB;
	}
	public void setHB(String hB) {
		HB = hB;
	}
	public String getHC() {
		return HC;
	}
	public void setHC(String hC) {
		HC = hC;
	}
	public String getIA() {
		return IA;
	}
	public void setIA(String iA) {
		IA = iA;
	}
	public String getIB() {
		return IB;
	}
	public void setIB(String iB) {
		IB = iB;
	}
	public String getIC() {
		return IC;
	}
	public void setIC(String iC) {
		IC = iC;
	}
	
	public String getBS_ALL() {
		return BS_ALL;
	}
	public void setBS_ALL(String bS_ALL) {
		BS_ALL = bS_ALL;
	}
	public String getBS_01() {
		return BS_01;
	}
	public void setBS_01(String bS_01) {
		BS_01 = bS_01;
	}
	public String getBS_02() {
		return BS_02;
	}
	public void setBS_02(String bS_02) {
		BS_02 = bS_02;
	}
	public String getBS_03() {
		return BS_03;
	}
	public void setBS_03(String bS_03) {
		BS_03 = bS_03;
	}
	public String getBS_04() {
		return BS_04;
	}
	public void setBS_04(String bS_04) {
		BS_04 = bS_04;
	}
	public String getBS_05() {
		return BS_05;
	}
	public void setBS_05(String bS_05) {
		BS_05 = bS_05;
	}
	public String getBS_06() {
		return BS_06;
	}
	public void setBS_06(String bS_06) {
		BS_06 = bS_06;
	}
	public String getBS_07() {
		return BS_07;
	}
	public void setBS_07(String bS_07) {
		BS_07 = bS_07;
	}
	public String getBS_08() {
		return BS_08;
	}
	public void setBS_08(String bS_08) {
		BS_08 = bS_08;
	}
	public String getBS_09() {
		return BS_09;
	}
	public void setBS_09(String bS_09) {
		BS_09 = bS_09;
	}
	public String getBS_10() {
		return BS_10;
	}
	public void setBS_10(String bS_10) {
		BS_10 = bS_10;
	}
	public String getBS_11() {
		return BS_11;
	}
	public void setBS_11(String bS_11) {
		BS_11 = bS_11;
	}
	public String getBS_12() {
		return BS_12;
	}
	public void setBS_12(String bS_12) {
		BS_12 = bS_12;
	}
	public String getBS_13() {
		return BS_13;
	}
	public void setBS_13(String bS_13) {
		BS_13 = bS_13;
	}
	public String getBS_14() {
		return BS_14;
	}
	public void setBS_14(String bS_14) {
		BS_14 = bS_14;
	}
	public String getNewcomer() {
		return newcomer;
	}
	public void setNewcomer(String newcomer) {
		this.newcomer = newcomer;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getCareer_up() {
		return career_up;
	}
	public void setCareer_up(String career_up) {
		this.career_up = career_up;
	}
	public String getCareer_down() {
		return career_down;
	}
	public void setCareer_down(String career_down) {
		this.career_down = career_down;
	}
	public String getQualify_up() {
		return qualify_up;
	}
	public void setQualify_up(String qualify_up) {
		this.qualify_up = qualify_up;
	}
	public String getQualify_down() {
		return qualify_down;
	}
	public void setQualify_down(String qualify_down) {
		this.qualify_down = qualify_down;
	}
	
	public int getIncome_up() {
		return income_up;
	}
	public void setIncome_up(int income_up) {
		this.income_up = income_up;
	}
	public String getCo_title() {
		return co_title;
	}
	public void setCo_title(String co_title) {
		this.co_title = co_title;
	}
	public String getRecruit_notice() {
		return recruit_notice;
	}
	public void setRecruit_notice(String recruit_notice) {
		this.recruit_notice = recruit_notice;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public Date getEstablish() {
		return establish;
	}
	public void setEstablish(Date establish) {
		this.establish = establish;
	}
	public String getSales() {
		return sales;
	}
	public void setSales(String sales) {
		this.sales = sales;
	}
	public int getEmployees() {
		return employees;
	}
	public void setEmployees(int employees) {
		this.employees = employees;
	}
	public String getCo_type() {
		return co_type;
	}
	public void setCo_type(String co_type) {
		this.co_type = co_type;
	}
	public String getCo_addr() {
		return co_addr;
	}
	public void setCo_addr(String co_addr) {
		this.co_addr = co_addr;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public int getRecruit_volume() {
		return recruit_volume;
	}
	public void setRecruit_volume(int recruit_volume) {
		this.recruit_volume = recruit_volume;
	}
	public int getApplicant() {
		return applicant;
	}
	public void setApplicant(int applicant) {
		this.applicant = applicant;
	}
	public String getQualify_license() {
		return qualify_license;
	}
	public void setQualify_license(String qualify_license) {
		this.qualify_license = qualify_license;
	}
	public String getPrefer() {
		return prefer;
	}
	public void setPrefer(String prefer) {
		this.prefer = prefer;
	}
	public Date getApplicate_period1() {
		return applicate_period1;
	}
	public void setApplicate_period1(Date applicate_period1) {
		this.applicate_period1 = applicate_period1;
	}
	public Date getApplicate_period2() {
		return applicate_period2;
	}
	public void setApplicate_period2(Date applicate_period2) {
		this.applicate_period2 = applicate_period2;
	}
	public String getForm() {
		return form;
	}
	public void setForm(String form) {
		this.form = form;
	}
	public String getReception() {
		return reception;
	}
	public void setReception(String reception) {
		this.reception = reception;
	}
	public String getJob_process() {
		return job_process;
	}
	public void setJob_process(String job_process) {
		this.job_process = job_process;
	}
	
	
	
	
	
}
