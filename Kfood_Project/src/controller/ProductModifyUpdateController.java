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

@WebServlet("/ProductModifyUpdate")
public class ProductModifyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductModifyUpdateController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		ProductDTO product = new ProductDTO();
		product.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
		product.setName(request.getParameter("name"));
		product.setPprice(Integer.parseInt(request.getParameter("pprice")));
		product.setPex(request.getParameter("pex"));
		product.setPfile(request.getParameter("pfile"));

		ProductModifyService productModifyService = new ProductModifyService();

		int result = productModifyService.ModifyUpdate(product);

		if(result == 1) {
			request.setAttribute("ProductListPaging", product);
			RequestDispatcher dispatch = request.getRequestDispatcher("Main.jsp");
			dispatch.forward(request, response);
		} else {
			request.setAttribute("aa", product);
			RequestDispatcher dispatch = request.getRequestDispatcher("ProductModify.jsp");
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
