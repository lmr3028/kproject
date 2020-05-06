package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.OrderDTO;
import service.OrderConfirmService;

@WebServlet("/OrderConfirm")
public class OrderConfirmController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrderConfirmController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		if (id == null) {
			response.sendRedirect("Login.jsp");

		} else {
			String orderNo = request.getParameter("order_no");

			OrderConfirmService orderConfirmService = new OrderConfirmService();

			OrderDTO orderDTO = orderConfirmService.orderConfirmSelect(orderNo);
			System.out.println(orderDTO.toString());

			orderConfirmService.orderConfirmUpdate(orderDTO);

			RequestDispatcher dispatcher = request.getRequestDispatcher("OrdersList");
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
