	package kr.co.hungry.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil_mysql {
	public static Connection getConnection() throws Exception{ //DB 접속 메서드
		String url="jdbc:mysql://192.168.1.29/hungry";
		//jdbc:dbms명://접속할host주소 '192.168.1.29' (선재자리) /접속할db명 'hungry'입력
		//현재 사설 아이피(192.168.x.x)이므로 글로벌 접속시 DMZ이용 혹은 호스팅 DB를 사용하여 해결
		String user="hungry";
		//외부접속이므로 db내에서 생성하고 접속을 허용한  'hungry'계정명으로 접속
		String password="hungry";
		//외부접속이 허용된 hungry계정명에 설정된 password 'hungry'입력
		Connection conn = getConnection(url, user, password);
		return conn;
	}
	
	public static Connection getConnection(String url, String user, String password) throws Exception{
		Class.forName("com.mysql.jdbc.Driver");	//(jdbc)mysql 드라이버 로딩
		Connection conn = DriverManager.getConnection(url, user, password);	//DB 접속 (Connection 객체를 얻어옴)
		return conn;
	}
	
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs){	//DB에 접속한 자원을 닫아주는 메서드
		if(rs != null){
			try {
				rs.close();
				close(conn, ps);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(Connection conn, PreparedStatement ps){	//선언된 객체를 닫아주는 메서드
		if(ps != null){
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(conn != null){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}