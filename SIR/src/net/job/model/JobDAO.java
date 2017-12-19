package net.job.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class JobDAO {
	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;
	
	/* DB 연결*/
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/sir");
		return ds.getConnection();
	} // end Connection getConnection()
	
	
	/* 자원해제 */
	private void freeResource() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) {
			System.out.println("freeResource() 메소드 오류 : " + e);
		}
	} // end void freeResource()

	
	/* 전체List 출력 */
	public Vector<jobDTO> getAllList() {
		Vector<jobDTO> v =new Vector<jobDTO>();
		jobDTO dto = null;
		
		try {
			
			con = getConnection();
			String sql = "select * from jobs order by job_idx desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new jobDTO();
				dto.setJob_idx(rs.getInt(1));
				dto.setJob1_code(rs.getString(2));
				dto.setJob2_code(rs.getString(3));
				dto.setCo_title(rs.getString(4));
				dto.setRecruit_notice(rs.getString(5));
				dto.setLogo(rs.getString(6));
				dto.setEstablish(rs.getDate(7));
				dto.setSales(rs.getString(8));
				dto.setEmployees(rs.getInt(9));
				dto.setCo_type(rs.getString(10));
				dto.setCo_addr(rs.getString(11));
				dto.setDuty(rs.getString(12));
				dto.setPosition(rs.getString(13));
				dto.setRecruit_volume(rs.getInt(14));
				dto.setApplicant(rs.getInt(15));
				dto.setSalary_up(rs.getString(16));
				dto.setSalary_check(rs.getString(17));
				dto.setQualify_school1(rs.getString(18));
				dto.setQualify_school2(rs.getString(19));
				dto.setSchool_check(rs.getString(20));
				dto.setQualify_career1(rs.getString(21));
				dto.setQualify_career2(rs.getString(22));
				dto.setCareer_check(rs.getString(23));
				dto.setQualify_license(rs.getString(24));
				dto.setPrefer(rs.getString(25));
				dto.setApplicate_period1(rs.getDate(26));
				dto.setApplicate_period2(rs.getDate(27));
				dto.setForm(rs.getString(28));
				dto.setReception(rs.getString(29));
				dto.setJob_process(rs.getString(30));
				v.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getAllList() error : " + e);
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return v;
	} // end Vector<jobDTO> getAllList()
	
	
	/* 회사 상세 출력 */
	public jobDTO getSelectList(String idx) {
		//System.out.println("번호:" + idx);
		jobDTO dto = null;
		try {
			con = getConnection(); 
			String sql = "select * from jobs where job_idx =? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(idx));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new jobDTO();
				dto.setJob_idx(rs.getInt(1));
				dto.setJob1_code(rs.getString(2));
				dto.setJob2_code(rs.getString(3));
				dto.setCo_title(rs.getString(4));
				dto.setRecruit_notice(rs.getString(5));
				dto.setLogo(rs.getString(6));
				dto.setEstablish(rs.getDate(7));
				dto.setSales(rs.getString(8));
				dto.setEmployees(rs.getInt(9));
				dto.setCo_type(rs.getString(10));
				dto.setCo_addr(rs.getString(11));
				dto.setDuty(rs.getString(12));
				dto.setPosition(rs.getString(13));
				dto.setRecruit_volume(rs.getInt(14));
				dto.setApplicant(rs.getInt(15));
				dto.setSalary_up(rs.getString(16));
				dto.setSalary_check(rs.getString(17));
				dto.setQualify_school1(rs.getString(18));
				dto.setQualify_school2(rs.getString(19));
				dto.setSchool_check(rs.getString(20));
				dto.setQualify_career1(rs.getString(21));
				dto.setQualify_career2(rs.getString(22));
				dto.setCareer_check(rs.getString(23));
				dto.setQualify_license(rs.getString(24));
				dto.setPrefer(rs.getString(25));
				dto.setApplicate_period1(rs.getDate(26));
				dto.setApplicate_period2(rs.getDate(27));
				dto.setForm(rs.getString(28));
				dto.setReception(rs.getString(29));
				dto.setJob_process(rs.getString(30));
			}
			
		} catch (Exception e) {
			System.out.println("getSelectList() error : " + e);
		} finally {
			freeResource();
		}
		
		return dto;
	} // end jobDTO getSelectList(String idx)
	
	
	
	
	/* 총 기업List 숫자 */
	public int getTotalCount(){
		String sql = null;
		int jobTotalCount = 0;
		try {
			con = getConnection(); 
			sql = "select count(*) from jobs";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next())
				jobTotalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("getTotalCount() error : " + e);
		} finally {
			freeResource();
		}
		return jobTotalCount;
	} // end int getTotalCount()


	/* 조건 체크 검색 출력 */
	public Vector<jobDTO> getCheckList(String[] check_job, String[] check_region,
									   String[] check_career, String career_up, 
									   String career_down, String qualify_school1, 
									   String qualify_school2, String check_school,
									   String income_up, String income) {
		
		Vector<jobDTO> v =new Vector<jobDTO>();
		jobDTO dto = null;
		try {
			for(int i=0; i<v.size(); i++) {
			con = getConnection();
			String sql = "select * from jobs"
						+" where job2_code = ? and co_addr = ? and"
						+" career_check = ? and qualify_career1 =? and"
						+" qualify_career2 = ? and qualify_school1 = ? and"
						+" qualify_school2 = ? and school_check = ? and "
						+" salary_up = ? and salary_check = ?"
						+" order by job_idx desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,check_job[i]);
			System.out.println(check_job[i]);
			pstmt.setString(2,check_region[i]);
			System.out.println(check_region[i]);
			pstmt.setString(3,check_career[i]);
			System.out.println(check_career[i]);
			pstmt.setString(4,career_up);
			pstmt.setString(5,career_down);
			pstmt.setString(6,qualify_school1);
			pstmt.setString(7,qualify_school2);
			pstmt.setString(8,check_school);
			pstmt.setString(9,income_up);
			pstmt.setString(10,income);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new jobDTO();
				dto.setJob_idx(rs.getInt(1));
				dto.setJob1_code(rs.getString(2));
				dto.setJob2_code(rs.getString(3));
				dto.setCo_title(rs.getString(4));
				dto.setRecruit_notice(rs.getString(5));
				dto.setLogo(rs.getString(6));
				dto.setEstablish(rs.getDate(7));
				dto.setSales(rs.getString(8));
				dto.setEmployees(rs.getInt(9));
				dto.setCo_type(rs.getString(10));
				dto.setCo_addr(rs.getString(11));
				dto.setDuty(rs.getString(12));
				dto.setPosition(rs.getString(13));
				dto.setRecruit_volume(rs.getInt(14));
				dto.setApplicant(rs.getInt(15));
				dto.setSalary_up(rs.getString(16));
				dto.setSalary_check(rs.getString(17));
				dto.setQualify_school1(rs.getString(18));
				dto.setQualify_school2(rs.getString(19));
				dto.setSchool_check(rs.getString(20));
				dto.setQualify_career1(rs.getString(21));
				dto.setQualify_career2(rs.getString(22));
				dto.setCareer_check(rs.getString(23));
				dto.setQualify_license(rs.getString(24));
				dto.setPrefer(rs.getString(25));
				dto.setApplicate_period1(rs.getDate(26));
				dto.setApplicate_period2(rs.getDate(27));
				dto.setForm(rs.getString(28));
				dto.setReception(rs.getString(29));
				dto.setJob_process(rs.getString(30));
				v.add(dto);
				}
			}
		} catch (Exception e) {
			System.out.println("getCheckList() error : " + e);
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return v;
	}


	


	

} // end class JobDAO



