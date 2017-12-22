package net.sns.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.Cookie;
import javax.sql.DataSource;

public class SNSDAO {
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

	
	// 글쓰기
	public void insertSnsBoard(String img, String contents, String hashtag, String auth) {
		
		try {
			con = getConnection();
			
			// comments 는 text 타입이기 때문에 default 값을 줄수 없다 그래서 여기서 '' 바로 줌
			String sql = "insert into snsboard (img,contents,comments,hashtag,auth,time) values (?,?,'',?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, img);
			pstmt.setString(2, contents);
			pstmt.setString(3, hashtag);
			pstmt.setString(4, auth);
			
			pstmt.executeUpdate();

		} catch(Exception e) {
			System.out.println("insertSnsBoard()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
	}

	public SNSDTO getLastPost(String email) { // 방금 자기가 쓴글 뿌리는 로직... 
		SNSDTO sdto = new SNSDTO();
		try {
			con = getConnection();
			
			// 본인글중 제일 최신꺼 ... 실시간으로 뿌리기 위해서 
			// authimg 때문에 join 해서 가져옴
			String sql 	= "select s.*, m.img " 
						+ "from snsboard s join member m "
						+ "on s.auth  = m.email "
						+ "where s.auth = ? "
						+ "order by 1 desc limit 0,1;";

			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			System.out.println("last post sql : " + sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				System.out.println("SNSDAO img : " + rs.getString(2));
				sdto.setIdx(Integer.parseInt(rs.getString(1)));
				sdto.setImg(rs.getString(2));
				sdto.setContents(rs.getString(3));
				sdto.setComments(rs.getString(4));
				sdto.setAuth(rs.getString(8));
				sdto.setTime(rs.getTimestamp(9));
				sdto.setAuthimg(rs.getString(10));
			}

		} catch(Exception e) {
			System.out.println("getLastPost()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		return sdto;
	}
	
	// freinds list 얻기
	public ArrayList<String> getFriendsList(String email) {
		ArrayList<String> friendsList = new ArrayList<String>();

		try {
			con = getConnection();
			
			String sql = "select friends from member where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next()){
				String friends = rs.getString("friends");
				System.out.println("java파일에서 friends : '" + friends + "' 친구 길이 : " + friends.trim().length());
				if (friends.trim().length() != 0){ // friends 가 공란이 아니면 추가 할것, 공란일때도 친추수를 1로 잡고 있더라 씨발좆같네
					String [] friendsArr = friends.split(",");
					for (int i=0; i<friendsArr.length; i++){
						friendsList.add(friendsArr[i]);
					}
				}
			}

		} catch(Exception e) {
			System.out.println("getFriendsList()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		return friendsList;
	}
	
	// sns list 얻기 (초기 로딩, 무한 스크롤 로딩)
	public ArrayList<SNSDTO> GetSNSList(int idxnum) {
		
		ArrayList<SNSDTO> result = new ArrayList<SNSDTO>(); 
	
		try {
			con = getConnection();

			// authimg 때문에 join 해서 가져옴
			String sql 	= "select s.*, m.img " 
						+ "from snsboard s join member m "
						+ "on s.auth  = m.email "
						+ "where s.idx<? "
						+ "order by 1 desc limit 0, 5;";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idxnum);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SNSDTO sdto = new SNSDTO();
				sdto.setIdx(rs.getInt(1));
				sdto.setImg(rs.getString(2));
				sdto.setContents(rs.getString(3));
				sdto.setComments(rs.getString(4));
				sdto.setAuth(rs.getString(8));
				sdto.setTime(rs.getTimestamp(9));
				sdto.setAuthimg(rs.getString(10)); // db 에는 없는값, sdto에만 있는값 
				result.add(sdto);
			}

		} catch(Exception e) {
			System.out.println("GetSNSList()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return result;
	}

	public void addCommentsInPost(int idx, String result) {
		// 기존의 comment column의 내용을 얻고, 거기다가 추가 해줄것
		try {
			con = getConnection();
			
			String sql 	= "update snsboard set comments = concat(comments,?) where idx = ?";
			 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, result);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		
		} catch(Exception e) {
			System.out.println("addCommentsInPost()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		
	}
	
}
