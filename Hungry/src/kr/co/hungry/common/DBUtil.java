package kr.co.hungry.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	public static Connection getConnection() throws Exception{ //DB 접속 메서드
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user="project";
		String password="project";
		Connection conn = getConnection(url, user, password);
		return conn;
	}
	
	public static Connection getConnection(String url, String user, String password) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");	//드라이버 로딩
		Connection conn = DriverManager.getConnection(url, user, password);	//DB 접속 (Connection 객체를 얻어옴)
		return conn;
	}
	
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs){	//DB에 접속한 자원을 닫아주는 메서드
		if(rs != null){
			try {
				rs.close();
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