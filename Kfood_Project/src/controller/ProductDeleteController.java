package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.ProductDeleteService;

@WebServlet("/ProductDelete")
public class ProductDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductDeleteController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int product_no = Integer.parseInt(request.getParameter("product_no"));

		ProductDeleteService ProductDeleteService = new ProductDeleteService();

		int result = ProductDeleteService.productDelete(product_no);

		if (result == 1) {
			response.sendRedirect("ProductListPaging");
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
