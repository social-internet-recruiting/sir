package net.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.Cookie;
import javax.sql.DataSource;

public class MemberDAO {
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
	
	// 회원가입
	public boolean insertMember(String name, String email, String pass) {
		
		try {
			con = getConnection();
			
			String sql = "insert into member (name,email,pass) values (?,?,?)";
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
	
	// 로그인 하기 위해서 입력한 email 과 pass 가 맞는지 체크 
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
	
	// 로그인 하기 위해서 입력한 email 과 pass 가 맞는지 체크 
	public MemberDTO getMemberInfoDTO(String email) {
		
		MemberDTO mdto = new MemberDTO();
		
		try {
			con = getConnection();
			
			String sql = "SELECT * FROM member WHERE email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){ // 일단 모든 정보 담기
				mdto.setIdx(rs.getInt(1));                                            
				mdto.setName(rs.getString(2));                                        
				mdto.setEmail(rs.getString(3));                                       
				mdto.setPass(rs.getString(4));                                        
				mdto.setImg(rs.getString(5));                                         
				mdto.setIntro(rs.getString(6));                                       
				mdto.setGender(rs.getString(7));                                      
				mdto.setPhone(rs.getString(8));                                       
				mdto.setAddr(rs.getString(9));                                        
				mdto.setHigh_school(rs.getString(10));                                
				mdto.setUniversity(rs.getString(11));                                 
				mdto.setMajor(rs.getString(12));                                      
				mdto.setGraduate_school(rs.getString(13));                            
				mdto.setHobby(rs.getString(14));                                      
				mdto.setJob1_code(rs.getString(15));                                  
				mdto.setJob1_name(rs.getString(16));                                  
				mdto.setJob2_code(rs.getString(17));                                  
				mdto.setJob2_name(rs.getString(18));                                  
				mdto.setCertification1(rs.getString(19));                             
				mdto.setCertification2(rs.getString(20));                             
				mdto.setCertification3(rs.getString(21));                             
				mdto.setLangu1(rs.getString(22));                                     
				mdto.setGrade1(rs.getString(23));                                     
				mdto.setLangu2(rs.getString(24));                                     
				mdto.setGrade2(rs.getString(25));                                     
				mdto.setLangu3(rs.getString(26));                                     
				mdto.setGrade3(rs.getString(27));                                     
				mdto.setPrev_company(rs.getString(28));                               
				mdto.setPrev_title(rs.getString(29));                                 
				mdto.setPrev_startdate(rs.getDate(30));                          
				mdto.setPrev_finishdate(rs.getDate(31));                         
				mdto.setPrev_jobcontent(rs.getString(32));
				
				// 공개 비공개 설정
				mdto.setPublic_phone(rs.getInt(33)); 
				mdto.setPublic_addr(rs.getInt(34));
				mdto.setPublic_school(rs.getInt(35));
				mdto.setPublic_interest(rs.getInt(36));
				mdto.setPublic_cert(rs.getInt(37));
				mdto.setPublic_intro(rs.getInt(38));
				mdto.setPublic_career(rs.getInt(39));
				
			}

		} catch(Exception e) {
			System.out.println("getMemberInfoDTO()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return mdto;
	}

	
	public void reviseMyInfo(MemberDTO mdto) {
		
		try {
			con = getConnection();

			String sql 	= "update member set name=?, intro=?, gender=?, phone=?, "
						+ "img=?, high_school=?, university=?,job1_name=?,job2_name=?,addr=?, "
						+ "prev_company=?, prev_title=?, prev_startdate=?, prev_finishdate=?, prev_jobcontent=?, "
						+ "public_phone=?, public_addr=?, public_school=?, public_interest=?, "
						+ "public_cert=?, public_intro=?, public_career=? "
						+ "where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getName());
			pstmt.setString(2, mdto.getIntro());
			pstmt.setString(3, mdto.getGender());
			pstmt.setString(4, mdto.getPhone());
			pstmt.setString(5, mdto.getImg());
			pstmt.setString(6, mdto.getHigh_school());
			pstmt.setString(7, mdto.getUniversity());
			pstmt.setString(8, mdto.getJob1_name());
			pstmt.setString(9, mdto.getJob2_name());
			pstmt.setString(10, mdto.getAddr());
			
			// 전직장 정보
			pstmt.setString(11, mdto.getPrev_company());
			pstmt.setString(12, mdto.getPrev_title());
			pstmt.setDate(13, mdto.getPrev_startdate());
			pstmt.setDate(14, mdto.getPrev_finishdate());
			pstmt.setString(15, mdto.getPrev_jobcontent());

			// 공개 비공개 설정
			pstmt.setInt(16, mdto.getPublic_phone());
			pstmt.setInt(17, mdto.getPublic_addr());
			pstmt.setInt(18, mdto.getPublic_school());
			pstmt.setInt(19, mdto.getPublic_interest());
			pstmt.setInt(20, mdto.getPublic_cert());
			pstmt.setInt(21, mdto.getPublic_intro());
			pstmt.setInt(22, mdto.getPublic_career());

			pstmt.setString(23, mdto.getEmail());

			pstmt.executeUpdate();

		} catch(Exception e) {
			System.out.println("reviseMyInfo()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
	}

	public void reviseSchoolCount(String delHigh, String delUni, String high_school, String university) {
		
		try {
			System.out.println("-1 고등학교 이름 : " + delHigh);
			System.out.println("-1 대학교 이름 : " + delUni);
			System.out.println("+1 고등학교 이름: " + high_school);
			System.out.println("+1 대학교 이름 : " + university);

			String sql="";
			con = getConnection();
			
			// 고등학교 -1
			sql = "update high_school set count = count - 1 where high_school=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delHigh);
			pstmt.executeUpdate();

			// 고등학교 -1 하다가 0이면 삭제
			sql = "select count from high_school where high_school=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delHigh);
			rs = pstmt.executeQuery();
			if (rs.next()){
				if (rs.getInt("count")==0){
					sql = "delete from high_school where high_school=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, delHigh);
					pstmt.executeUpdate();
				}
			}

			// 대학교 -1			 
			sql = "update university set count = count - 1 where university=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delUni);
			pstmt.executeUpdate();

			// 대학교 -1 하다가 0이면 삭제			
			sql = "select count from university where university=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, delUni);
			rs = pstmt.executeQuery();
			if (rs.next()){
				if (rs.getInt("count")==0){
					sql = "delete from university where university=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, delUni);
					pstmt.executeUpdate();
				}
			}

			// 고등학교 +1
			if (!"".equals(high_school.trim())){ // 고등학교 입력값이 있으면
				sql = "select count from high_school where high_school=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, high_school);
				rs = pstmt.executeQuery();
				if (rs.next()){ // 추가 되어있으면 +1
					sql = "update high_school set count = count + 1 where high_school=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, high_school);
					pstmt.executeUpdate();
				} else { // 없으면 row추가하고 1바로 줄것
					sql = "insert into high_school values (?,1)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, high_school);
					pstmt.executeUpdate();
				}
			}

			// 대학교 +1			
			if (!"".equals(university.trim())){ // 대학교 입력값이 있으면
				sql = "select count from university where university=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, university);
				rs = pstmt.executeQuery();
				if (rs.next()){ // 추가 되어있으면 +1
					sql = "update university set count = count + 1 where university=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, university);
					pstmt.executeUpdate();
				} else { // 없으면 row추가하고 1바로 줄것
					sql = "insert into university values (?,1)";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, university);
					pstmt.executeUpdate();
				}
			}
			
		} catch (Exception e) {
			System.out.println("reviseSchoolCount()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
	}
}
