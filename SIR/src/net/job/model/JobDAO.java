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
	
	/* DB 연결 */
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		ds = (DataSource)ctx.lookup("java:comp/env/jdbc/sir");
		return ds.getConnection();
	}
	
	/* 자원 해제 */
	private void freeResource() {
		try {
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
		} catch(Exception e) {
			System.out.println("freeResource()메서드에서 에러 : " + e);
		}
	}

	/* 전체 리스트 출력 */
	public Vector<jobDTO> getAllList() {
		Vector<jobDTO> v =new Vector<jobDTO>();
		jobDTO dto = null;
		
		try {
			
			con = getConnection(); 
			String sql = "select * from jobs";
			pstmt = con.prepareStatement(sql);
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
				dto.setSalary1(rs.getInt(16));
				dto.setSalary2(rs.getInt(17));
				dto.setQualify_school1(rs.getString(18));
				dto.setQualify_school2(rs.getString(19));
				dto.setQualify_career1(rs.getString(20));
				dto.setQualify_career2(rs.getString(21));
				dto.setQualify_license(rs.getString(22));
				dto.setPrefer(rs.getString(23));
				dto.setApplicate_period1(rs.getDate(24));
				dto.setApplicate_period2(rs.getDate(25));
				dto.setForm(rs.getString(26));
				dto.setReception(rs.getString(27));
				dto.setJob_process(rs.getString(28));
				v.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getAllList 메소드 오류" + e);
		} finally {
			freeResource();
		}
		return v;
	}

}
