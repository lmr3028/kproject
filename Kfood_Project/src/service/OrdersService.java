package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import dao.DAO;
import dto.OrderDTO;

public class OrdersService {

	public List<OrderDTO> orders(String id) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		List<OrderDTO> ordersList;

		ordersList = dao.ordersDB(id);

		close(con);
		return ordersList;
	}


}
