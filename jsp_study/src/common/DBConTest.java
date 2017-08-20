package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConTest {
	public static void main(String[] args) {
		Connection con;
		Statement st;
		try {
			con = DBConnector.getCon();
			System.out.println("연결성공");
			st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from user");
			/*Set value가 중복되는걸 방지 한다*/
			while(rs.next()) {
				System.out.println(rs.getString("user_no"));
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("name"));
				System.out.println(rs.getString("pwd"));
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
