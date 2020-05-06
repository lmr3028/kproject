package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CartDTO;
import service.CartListService;
import service.OrdersAddService;

@WebServlet("/OrdersAdd")
public class OrdersAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public OrdersAddController() {
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

			OrdersAddService ordersAddService = new OrdersAddService();
			List<CartDTO> cartList = null;
			CartListService cartListSevice = new CartListService();
			cartList = cartListSevice.cartList(id);

			System.out.println(cartList.toString());
			if(cartList.size() == 0) {
				response.sendRedirect("ProductList.jsp");
			}

			int result = ordersAddService.ordersAdd(cartList);
			System.out.println("RESULT : " + result);
			if(result > 0) {
	    		response.sendRedirect("Orders");
	    	} else {
	    		response.sendRedirect("ProductList.jsp");
	    	}
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
