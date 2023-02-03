package localSQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class LocalMySql {
	private static Connection conn = null;
	private static String driver = "com.mysql.jdbc.Driver";
	private static String url = "jdbc:mysql://localhost:3306/mylib";
	private static String MYSQL_ID = System.getenv("MYSQL_ROOT") == null ? "root" : System.getenv("MYSQL_ROOT");
	private static String MYSQL_PW = "";

	private LocalMySql() {};
	
	public static Connection getConnection() {
		try {
			if(conn == null || conn.isClosed()) {
				Class.forName(driver);
				conn = DriverManager.getConnection(url, MYSQL_ID, MYSQL_PW);
			}else {
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
}
