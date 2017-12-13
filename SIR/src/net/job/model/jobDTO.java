package net.job.model;

import java.sql.Date;

public class jobDTO {
	private String job1_code; //job1_code varchar(3),
	private String job2_code; //job2_code varchar(3),
	private String co_title; //co_title varchar(30), -- 회사명
	private String recruit_notice; //recruit_notice varchar(100), -- 채용공고
	private String logo; //logo varchar(10), -- 로고
	private Date establish; //establish date, -- 설립일
	private String sales; //sales varchar(10), -- 매출액 
	private int employees; //employees int(10), -- 사원수
	private String co_type; //co_type varchar(10), -- 기업형태
	private String co_addr; //co_addr varchar(100), -- 회사주소
	private String duty; //duty varchar(10), -- 담당업무
	private String position; //position varchar(10), -- 근무형태
	private int recruit_volume; //recruit_volume int(3), -- 모집인원
	private int applicant; //applicant int(3), -- 지원자
	private int salary1; //salary1 int(10), -- 급여시작
	private int salary2; //salary2 int(10), -- 급여끝
	//-- 지원자격
	private String qualify_school1; //qualify_school1 varchar(10), -- 학력
	private String qualify_school2; //qualify_school2 varchar(10),
	private String qualify_career1;  //varchar(10), -- 경력
	private String qualify_career2; //qualify_career2 varchar(10),
	private String qualify_license; //qualify_license varchar(50), -- 자격증
	private String prefer; //prefer varchar(50), -- 우대사항
	private Date applicate_period1; //applicate_period1 date, -- 접수기간시작
	private Date applicate_period2; //applicate_period2 date, -- 접수기간끝
	private String form; //form varchar(30), -- 지원양식
	private String reception; //reception varchar(30), -- 접수방법
	private String job_process; //job_process varchar(50) -- 전형절차
	
	public String getJob1_code() {
		return job1_code;
	}
	public void setJob1_code(String job1_code) {
		this.job1_code = job1_code;
	}
	public String getJob2_code() {
		return job2_code;
	}
	public void setJob2_code(String job2_code) {
		this.job2_code = job2_code;
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
	public int getSalary1() {
		return salary1;
	}
	public void setSalary1(int salary1) {
		this.salary1 = salary1;
	}
	public int getSalary2() {
		return salary2;
	}
	public void setSalary2(int salary2) {
		this.salary2 = salary2;
	}
	public String getQualify_school1() {
		return qualify_school1;
	}
	public void setQualify_school1(String qualify_school1) {
		this.qualify_school1 = qualify_school1;
	}
	public String getQualify_school2() {
		return qualify_school2;
	}
	public void setQualify_school2(String qualify_school2) {
		this.qualify_school2 = qualify_school2;
	}
	public String getQualify_career1() {
		return qualify_career1;
	}
	public void setQualify_career1(String qualify_career1) {
		this.qualify_career1 = qualify_career1;
	}
	public String getQualify_career2() {
		return qualify_career2;
	}
	public void setQualify_career2(String qualify_career2) {
		this.qualify_career2 = qualify_career2;
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
