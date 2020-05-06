package service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;
import java.util.List;

import dao.DAO;
import dto.CartDTO;

public class OrdersAddService {

	public int ordersAdd(List<CartDTO> cartList) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = 0;
		for (CartDTO cartDTO : cartList) {
			System.out.println("ordersadd  : " + cartDTO.toString());
			result += dao.ordersaddDB(cartDTO);
		}

		for (CartDTO cartDTO : cartList) {
			dao.cartUpdate(cartDTO);
		}

		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return result;
	}

}
