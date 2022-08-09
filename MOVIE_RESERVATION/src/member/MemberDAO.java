package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, "system", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String id, String password) {
		String sql = "select password from m_member where id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,  id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1;
					//로그인 성공 : 1
				} else {
					return 0;
					//비밀번호 오류 : 0
				}
			} else {
				return -1;
				//아이디 오류 : -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;
		//데이터베이스 오류
	}
	
	public Member selectMember(String id) {
		String sql = "select * from m_member where id = ?";
		Member member = new Member();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString(1));
				member.setPassword(rs.getString(2));
				member.setName(rs.getString(3));
				member.setNickname(rs.getString(4));
				member.setBirth(rs.getString(5));
				member.setPhone(rs.getString(6));
				member.setAddress(rs.getString(7));
				member.setGrade(rs.getString(8));
				member.setPoint(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public int insertMember(String id, String password, String name, String nickname, String birth, String phone, String address) {
		String sql = "insert into m_member(id, password, name, nickname, birth, phone, address) values(?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, nickname);
			pstmt.setString(5, birth);
			pstmt.setString(6, phone);
			pstmt.setString(7, address);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
