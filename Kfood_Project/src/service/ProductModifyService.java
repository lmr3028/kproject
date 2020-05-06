package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;
import dto.ProductDTO;

public class ProductModifyService {

	public ProductDTO productModify(int product_no) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		ProductDTO ProductModify = dao.productModifyDB(product_no);
		close(con);
		return ProductModify;
	}

	public int ModifyUpdate(ProductDTO product) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.ModifyUpdateDB(product);

		if (result == 1) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);

		return result;
	}

}
