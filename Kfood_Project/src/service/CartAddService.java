package service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;
import dto.CartDTO;

public class CartAddService {

	public int cartAdd(CartDTO cartDTO) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.cartaddDB(cartDTO);

		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return result;
	}

}
