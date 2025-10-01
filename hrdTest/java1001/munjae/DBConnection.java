package munjae;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	static String url = "jdbc:mariadb://localhost:3305/hrdtest";
	static String user = "root";
	static String password = "1234";
	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(url, user, password);
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("===== DB 연결 실패 ====");
		}
		
		return conn;
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null)
				rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			if(pstmt!=null)
				pstmt.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		try {
			if(conn!=null)
				conn.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void executeQuery(String sql, String title, ResultHandler handler) {
        System.out.println("\n[" + title + "]");
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            boolean hasResult = false;
            while (rs.next()) {
                handler.handle(rs);
                hasResult = true;
            }

            if (!hasResult) {
                System.out.println("   (결과 없음)");
            }

        } catch (SQLException e) {
            System.out.println("===== DB 오류 발생 =====");
            e.printStackTrace();
        }
    }
}
