package service.implement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sun.org.apache.bcel.internal.generic.NEW;

import common.DBConnector;
import dao.BoardDAO;
import dto.Board;
import service.BoardService;

public class BoardServiceImpl implements BoardService{

	private BoardDAO bDAO = new BoardDAO();
	
	@Override
	public List<Board> selectBoardList() {
			Connection con;
			List<Board> boardList = null;
			try {
				con = DBConnector.getCon();
				boardList = bDAO.selectBoardList(con);				
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return boardList;
		}


	@Override
	public Map<String, String> selectBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	

}
