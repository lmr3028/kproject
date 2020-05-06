package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;
import dto.BoardDTO;

public class WriteReviewService {

	public int WriteReview(BoardDTO boardDTO) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		int writeResult = dao.WriteReviewDB(boardDTO); 
		
		if(writeResult > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		return writeResult;
	}

}
