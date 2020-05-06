package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import dao.DAO;

public class LoginService {

	public boolean memberLogin(String id, String pw) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		boolean result = dao.Login(id, pw);

		close(con);

		return result;
	}

}
