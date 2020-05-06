package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import dao.DAO;
import dto.BoardDTO;

public class BoardListService {

	public int listCount() {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int listCount = dao.boardListCount();

		close(con);

		return listCount;
	}

	public List<BoardDTO> boardList(int startRow, int endRow, String sValue, String sType) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		List<BoardDTO> boardList = null;

		if(null != sValue && !sValue.equals("")) {
			if(sType.equals("name")) {
				boardList = dao.boardListSearchName(startRow, endRow, sValue);
			}
		} else {
			if("hits".equals(sType)) {
				boardList = dao.boardListSearchHits(startRow, endRow);
			} else {
				boardList = dao.boardList(startRow, endRow);
			}
		}

		close(con);
		return boardList;
	}

}
