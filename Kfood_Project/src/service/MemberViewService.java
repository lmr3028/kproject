package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.DAO;
import dto.MemberDTO;

public class MemberViewService {

	public MemberDTO View(String id) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		MemberDTO View = dao.View(id);
		close(con);

		return View;
	}
}
