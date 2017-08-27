package service.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import common.DBConnector;
import service.UserService;

public class UserServiceImpl implements UserService {

	@Override
	public String insertUser(Map<String, String>  hm) {

		String result = hm.get("name") + "ȸ������ ����.";
		Connection con;
		try {
			con = DBConnector.getCon();
			String sql = "insert into user(id,password,name,hobby)";
			sql += " values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("id"));
			ps.setString(2, hm.get("pwd"));
			ps.setString(3, hm.get("name"));
			ps.setString(4, hm.get("hobby"));
			int row = ps.executeUpdate();
			if(row==1) {
				result = hm.get("name") + "�� ȸ�����Կ� �����ϼ̽��ϴ�.";
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Map<String, String> selectUser(Map<String, String>  hm) {
		Connection con;
		PreparedStatement ps;
		Map<String, String> resultMap = new HashMap<String, String>();
		String result=hm.get("id") + "�� ���� ���̵� �Դϴ�.";
		try {
			con = DBConnector.getCon();
			System.out.println("���� ����");
			String sql = "select * from users";
			sql += " where id=?";
			ps = con.prepareStatement(sql);
			ps.setString(1 , hm.get("id"));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(hm.get("pwd").equals(rs.getString("pwd"))){
					resultMap.put("id", rs.getString("id"));
					resultMap.put("name", rs.getString("name"));
					resultMap.put("hobby", rs.getString("hobby"));
					resultMap.put("user_no", rs.getString("user_no"));
					result = "�α��� �����ϼ̳׿�";
				}else{
					result = "��й�ȣ�� Ʋ���̽��ϴ�.";
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		resultMap.put("result", result);
		return resultMap;
	}

	@Override
	public int deleteUser(Map<String, String>hm) {
		Connection con;
		try {
			con = DBConnector.getCon();
			String sql = "delete from users";
			sql += " where user_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("user_no"));
			int row = ps.executeUpdate();
			return row;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateUser(Map<String, String> hm) {
		Connection con;
		try {
			con = DBConnector.getCon();
			String sql = "update users";
			sql += " set name = ?,";
			sql += " pwd = ?,";
			sql += " hobby = ?";
			sql += " where user_no=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("name"));
			ps.setString(2, hm.get("pwd"));
			ps.setString(3, hm.get("hobby"));
			ps.setString(4, hm.get("user_no"));
			int row = ps.executeUpdate();
			return row;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> hm) {
		Connection con;
		PreparedStatement ps;
		List<Map<String, String>> userList = new ArrayList<Map<String, String>>();
		String result=hm.get("id") + "�� ���� ���̵� �Դϴ�.";
		try {
			con = DBConnector.getCon();
			String sql = "select * from users";
			ps = con.prepareStatement(sql);			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {	
				Map<String, String> resultMap = new HashMap<String, String>();
				resultMap.put("id", rs.getString("id"));
				resultMap.put("name", rs.getString("name"));
				resultMap.put("hobby", rs.getString("hobby"));
				resultMap.put("user_no", rs.getString("user_no"));
				userList.add(resultMap);
			
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userList;
	}
}
