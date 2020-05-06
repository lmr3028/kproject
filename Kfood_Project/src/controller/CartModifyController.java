package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CartModifyService;

@WebServlet("/CartModify")
public class CartModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartModifyController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int cart_no = Integer.parseInt(request.getParameter("cart_no"));
		int qty = Integer.parseInt(request.getParameter("qty"));

		CartModifyService CartModifyService = new CartModifyService();

		int result = CartModifyService.cartModify(cart_no,qty);

		if (result == 1) {
			response.sendRedirect("CartList");
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("CartList.jsp");
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
