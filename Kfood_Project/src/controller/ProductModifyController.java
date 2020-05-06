package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.ProductDTO;
import service.ProductModifyService;

@WebServlet("/ProductModify")
public class ProductModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductModifyController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int product_no = Integer.parseInt(request.getParameter("product_no"));

		ProductModifyService productModifyService = new ProductModifyService();

		ProductDTO ProductModify = productModifyService.productModify(product_no);

		if (ProductModify != null) {
			request.setAttribute("aa", ProductModify);
			RequestDispatcher dispatch = request.getRequestDispatcher("ProductModify.jsp");
			dispatch.forward(request, response);
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("ProductList");
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
