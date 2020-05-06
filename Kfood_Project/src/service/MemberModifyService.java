package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.DAO;
import dto.MemberDTO;

public class MemberModifyService {

	public int MemberModify(MemberDTO dto) {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.MemberModifyDB(dto);

		if (result == 1) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		return result;
	}

}
