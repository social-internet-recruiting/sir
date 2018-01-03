package net.member.model;

import java.sql.*;

public class MemberDTO {
	
	private int Idx;
	private String name;
	private String email;
	private String pass;
	private String img;
	private String intro;
	private String gender;
	private String phone;
	private String addr;
	private String high_school;
	private String university;
	private String major;
	private String graduate_school;
	private String hobby;
	private String job1_code;
	private String job1_name;
	private String job2_code;
	private String job2_name;
	private String certification1;
	private String certification2;
	private String certification3;
	private String langu1;
	private String grade1;	
	private String langu2;
	private String grade2;	
	private String langu3;	
	private String grade3;
	private String prev_company;
	private String prev_title;
	private Date prev_startdate;
	private Date prev_finishdate;
	private String prev_jobcontent;
	
	// 친구, 스크랩, 요청받은거 
	private String friends;
	private String scrap;
	private String asked;
	
	// 공개 비공개 설정
	private int public_phone;
	private int public_addr;
	private int public_school;
	private int public_interest;
	private int public_cert;
	private int public_intro;
	private int public_career;
	
	public String getFriends() {
		return friends;
	}
	public void setFriends(String friends) {
		this.friends = friends;
	}
	public String getScrap() {
		return scrap;
	}
	public void setScrap(String scrap) {
		this.scrap = scrap;
	}
	public String getAsked() {
		return asked;
	}
	public void setAsked(String asked) {
		this.asked = asked;
	}
	public int getPublic_phone() {
		return public_phone;
	}
	public void setPublic_phone(int public_phone) {
		this.public_phone = public_phone;
	}
	public int getPublic_addr() {
		return public_addr;
	}
	public void setPublic_addr(int public_addr) {
		this.public_addr = public_addr;
	}
	public int getPublic_school() {
		return public_school;
	}
	public void setPublic_school(int public_school) {
		this.public_school = public_school;
	}
	public int getPublic_interest() {
		return public_interest;
	}
	public void setPublic_interest(int public_interest) {
		this.public_interest = public_interest;
	}
	public int getPublic_cert() {
		return public_cert;
	}
	public void setPublic_cert(int public_cert) {
		this.public_cert = public_cert;
	}
	public int getPublic_intro() {
		return public_intro;
	}
	public void setPublic_intro(int public_intro) {
		this.public_intro = public_intro;
	}
	public int getPublic_career() {
		return public_career;
	}
	public void setPublic_career(int public_career) {
		this.public_career = public_career;
	}
	public int getIdx() {
		return Idx;
	}
	public void setIdx(int idx) {
		Idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getHigh_school() {
		return high_school;
	}
	public void setHigh_school(String high_school) {
		this.high_school = high_school;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGraduate_school() {
		return graduate_school;
	}
	public void setGraduate_school(String graduate_school) {
		this.graduate_school = graduate_school;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getJob1_code() {
		return job1_code;
	}
	public void setJob1_code(String job1_code) {
		this.job1_code = job1_code;
	}
	public String getJob1_name() {
		return job1_name;
	}
	public void setJob1_name(String job1_name) {
		this.job1_name = job1_name;
	}
	public String getJob2_code() {
		return job2_code;
	}
	public void setJob2_code(String job2_code) {
		this.job2_code = job2_code;
	}
	public String getJob2_name() {
		return job2_name;
	}
	public void setJob2_name(String job2_name) {
		this.job2_name = job2_name;
	}
	public String getCertification1() {
		return certification1;
	}
	public void setCertification1(String certification1) {
		this.certification1 = certification1;
	}
	public String getCertification2() {
		return certification2;
	}
	public void setCertification2(String certification2) {
		this.certification2 = certification2;
	}
	public String getCertification3() {
		return certification3;
	}
	public void setCertification3(String certification3) {
		this.certification3 = certification3;
	}
	public String getLangu1() {
		return langu1;
	}
	public void setLangu1(String langu1) {
		this.langu1 = langu1;
	}
	public String getGrade1() {
		return grade1;
	}
	public void setGrade1(String grade1) {
		this.grade1 = grade1;
	}
	public String getLangu2() {
		return langu2;
	}
	public void setLangu2(String langu2) {
		this.langu2 = langu2;
	}
	public String getGrade2() {
		return grade2;
	}
	public void setGrade2(String grade2) {
		this.grade2 = grade2;
	}
	public String getLangu3() {
		return langu3;
	}
	public void setLangu3(String langu3) {
		this.langu3 = langu3;
	}
	public String getGrade3() {
		return grade3;
	}
	public void setGrade3(String grade3) {
		this.grade3 = grade3;
	}
	public String getPrev_company() {
		return prev_company;
	}
	public void setPrev_company(String prev_company) {
		this.prev_company = prev_company;
	}
	public String getPrev_title() {
		return prev_title;
	}
	public void setPrev_title(String prev_title) {
		this.prev_title = prev_title;
	}
	public Date getPrev_startdate() {
		return prev_startdate;
	}
	public void setPrev_startdate(Date prev_startdate) {
		this.prev_startdate = prev_startdate;
	}
	public Date getPrev_finishdate() {
		return prev_finishdate;
	}
	public void setPrev_finishdate(Date prev_finishdate) {
		this.prev_finishdate = prev_finishdate;
	}
	public String getPrev_jobcontent() {
		return prev_jobcontent;
	}
	public void setPrev_jobcontent(String prev_jobcontent) {
		this.prev_jobcontent = prev_jobcontent;
	}
	
	
}
