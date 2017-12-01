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
	private Timestamp prev_startdate;
	private Timestamp prev_finishdate;
	private String prev_jobcontent;
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
	public Timestamp getPrev_startdate() {
		return prev_startdate;
	}
	public void setPrev_startdate(Timestamp prev_startdate) {
		this.prev_startdate = prev_startdate;
	}
	public Timestamp getPrev_finishdate() {
		return prev_finishdate;
	}
	public void setPrev_finishdate(Timestamp prev_finishdate) {
		this.prev_finishdate = prev_finishdate;
	}
	public String getPrev_jobcontent() {
		return prev_jobcontent;
	}
	public void setPrev_jobcontent(String prev_jobcontent) {
		this.prev_jobcontent = prev_jobcontent;
	}
	
	
}
