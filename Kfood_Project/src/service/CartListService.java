package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import dao.DAO;
import dto.CartDTO;

public class CartListService {

	public List<CartDTO> cartList(String id) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		List<CartDTO> cartList;

		cartList = dao.cartList(id);

		close(con);
		return cartList;
	}

}
