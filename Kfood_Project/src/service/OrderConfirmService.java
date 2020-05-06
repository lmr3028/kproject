package service;

import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;
import dto.OrderDTO;

public class OrderConfirmService {

	public OrderDTO orderConfirmSelect(String orderNo) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		OrderDTO orderDTO = dao.orderConfirmSelect(orderNo);

		return orderDTO;
	}

	public int orderConfirmUpdate(OrderDTO orderDTO) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.orderUpdateDB(orderDTO);

		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}

		return result;

	}
}
