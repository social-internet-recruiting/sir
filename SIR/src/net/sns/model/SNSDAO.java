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
			
			// enter 값 <br/> 로 변경
			contents = contents.replace("\n", "<br/>");
			
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
				// System.out.println("java파일에서 friends : '" + friends + "' 친구 길이 : " + friends.trim().length());
				if (friends.trim().length() != 0){ // friends 가 공란이 아니면 추가 할것, 공란일때도 친추수를 1로 잡고 있더라 씨발좆같네
					String [] friendsArr = friends.split(",");
					for (int i=0; i<friendsArr.length; i++){
						if (friendsArr[i].trim().equals("")) continue;
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
			System.out.println("GetSNSList(sns)메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return result;
	}
	
	// myinfo 나 friendinfo 볼때 조회하고 싶은 사람
	// 게시글 list 얻기 (매개변수 두개로 구분) (초기 로딩, 무한 스크롤 로딩)
	public ArrayList<SNSDTO> GetSNSList(int idxnuminfo, String email) {
		
		ArrayList<SNSDTO> result = new ArrayList<SNSDTO>(); 
	
		try {
			con = getConnection();

			String sql 	= "select * from snsboard where idx<? and auth=? order by 1 desc limit 0,9;"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idxnuminfo);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			while(rs.next()){
				SNSDTO sdto = new SNSDTO();
				sdto.setIdx(rs.getInt(1));
				sdto.setImg(rs.getString(2));
				sdto.setContents(rs.getString(3));
				sdto.setComments(rs.getString(4));
				sdto.setAuth(rs.getString(8));
				sdto.setTime(rs.getTimestamp(9));
				// sdto.setAuthimg(rs.getString(10)); // db 에는 없는값, sdto에만 있는값 
				result.add(sdto);
			}

		} catch(Exception e) {
			System.out.println("GetSNSList(info)메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return result;
	}
	
	public ArrayList<SNSDTO> GetSNSScrapList(int idxnumScrap, String email) {
		
		ArrayList<SNSDTO> result = new ArrayList<SNSDTO>(); 
	
		try {
			con = getConnection();

			String sql 	= "select scrap from member where email=?"; 
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			
			while (rs.next()){
				
				String scrapString = rs.getString(1);
				String [] scrapList = scrapString.split(",");
				// 처음 조회 하는 값인지 확인

				System.out.println("idxnumScrap : " + idxnumScrap);
				
				if (idxnumScrap == 2147483647){ // 처음 조회 하는 값이면 max 부터 9개 
					for(int k=scrapList.length-1; k>scrapList.length-10; k--){
						if (k<0) break;
						if (scrapList[k].trim().equals("")) continue;
						int index = Integer.parseInt(scrapList[k]);
						// System.out.println("index 확인 : "+ k);
						SNSDTO getDto = getSNSDTOForScrap(index);
						result.add(getDto);
					}
				} else {
					if (idxnumScrap == 0) break;
					for(int i=scrapList.length-1; i>=0; i--){
						if (scrapList[i].equals(String.valueOf(idxnumScrap))){ // idxnumScrap 이랑 일치하면 이다음부터 9개 
							for(int k=i-1; k>i-10; k--){
								if (k<0) break;
								if (scrapList[k].trim().equals("")) continue;
								int index = Integer.parseInt(scrapList[k]);
								// System.out.println("index 확인 : "+ k);
								SNSDTO getDto = getSNSDTOForScrap(index);
								result.add(getDto);
							}
						}
					}
				}
			}
		} catch(Exception e) {
			System.out.println("GetSNSScrapList(scrap)메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return result;
	}
	public SNSDTO getSNSDTOForScrap(int idxnum){
		
		Connection conIn = null;
		PreparedStatement pstmtIn = null;
		ResultSet rsIn = null;
		DataSource dsIn = null;
		
		try {
			Context ctxIn = new InitialContext();
			dsIn = (DataSource)ctxIn.lookup("java:comp/env/jdbc/sir");
		} catch (Exception e) {
			System.out.println("getSNSDTOForScrap(sub)에서 에러 남 : " + e);
		}

		SNSDTO sdto = new SNSDTO();
		try {
			conIn = dsIn.getConnection();
			// return 할 arrayList 얻기
			String sql = "select * from snsboard where idx = ?";
			pstmtIn = conIn.prepareStatement(sql);
			pstmtIn.setInt(1, idxnum);
			rsIn = pstmtIn.executeQuery();
			while(rsIn.next()){
				sdto.setIdx(rsIn.getInt(1));
				//System.out.println("확인 : " + rsIn.getInt(1));
				sdto.setImg(rsIn.getString(2));
				sdto.setContents(rsIn.getString(3));
				sdto.setComments(rsIn.getString(4));
				sdto.setAuth(rsIn.getString(8));
				sdto.setTime(rsIn.getTimestamp(9));
				// sdto.setAuthimg(rsIn.getString(10)); // db 에는 없는값, sdto에만 있는값 
			}
		} catch(Exception e) {
			System.out.println("getSNSDTOForScrap(scrap)메서드에서 에러 : " + e);
		} finally {
			try {
				if(conIn != null) conIn.close();
				if(pstmtIn != null) pstmtIn.close();
				if(rsIn != null) rsIn.close();
			} catch(Exception e) {
				System.out.println("getSNSDTOForScrap(finally)메서드에서 에러 : " + e);
			}
		}
		return sdto;
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

	public int addScrap(String email, String postIdx) {
		int result = 1;
		try {
			con = getConnection();
			
			String sql 	= "select scrap from member where scrap like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%," + postIdx +  ",%");
			rs = pstmt.executeQuery();
			if (rs.next()){
				result = 0;
			} else {// 스크랩에 글번호 추가 안되어 있으면 스크랩 추가 
				sql = "update member set scrap = concat(scrap,?) where email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,postIdx +  ",");
				pstmt.setString(2,email);
				pstmt.executeUpdate();
				result = 1;
			}
		} catch(Exception e) {
			System.out.println("addScrap()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}	
		
		return result;
	}

	public int askingFriend(String askingId, String askedId) {
		int result = 1;
		try {
			con = getConnection();
			
			String sql 	= "select asked from member where asked like ? or friends like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%," + askingId +  ",%");
			pstmt.setString(2, "%," + askingId +  ",%");
			rs = pstmt.executeQuery();
			if (rs.next()){ // 이미 친구 이거나, 친구 추천 했거나
				result = 0;
			} else {// 요청에 askingId 없으면 1 반환 
				sql = "update member set asked = concat(asked,?) where email = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,askingId +  ",");
				pstmt.setString(2,askedId);
				pstmt.executeUpdate();
				result = 1;
			}
		} catch(Exception e) {
			System.out.println("askingFriend()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}	
		
		return result;
	}

	public ArrayList<String> getFriendAskedList(String email) {
		
		ArrayList<String> result = new ArrayList<String>(); 
		
		try {
			con = getConnection();

			String sql 	= "select asked from member where email=?"; 
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String askedString = rs.getString(1);
				String[] array = askedString.split(",");
				for (int i=0; i<array.length; i++){
					if (array[i].trim().equals("")) continue;
					result.add(array[i]);
				}
			}

		} catch(Exception e) {
			System.out.println("getFriendAskedList()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
		
		return result;
	}

	public void askFriendAccept(String askedId, String askingId) {
		try {
			con = getConnection();
			
			String sql 	= "update member set asked = replace(asked,?,'') where email=?; ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, askingId + ",");
			pstmt.setString(2, askedId); // asked 에서 삭제		
			pstmt.executeUpdate();
			
			sql = "update member set friends = concat(friends,?) where email=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, askingId + ","); 
			pstmt.setString(2, askedId); // 요청 받은 사람 친구에 추가 
			pstmt.executeUpdate();
			
			sql = "update member set friends = concat(friends,?) where email=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, askedId + ","); 
			pstmt.setString(2, askingId); // 요청한 사람 친구에 추가 				
			pstmt.executeUpdate();
			
			// sql 하나라 합쳐서 하면 오류 난다, 분리해서 실핼 할것

		} catch(Exception e) {
			System.out.println("askFriendAccept()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
	}
	
	public void askFriendReject(String askedId, String askingId) {
		try {
			con = getConnection();
			
			String sql 	= "update member set asked = replace(asked,?,'') where email=?; ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, askingId + ",");
			pstmt.setString(2, askedId); // asked 에서 삭제		
			pstmt.executeUpdate();

		} catch(Exception e) {
			System.out.println("askFriendReject()메서드에서 에러 : " + e);
		} finally {
			freeResource();
		}
	}
	
}
