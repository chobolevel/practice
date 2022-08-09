package event;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EventDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private List<Event> list;
	
	public EventDAO() {
		String url = "jdbc:oracle:thin:@//localhost:1521/xe";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, "system", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Event> selectEvent() {
		String sql = "select * from event order by num desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				list = new ArrayList<Event> ();
				do {
					Event event = new Event();
					event.setNum(rs.getString(1));
					event.setTitle(rs.getString(2));
					event.setMemo(rs.getString(3));
					event.setTime(rs.getString(4));
					event.setHit(rs.getString(5));
					event.setRef(rs.getString(6));
					event.setIndent(rs.getString(7));
					event.setStep(rs.getString(8));
					event.setId(rs.getString(9));
					list.add(event);
				} while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
