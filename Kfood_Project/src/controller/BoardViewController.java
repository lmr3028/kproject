package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDTO;
import service.BoardViewService;

@WebServlet("/BoardView")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BoardViewController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int boardno = Integer.parseInt(request.getParameter("boardno"));

		BoardViewService ViewService = new BoardViewService();
		ViewService.setHit(boardno);
		BoardDTO View = ViewService.boardView(boardno);

		if (View != null) {
			request.setAttribute("View", View);

			RequestDispatcher dispatch = request.getRequestDispatcher("BoardView.jsp");
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
