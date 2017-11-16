package net.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.Cookie;
import javax.sql.DataSource;

public class MemberDao {
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
	
	// 회원 가입 할때 id 중복 체크
	public boolean checkDupEmail(String email) {
		boolean check = false;
		
		try {
			con = getConnection();
			
			String sql = "SELECT email, pass FROM member WHERE email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) check = true;
			else check = false;
		} catch(Exception e) {
			System.out.println("checkDupEmail()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return check;
	}
	// 회원 가입 할때 id 중복 체크
	public boolean insertMember(String name, String email, String pass) {
		
		try {
			con = getConnection();
			
			String sql = "insert into member values (null,?,?,?,null)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, pass);
			
			pstmt.executeUpdate();

		} catch(Exception e) {
			System.out.println("insertMember()메서드에서 에러 : " + e);
			return false;
		} finally {
			freeResource();
		}
		return true;
	}
	
	// 쿠키값에서 email 값 가져오는 logic
	public String getEmailInCookie(Cookie[] cookies){

		if (cookies==null){
			return null;
		}
		
		for(Cookie cookie : cookies){
/*			System.out.println("getName  " + cookie.getName());
			System.out.println("getComment  " + cookie.getComment());
			System.out.println("getDomain  " + cookie.getDomain());
			System.out.println("getValue  " + cookie.getValue());
*/
			if(cookie.getName().equals("sirEmailId")){
				return cookie.getValue();
			}
		}
		return null;
	}
	
	
	// 로그인 하기 위해서 체크 
	public boolean checkUser(String email, String pass) {
		boolean check = false;
		
		try {
			con = getConnection();
			
			String sql = "SELECT email FROM member WHERE email=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) check = true;
			else check = false;
		} catch(Exception e) {
			System.out.println("checkUser()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return check;
	}	
}
