package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardDeleteService;

@WebServlet("/BoardDelete")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardDeleteController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int boardno = Integer.parseInt(request.getParameter("boardno"));

		BoardDeleteService boardDeleteService = new BoardDeleteService();

		int result = boardDeleteService.boardDelete(boardno);

		if (result == 1) {
			response.sendRedirect("BoardListPaging");
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("BoardList");
			dispatch.forward(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
