package net.list.controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ListAction {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	DataSource ds = null;
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/sir");
		return ds.getConnection();
	}
	
	private void freeResource() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) {
			System.out.println("freeResource()메서드에서 에러 : " + e);
		}
	}

	public ArrayList<String> getHighSchoolList(String inputSchool) {
		ArrayList<String> schoolList = new ArrayList<String>();
		
		try {
			con = getConnection();
			
			// 중복 제거하고 내림차순 정렬
			// String sql = "SELECT DISTINCT(high_school) FROM member WHERE high_school like ? order by 1" ;
			// 고등하교 table<high_school_count> 추가 해서 select 해서 가져옴
			String sql = "SELECT high_school, count FROM high_school WHERE high_school like ? order by count desc" ;

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + inputSchool +  "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				schoolList.add(rs.getString(1));	// 학교 이름
				schoolList.add(rs.getString(2));	// 학교 count
			}

		} catch(Exception e) {
			System.out.println("getHighSchoolList()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return schoolList;
	}
	
	public ArrayList<String> getUniversitySchoolList(String inputSchool) {
		ArrayList<String> schoolList = new ArrayList<String>();
		
		try {
			con = getConnection();

			String sql = "SELECT university, count FROM university WHERE university like ? order by count desc" ;

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + inputSchool +  "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				schoolList.add(rs.getString(1));	// 학교 이름
				schoolList.add(rs.getString(2));	// 학교 count
			}

		} catch(Exception e) {
			System.out.println("getUniversityList()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return schoolList;
	}

	public ArrayList<String> getJobCode(String job1_name) {
		
	ArrayList<String> job2_name_list = new ArrayList<String>();

		try {
			con = getConnection();

			String sql = "SELECT job2_name FROM jobcode WHERE job1_name=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, job1_name);
			// System.out.println(job1_name);
			// System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				job2_name_list.add(rs.getString(1));	// job2_name 
			}

		} catch(Exception e) {
			System.out.println("getJobCode()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return job2_name_list;

	}

	public String getSelectedJob2(String email) {
		String result = "";
		
		try {
			con = getConnection();

			String sql = "SELECT job2_name FROM member WHERE email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			// System.out.println(job1_name);
			// System.out.println(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getString(1);
			}

		} catch(Exception e) {
			System.out.println("getSelectedJob2()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return result;
	}
}
