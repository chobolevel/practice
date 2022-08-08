package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/BBS";
			String dbID = "system";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int login(String userID, String userPassword) {
		String sql = "select userpassword from user where userid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
					//로그인 성공  = 1
				} else {
					return 0;
					//비밀번호 불일치
				}
			}
			return -1;
			//아이디가 존재하지 않음을 알림 = -1
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
		//데이터베이스 실행 오류 알리는 값 = -2
	}
}
