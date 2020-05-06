package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.List;

import dao.DAO;
import dto.ProductDTO;

public class ProductListPagingService {

	public static int listCount() {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int listCount = dao.listCount();

		close(con);

		return listCount;
	}

	public static List<ProductDTO> productList(int startRow, int endRow, String sValue, String sType) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		List<ProductDTO> productList;



		if(null != sValue && !sValue.equals("")) {
			if(sType.equals("name")) {
				productList = dao.productListSearchName(startRow, endRow, sValue);
			} else {
				productList = dao.productListSearchPprice(startRow, endRow, sValue);
			}
		} else {
			productList = dao.productList(startRow, endRow);
		}

		close(con);
		return productList;
	}

}
