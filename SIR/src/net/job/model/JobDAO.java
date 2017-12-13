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
				dto.setJob1_code(rs.getString(1));
				dto.setJob2_code(rs.getString(2));
				dto.setCo_title(rs.getString(3));
				dto.setRecruit_notice(rs.getString(4));
				dto.setLogo(rs.getString(5));
				dto.setEstablish(rs.getDate(6));
				dto.setSales(rs.getString(7));
				dto.setEmployees(rs.getInt(8));
				dto.setCo_type(rs.getString(9));
				dto.setCo_addr(rs.getString(10));
				dto.setDuty(rs.getString(11));
				dto.setPosition(rs.getString(12));
				dto.setRecruit_volume(rs.getInt(13));
				dto.setApplicant(rs.getInt(14));
				dto.setSalary1(rs.getInt(15));
				dto.setSalary2(rs.getInt(16));
				dto.setQualify_school1(rs.getString(17));
				dto.setQualify_school2(rs.getString(18));
				dto.setQualify_career1(rs.getString(19));
				dto.setQualify_career2(rs.getString(20));
				dto.setQualify_license(rs.getString(21));
				dto.setPrefer(rs.getString(22));
				dto.setApplicate_period1(rs.getDate(23));
				dto.setApplicate_period2(rs.getDate(24));
				dto.setForm(rs.getString(25));
				dto.setReception(rs.getString(26));
				dto.setJob_process(rs.getString(27));
			}
			
		} catch (Exception e) {
			System.out.println("getAllList 메소드 오류" + e);
		} finally {
			
		}
		return null;
	}

}
