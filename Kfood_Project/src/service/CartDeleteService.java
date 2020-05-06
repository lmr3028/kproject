package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;

public class CartDeleteService {

	public int cartListDelete(int product_no) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.CartDeleteDB(product_no);

		if (result == 1) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
