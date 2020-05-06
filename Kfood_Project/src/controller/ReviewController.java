package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDTO;

@WebServlet("/Review")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReviewController() {
		super();
	}


	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String id = request.getParameter("id");
		
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setProduct_no(product_no);
		boardDTO.setId(id);
		
		request.setAttribute("boardDTO", boardDTO);
		
		System.out.println(id);
		System.out.println(product_no);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("WriteReview.jsp");
		dispatch.forward(request, response);
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
