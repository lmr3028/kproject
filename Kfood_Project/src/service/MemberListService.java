package service;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import dao.DAO;
import dto.MemberDTO;

public class MemberListService {

	public List<MemberDTO> MemberList() {
		DAO dao = DAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		
		List<MemberDTO> MemberList = new ArrayList<MemberDTO>();
		
		MemberList = dao.MemberListDB();
		
		close(con);
		
		return MemberList;
	}

}
