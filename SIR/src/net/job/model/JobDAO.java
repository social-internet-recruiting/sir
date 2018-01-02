package net.job.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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
			System.out.println("freeResource() 메소드 오류");
			e.printStackTrace();
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
				dto.setAA(rs.getString(2));
				dto.setAB(rs.getString(3));
				dto.setAC(rs.getString(4));
				dto.setBA(rs.getString(5));
				dto.setBB(rs.getString(6));
				dto.setBC(rs.getString(7));
				dto.setCA(rs.getString(8));
				dto.setCB(rs.getString(9));
				dto.setCC(rs.getString(10));
				dto.setDA(rs.getString(11));
				dto.setDB(rs.getString(12));
				dto.setDC(rs.getString(13));
				dto.setEA(rs.getString(14));
				dto.setEB(rs.getString(15));
				dto.setEC(rs.getString(16));
				dto.setFA(rs.getString(17));
				dto.setFB(rs.getString(18));
				dto.setFC(rs.getString(19));
				dto.setGA(rs.getString(20));
				dto.setGB(rs.getString(21));
				dto.setGC(rs.getString(22));
				dto.setHA(rs.getString(23));
				dto.setHB(rs.getString(24));
				dto.setHC(rs.getString(25));
				dto.setIA(rs.getString(26));
				dto.setIB(rs.getString(27));
				dto.setIC(rs.getString(28));
				dto.setBS_ALL(rs.getString(29));
				dto.setBS_01(rs.getString(30));
				dto.setBS_02(rs.getString(31));
				dto.setBS_03(rs.getString(32));
				dto.setBS_04(rs.getString(33));
				dto.setBS_05(rs.getString(34));
				dto.setBS_06(rs.getString(35));
				dto.setBS_07(rs.getString(36));
				dto.setBS_08(rs.getString(37));
				dto.setBS_09(rs.getString(38));
				dto.setBS_10(rs.getString(39));
				dto.setBS_11(rs.getString(40));
				dto.setBS_12(rs.getString(41));
				dto.setBS_13(rs.getString(42));
				dto.setBS_14(rs.getString(43));
				dto.setNewcomer(rs.getString(44));
				dto.setCareer(rs.getString(45));
				dto.setCareer_up(rs.getString(46));
				dto.setCareer_down(rs.getString(47));
				dto.setQualify_up(rs.getString(48));
				dto.setQualify_down(rs.getString(49));
				dto.setIncome_up(rs.getInt(50));
				dto.setCo_title(rs.getString(51));
				dto.setRecruit_notice(rs.getString(52));
				dto.setEstablish(rs.getDate(53));
				dto.setSales(rs.getString(54));
				dto.setEmployees(rs.getInt(55));
				dto.setCo_addr(rs.getString(56));
				dto.setDuty(rs.getString(57));
				dto.setPosition(rs.getString(58));
				dto.setRecruit_volume(rs.getInt(59));
				dto.setQualify_license(rs.getString(60));
				dto.setPrefer(rs.getString(61));
				dto.setApplicate_period1(rs.getDate(62));
				dto.setApplicate_period2(rs.getDate(63));
				dto.setForm(rs.getString(64));
				dto.setReception(rs.getString(65));
				dto.setJob_process(rs.getString(66));
				v.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("getAllList() error");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return v;
	} // end Vector<jobDTO> getAllList()
	
	
	/* 회사 상세 출력 */
	public jobDTO getSelectList(String idx) {
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
				dto.setAA(rs.getString(2));
				dto.setAB(rs.getString(3));
				dto.setAC(rs.getString(4));
				dto.setBA(rs.getString(5));
				dto.setBB(rs.getString(6));
				dto.setBC(rs.getString(7));
				dto.setCA(rs.getString(8));
				dto.setCB(rs.getString(9));
				dto.setCC(rs.getString(10));
				dto.setDA(rs.getString(11));
				dto.setDB(rs.getString(12));
				dto.setDC(rs.getString(13));
				dto.setEA(rs.getString(14));
				dto.setEB(rs.getString(15));
				dto.setEC(rs.getString(16));
				dto.setFA(rs.getString(17));
				dto.setFB(rs.getString(18));
				dto.setFC(rs.getString(19));
				dto.setGA(rs.getString(20));
				dto.setGB(rs.getString(21));
				dto.setGC(rs.getString(22));
				dto.setHA(rs.getString(23));
				dto.setHB(rs.getString(24));
				dto.setHC(rs.getString(25));
				dto.setIA(rs.getString(26));
				dto.setIB(rs.getString(27));
				dto.setIC(rs.getString(28));
				dto.setBS_ALL(rs.getString(29));
				dto.setBS_01(rs.getString(30));
				dto.setBS_02(rs.getString(31));
				dto.setBS_03(rs.getString(32));
				dto.setBS_04(rs.getString(33));
				dto.setBS_05(rs.getString(34));
				dto.setBS_06(rs.getString(35));
				dto.setBS_07(rs.getString(36));
				dto.setBS_08(rs.getString(37));
				dto.setBS_09(rs.getString(38));
				dto.setBS_10(rs.getString(39));
				dto.setBS_11(rs.getString(40));
				dto.setBS_12(rs.getString(41));
				dto.setBS_13(rs.getString(42));
				dto.setBS_14(rs.getString(43));
				dto.setNewcomer(rs.getString(44));
				dto.setCareer(rs.getString(45));
				dto.setCareer_up(rs.getString(46));
				dto.setCareer_down(rs.getString(47));
				dto.setQualify_up(rs.getString(48));
				dto.setQualify_down(rs.getString(49));
				dto.setIncome_up(rs.getInt(50));
				dto.setCo_title(rs.getString(51));
				dto.setRecruit_notice(rs.getString(52));
				dto.setEstablish(rs.getDate(53));
				dto.setSales(rs.getString(54));
				dto.setEmployees(rs.getInt(55));
				dto.setCo_addr(rs.getString(56));
				dto.setDuty(rs.getString(57));
				dto.setPosition(rs.getString(58));
				dto.setRecruit_volume(rs.getInt(59));
				dto.setQualify_license(rs.getString(60));
				dto.setPrefer(rs.getString(61));
				dto.setApplicate_period1(rs.getDate(62));
				dto.setApplicate_period2(rs.getDate(63));
				dto.setForm(rs.getString(64));
				dto.setReception(rs.getString(65));
				dto.setJob_process(rs.getString(66));
			}
			
		} catch (Exception e) {
			System.out.println("getSelectList() error");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return dto;
	} 
	
	/* 조건 검색 출력 */
	public Vector<jobDTO> getCheckList(String aA, String aB, String aC, String bA, String bB, String bC, String cA,
			String cB, String cC, String dA, String dB, String dC, String eA, String eB, String eC, String fA,
			String fB, String fC, String gA, String gB, String gC, String hA, String hB, String hC, String iA,
			String iB, String iC, String bS_all, String bS_01, String bS_02, String bS_03, String bS_04, String bS_05,
			String bS_06, String bS_07, String bS_08, String bS_09, String bS_10, String bS_11, String bS_12,
			String bS_13, String bS_14, String newcomer, String career, String career_up, String career_down,
		    String qualify_up, String qualify_down, int income_up) {
		
		Vector<jobDTO> v =new Vector<jobDTO>();
		jobDTO dto = null;
		
		try {
			con = getConnection();
			String sql = "select * from jobs where AA=? or AB=? or AC=? or BA=? or BB=? or BC=? or CA=? or CB=? or CC=? or"
					   + " DA=? or DB=? or DC=? or EA=? or EB=? or EC=? or FA=? or FB=? or FC=? or GA=? or GB=? or GC=? or"
					   + " HA=? or HB=? or HC=? or IA=? or IB=? or IC=? or (BS_ALL=? or BS_01=? or BS_02=? or BS_03=? or BS_04=? or"
					   + " BS_05=? or BS_06=? or BS_07=? or BS_08=? or BS_09=? or BS_10=? or BS_11=? or BS_12=? or BS_13=? or BS_14=?)"
					   + " or (newcomer=? or career=? or career_up=? or career_down=?) or (qualify_up=? and qualify_down=?)"
					   + " or income_up = ? order by job_idx desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,aA);
			pstmt.setString(2,aB);
			pstmt.setString(3,aC);
			pstmt.setString(4,bA);
			pstmt.setString(5,bB);
			pstmt.setString(6,bC);
			pstmt.setString(7,cA);
			pstmt.setString(8,cB);
			pstmt.setString(9,cC);
			pstmt.setString(10,dA);
			pstmt.setString(11,dB);
			pstmt.setString(12,dC);
			pstmt.setString(13,eA);
			pstmt.setString(14,eB);
			pstmt.setString(15,eC);
			pstmt.setString(16,fA);
			pstmt.setString(17,fB);
			pstmt.setString(18,fC);
			pstmt.setString(19,gA);
			pstmt.setString(20,gB);
			pstmt.setString(21,gC);
			pstmt.setString(22,hA);
			pstmt.setString(23,hB);
			pstmt.setString(24,hC);
			pstmt.setString(25,iA);
			pstmt.setString(26,iB);
			pstmt.setString(27,iC);
			pstmt.setString(28,bS_all);
			pstmt.setString(29,bS_01);
			pstmt.setString(30,bS_02);
			pstmt.setString(31,bS_03);
			pstmt.setString(32,bS_04);
			pstmt.setString(33,bS_05);
			pstmt.setString(34,bS_06);
			pstmt.setString(35,bS_07);
			pstmt.setString(36,bS_08);
			pstmt.setString(37,bS_09);
			pstmt.setString(38,bS_10);
			pstmt.setString(39,bS_11);
			pstmt.setString(40,bS_12);
			pstmt.setString(41,bS_13);
			pstmt.setString(42,bS_14);
			pstmt.setString(43,newcomer);
			pstmt.setString(44,career);
			pstmt.setString(45,career_up);
			pstmt.setString(46,career_down);
			pstmt.setString(47,qualify_up);
			pstmt.setString(48,qualify_down);
			pstmt.setInt(49,income_up);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new jobDTO();
				dto.setJob_idx(rs.getInt(1));
				dto.setAA(rs.getString(2));
				dto.setAB(rs.getString(3));
				dto.setAC(rs.getString(4));
				dto.setBA(rs.getString(5));
				dto.setBB(rs.getString(6));
				dto.setBC(rs.getString(7));
				dto.setCA(rs.getString(8));
				dto.setCB(rs.getString(9));
				dto.setCC(rs.getString(10));
				dto.setDA(rs.getString(11));
				dto.setDB(rs.getString(12));
				dto.setDC(rs.getString(13));
				dto.setEA(rs.getString(14));
				dto.setEB(rs.getString(15));
				dto.setEC(rs.getString(16));
				dto.setFA(rs.getString(17));
				dto.setFB(rs.getString(18));
				dto.setFC(rs.getString(19));
				dto.setGA(rs.getString(20));
				dto.setGB(rs.getString(21));
				dto.setGC(rs.getString(22));
				dto.setHA(rs.getString(23));
				dto.setHB(rs.getString(24));
				dto.setHC(rs.getString(25));
				dto.setIA(rs.getString(26));
				dto.setIB(rs.getString(27));
				dto.setIC(rs.getString(28));
				dto.setBS_ALL(rs.getString(29));
				dto.setBS_01(rs.getString(30));
				dto.setBS_02(rs.getString(31));
				dto.setBS_03(rs.getString(32));
				dto.setBS_04(rs.getString(33));
				dto.setBS_05(rs.getString(34));
				dto.setBS_06(rs.getString(35));
				dto.setBS_07(rs.getString(36));
				dto.setBS_08(rs.getString(37));
				dto.setBS_09(rs.getString(38));
				dto.setBS_10(rs.getString(39));
				dto.setBS_11(rs.getString(40));
				dto.setBS_12(rs.getString(41));
				dto.setBS_13(rs.getString(42));
				dto.setBS_14(rs.getString(43));
				dto.setNewcomer(rs.getString(44));
				dto.setCareer(rs.getString(45));
				dto.setCareer_up(rs.getString(46));
				dto.setCareer_down(rs.getString(47));
				dto.setQualify_up(rs.getString(48));
				dto.setQualify_down(rs.getString(49));
				dto.setIncome_up(rs.getInt(50));
				dto.setCo_title(rs.getString(51));
				dto.setRecruit_notice(rs.getString(52));
				dto.setEstablish(rs.getDate(53));
				dto.setSales(rs.getString(54));
				dto.setEmployees(rs.getInt(55));
				dto.setCo_addr(rs.getString(56));
				dto.setDuty(rs.getString(57));
				dto.setPosition(rs.getString(58));
				dto.setRecruit_volume(rs.getInt(59));
				dto.setQualify_license(rs.getString(60));
				dto.setPrefer(rs.getString(61));
				dto.setApplicate_period1(rs.getDate(62));
				dto.setApplicate_period2(rs.getDate(63));
				dto.setForm(rs.getString(64));
				dto.setReception(rs.getString(65));
				dto.setJob_process(rs.getString(66));
				v.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getCheckList() 메소드  error");
			e.printStackTrace();
		} finally {
			freeResource();
		}

		
		return v;
	}

	/* 텍스트 검색어 출력 */
	public Vector<jobDTO> getTextList(String company) {
		Vector<jobDTO> v =new Vector<jobDTO>();
		jobDTO dto = null;
		if (company == null) company = ""; // 검색어가 null 이면 ""으로 변경
		try {
			con = getConnection();
			String sql = "select * from jobs where co_title like '%"+company+"%' order by job_idx desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new jobDTO();
				dto.setJob_idx(rs.getInt(1));
				dto.setAA(rs.getString(2));
				dto.setAB(rs.getString(3));
				dto.setAC(rs.getString(4));
				dto.setBA(rs.getString(5));
				dto.setBB(rs.getString(6));
				dto.setBC(rs.getString(7));
				dto.setCA(rs.getString(8));
				dto.setCB(rs.getString(9));
				dto.setCC(rs.getString(10));
				dto.setDA(rs.getString(11));
				dto.setDB(rs.getString(12));
				dto.setDC(rs.getString(13));
				dto.setEA(rs.getString(14));
				dto.setEB(rs.getString(15));
				dto.setEC(rs.getString(16));
				dto.setFA(rs.getString(17));
				dto.setFB(rs.getString(18));
				dto.setFC(rs.getString(19));
				dto.setGA(rs.getString(20));
				dto.setGB(rs.getString(21));
				dto.setGC(rs.getString(22));
				dto.setHA(rs.getString(23));
				dto.setHB(rs.getString(24));
				dto.setHC(rs.getString(25));
				dto.setIA(rs.getString(26));
				dto.setIB(rs.getString(27));
				dto.setIC(rs.getString(28));
				dto.setBS_ALL(rs.getString(29));
				dto.setBS_01(rs.getString(30));
				dto.setBS_02(rs.getString(31));
				dto.setBS_03(rs.getString(32));
				dto.setBS_04(rs.getString(33));
				dto.setBS_05(rs.getString(34));
				dto.setBS_06(rs.getString(35));
				dto.setBS_07(rs.getString(36));
				dto.setBS_08(rs.getString(37));
				dto.setBS_09(rs.getString(38));
				dto.setBS_10(rs.getString(39));
				dto.setBS_11(rs.getString(40));
				dto.setBS_12(rs.getString(41));
				dto.setBS_13(rs.getString(42));
				dto.setBS_14(rs.getString(43));
				dto.setNewcomer(rs.getString(44));
				dto.setCareer(rs.getString(45));
				dto.setCareer_up(rs.getString(46));
				dto.setCareer_down(rs.getString(47));
				dto.setQualify_up(rs.getString(48));
				dto.setQualify_down(rs.getString(49));
				dto.setIncome_up(rs.getInt(50));
				dto.setCo_title(rs.getString(51));
				dto.setRecruit_notice(rs.getString(52));
				dto.setEstablish(rs.getDate(53));
				dto.setSales(rs.getString(54));
				dto.setEmployees(rs.getInt(55));
				dto.setCo_addr(rs.getString(56));
				dto.setDuty(rs.getString(57));
				dto.setPosition(rs.getString(58));
				dto.setRecruit_volume(rs.getInt(59));
				dto.setQualify_license(rs.getString(60));
				dto.setPrefer(rs.getString(61));
				dto.setApplicate_period1(rs.getDate(62));
				dto.setApplicate_period2(rs.getDate(63));
				dto.setForm(rs.getString(64));
				dto.setReception(rs.getString(65));
				dto.setJob_process(rs.getString(66));
				v.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getTextList 메소드 오류");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		return v;
	}
	
	public Vector<jobDTO> getRecommand(String job2) {
		Vector<jobDTO> v =new Vector<jobDTO>();
		jobDTO dto = null;
		String sql = "";
		try {
			con = getConnection();
			if(job2 == null) {
				sql = "select * from jobs order by job_idx desc";
			} else {
				switch(job2) {
				case "기획/전략/경영": 
					sql = "select * from jobs where AA=? order by job_idx desc";
					break;
				case "인사/교육/노무":
					sql = "select * from jobs where AB=? order by job_idx desc";
					break;
				case "마케팅/광고/분석":
					sql = "select * from jobs where AC=? order by job_idx desc";
					break;
				case "간호사":
					sql = "select * from jobs where BA=? order by job_idx desc";
					break;
				case "간호조무사":
					sql = "select * from jobs where BB=? order by job_idx desc";
					break;
				case "세무/원무/코디":
					sql = "select * from jobs where BC=? order by job_idx desc";
					break;
				case "여행/관광/항공":
					sql = "select * from jobs where CA=? order by job_idx desc";
					break;
				case "요리/제빵사/영양사":
					sql = "select * from jobs where CB=? order by job_idx desc";
					break;
				case "사무/원무/코디":
					sql = "select * from jobs where CC=? order by job_idx desc";
					break;
				case "생산관리/품질관리":
					sql = "select * from jobs where DA=? order by job_idx desc";
					break;
				case "섬유/의료/패션":
					sql = "select * from jobs where DB=? order by job_idx desc";
					break;
				case "전기/전자/제어":
					sql = "select * from jobs where DC=? order by job_idx desc";
					break;
				case "구매/자제/재고":
					sql = "select * from jobs where EA=? order by job_idx desc";
					break;
				case "물류/유통/운송":
					sql = "select * from jobs where EB=? order by job_idx desc";
					break;
				case "해외영업/무역영업":
					sql = "select * from jobs where EC=? order by jodb_idx desc";
					break;
				case "외국어/어학원":
					sql = "select * from jobs where FA=? order by jodb_idx desc";
					break;
				case "유치원/보육":
					sql = "select * from jobs where FB=? order by job_idx desc";
					break;
				case "전문직업/IT강사":
					sql = "select * from jobs where FC=? order by job_idx desc";
					break;
				case "경영분석/컨설턴트":
					sql = "select * from jobs where GA=? order by job_idx desc";
					break;
				case "세무회계/CPA":
					sql = "select * from jobs where GB=? order by job_idx desc";
					break;
				case "외국어/번역/통역":
					sql = "select * from jobs where GC=? order by job_idx desc";
					break;
				case "웹개발":
					sql = "select * from jobs where HA=? order by job_idx desc";
					break;
				case "응용프로그램개발":
					sql = "select * from jobs where HB=? order by job_idx desc";
					break;
				case "게임":
					sql = "select * from jobs where HC=? order by job_idx desc";
					break;
				case "공연/무대/스텝":
					sql = "select * from jobs where IA=? order by job_idx desc";
					break;
				case "영화/출판/편집":
					sql = "select * from jobs where IB=? order by job_idx desc";
					break;
				case "방송/연출/PD/감독":
					sql = "select * from jobs where IC=? order by job_idx desc";
					break;
				default :
				}
			}
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,job2);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new jobDTO();
				dto.setJob_idx(rs.getInt(1));
				dto.setAA(rs.getString(2));
				dto.setAB(rs.getString(3));
				dto.setAC(rs.getString(4));
				dto.setBA(rs.getString(5));
				dto.setBB(rs.getString(6));
				dto.setBC(rs.getString(7));
				dto.setCA(rs.getString(8));
				dto.setCB(rs.getString(9));
				dto.setCC(rs.getString(10));
				dto.setDA(rs.getString(11));
				dto.setDB(rs.getString(12));
				dto.setDC(rs.getString(13));
				dto.setEA(rs.getString(14));
				dto.setEB(rs.getString(15));
				dto.setEC(rs.getString(16));
				dto.setFA(rs.getString(17));
				dto.setFB(rs.getString(18));
				dto.setFC(rs.getString(19));
				dto.setGA(rs.getString(20));
				dto.setGB(rs.getString(21));
				dto.setGC(rs.getString(22));
				dto.setHA(rs.getString(23));
				dto.setHB(rs.getString(24));
				dto.setHC(rs.getString(25));
				dto.setIA(rs.getString(26));
				dto.setIB(rs.getString(27));
				dto.setIC(rs.getString(28));
				dto.setBS_ALL(rs.getString(29));
				dto.setBS_01(rs.getString(30));
				dto.setBS_02(rs.getString(31));
				dto.setBS_03(rs.getString(32));
				dto.setBS_04(rs.getString(33));
				dto.setBS_05(rs.getString(34));
				dto.setBS_06(rs.getString(35));
				dto.setBS_07(rs.getString(36));
				dto.setBS_08(rs.getString(37));
				dto.setBS_09(rs.getString(38));
				dto.setBS_10(rs.getString(39));
				dto.setBS_11(rs.getString(40));
				dto.setBS_12(rs.getString(41));
				dto.setBS_13(rs.getString(42));
				dto.setBS_14(rs.getString(43));
				dto.setNewcomer(rs.getString(44));
				dto.setCareer(rs.getString(45));
				dto.setCareer_up(rs.getString(46));
				dto.setCareer_down(rs.getString(47));
				dto.setQualify_up(rs.getString(48));
				dto.setQualify_down(rs.getString(49));
				dto.setIncome_up(rs.getInt(50));
				dto.setCo_title(rs.getString(51));
				dto.setRecruit_notice(rs.getString(52));
				dto.setEstablish(rs.getDate(53));
				dto.setSales(rs.getString(54));
				dto.setEmployees(rs.getInt(55));
				dto.setCo_addr(rs.getString(56));
				dto.setDuty(rs.getString(57));
				dto.setPosition(rs.getString(58));
				dto.setRecruit_volume(rs.getInt(59));
				dto.setQualify_license(rs.getString(60));
				dto.setPrefer(rs.getString(61));
				dto.setApplicate_period1(rs.getDate(62));
				dto.setApplicate_period2(rs.getDate(63));
				dto.setForm(rs.getString(64));
				dto.setReception(rs.getString(65));
				dto.setJob_process(rs.getString(66));
				v.add(dto);
			}
		} catch (Exception e) {
			System.out.println("getRecommand 메소드 오류");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		return v;
	}


	public void insertScrap(String email, String recruit_notice, String co_title, String co_addr, String establish,
			String sales, int employees, String duty, String position, int recruit_volume, int income_up,
			String qualify_down, String qualify_up, String career_down, String career_up, String qualify_license,
			String prefer, String applicate_period1, String applicate_period2, String form, String reception, String job_process) {
		
		
		try {		
			con = getConnection();
			String sql = "insert into job_scrap(email,career_up,career_down,qualify_up,"
					+ "	  qualify_down,income_up,co_title,recruit_notice,establish,sales,employees,"
					+ "	  co_addr,duty,position,recruit_volume,qualify_license,prefer,"
					+ "   applicate_period1,applicate_period2,form,reception,job_process) "
					+ "   values(?,?,?,?,?,?,?,?,?,?,"
					+ "          ?,?,?,?,?,?,?,?,?,?,"
					+ "          ?,?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,email);
			pstmt.setString(2,career_up);
			pstmt.setString(3,career_down);
			pstmt.setString(4,qualify_up);
			pstmt.setString(5,qualify_down);
			pstmt.setInt(6,income_up);
			pstmt.setString(7,co_title);
			pstmt.setString(8,recruit_notice);
			pstmt.setString(9,establish);
			pstmt.setString(10,sales);
			pstmt.setInt(11,employees);
			pstmt.setString(12,co_addr);
			pstmt.setString(13,duty);
			pstmt.setString(14,position);
			pstmt.setInt(15,recruit_volume);
			pstmt.setString(16,qualify_license);
			pstmt.setString(17,prefer);
			pstmt.setString(18,applicate_period1);
			pstmt.setString(19,applicate_period2);
			pstmt.setString(20,form);
			pstmt.setString(21,reception);
			pstmt.setString(22,job_process);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertScrap 메소드 오류");
			e.printStackTrace();
		} finally {
			freeResource();
		}
		
		
	}

} // end class JobDAO