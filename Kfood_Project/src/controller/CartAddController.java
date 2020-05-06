package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.CartDTO;
import service.CartAddService;

@WebServlet("/CartAdd")
public class CartAddController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CartAddController() {
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
			CartDTO cartDTO = new CartDTO();
			cartDTO.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
			cartDTO.setId(id);
			cartDTO.setQty(1);

			CartAddService cartAddService = new CartAddService();
			int result = cartAddService.cartAdd(cartDTO);

			if(result > 0) {
	    		response.sendRedirect("CartList");
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
