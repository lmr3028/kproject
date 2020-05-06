package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import dao.DAO;
import dto.ProductDTO;

public class ProductListAscService {
	public static int listCount() {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int listCount = dao.listCountAsc();

		close(con);

		return listCount;
	}
	public static List<ProductDTO> productAscList(int startRow, int endRow) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		List<ProductDTO> boardList = dao.productListAscDB(startRow, endRow);

		close(con);
		return boardList;
	}
	public static List<ProductDTO> productDescList(int startRow, int endRow) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		List<ProductDTO> productList = dao.ProdutcListDesc(startRow, endRow);

		close(con);
		return productList;
	}

}
