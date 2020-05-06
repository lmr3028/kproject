package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;

public class CartModifyService {

	public int cartModify(int cart_no, int qty) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.CartModifyDB(cart_no, qty);

		if (result == 1) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
