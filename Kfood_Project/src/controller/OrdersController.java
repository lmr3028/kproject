package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.OrderDTO;
import service.OrdersService;

@WebServlet("/Orders")
public class OrdersController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrdersController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if(id == null) {
			response.sendRedirect("Login.jsp");
		} else {
			OrdersService ordersService = new OrdersService();
		List<OrderDTO> orders = ordersService.orders(id);
		request.setAttribute("orders", orders);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Orders.jsp");
		dispatcher.forward(request, response);

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
