package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {
	
	private static Connection con;
	
	public static Connection getCon() throws ClassNotFoundException, SQLException{
		if(con == null) {
			String dbUrl = "jdbc:mysql://localhost:3306/jsp_study";
			String dbId ="root";
			String dbPwd ="jspstudy";
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(dbUrl,dbId,dbPwd);
		}
		return con;
	}
	
	public static void closeCon() throws SQLException{
		if(con != null) {
			con.close();
			con = null;
		}
	}
}
