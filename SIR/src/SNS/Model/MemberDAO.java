package SNS.Model;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.DataSource;

import SNS.Model.MemberDTO;

public class MemberDAO {
	
	DataSource ds;
	
	public MemberDAO(){
		try{
			Context initContext = (Context)new InitialContext().lookup("java:comp/env/");
			ds = (DataSource)initContext.lookup("jdbc/sir");
						
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void SNSMemberSignUp(String name, String email, String pass){
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			conn = ds.getConnection();
			String sql = "INSERT INTO member (name, email, pass) VALUES(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, pass);

			pstmt.executeUpdate();
			
		} catch (Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch (SQLException e){
				e.printStackTrace();
			}
		}
	}
	
}