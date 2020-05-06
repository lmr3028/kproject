package service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;

public class BlackListService {

	public boolean memberBlack(String id) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		int result = dao.blackDB(id);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return (result==1) ? true:false;

	}

	public boolean UnBlack(String id) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		int result = dao.unblackDB(id);

		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return (result==1) ? true:false;
		
	}

}
