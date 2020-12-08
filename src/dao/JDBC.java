package dao;

import java.sql.*;

public class JDBC {
	Connection conn = null;
	String url = "jdbc:mysql://localhost/whattoeat";
	String userName = "root";
	String pw = "database";
	
	public JDBC() {
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			// @param getConnection(url, userName, password);
			// @return Connection
			conn = DriverManager.getConnection(url, userName, pw);
			System.out.println("연결 성공");
		}
		
		catch(ClassNotFoundException e)
		{
			System.out.println("드라이버 로딩 실패");
		}
		catch(SQLException e)
		{
			System.out.println("에러: " + e);
		}
		
		finally
		{
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
