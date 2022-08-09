package m_order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class M_orderDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private List<String> list;
	
	public M_orderDAO() {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, "system", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<String> selectSeat(String movie, String time) {
		String sql = "select order_seat from m_order where m_code = ? and m_time = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie);
			pstmt.setString(2, time);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<String> ();
				do {
					String[] seat = rs.getString(1).split(",");
					for(int i = 0; i < seat.length; i++) {
						list.add(seat[i]);
					}
				} while(rs.next());
			}
			return new ArrayList<String> ();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertM_order(String m_time, String order_seat, String order_cnt, String order_price, String m_code, String id) {
		String sql = "insert into m_order values((select max(orderno) + 1 from m_order), ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_time);
			pstmt.setString(2, order_seat);
			pstmt.setString(3, order_cnt);
			pstmt.setString(4, order_price);
			pstmt.setString(5, m_code);
			pstmt.setString(6, id);
			pstmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
