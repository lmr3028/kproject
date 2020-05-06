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
import service.OrdersListService;

@WebServlet("/OrdersList")
public class OrdersListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrdersListController() {
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
			OrdersListService ordersListService = new OrdersListService();
		List<OrderDTO> ordersList = ordersListService.ordersList();
		request.setAttribute("ordersList", ordersList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("OrdersList.jsp");
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
