package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.PagingDTO;
import dto.ProductDTO;
import service.ProductListPagingService;

@WebServlet("/ProductListPaging")
public class ProductListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProductListController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
//		ProductListPagingService ProductListService  = new ProductListPagingService();
		//첫 페이지
		int page =1;
		//한 페이지에 몇 개 글을 보여주는지
		int limit = 5;


		// page 파라미터 값 검사 값이 없을 경우 페이지는 1
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// 전체 글 갯수를 가져오기 위한 ListService 클래스의 메소드 호출
		int listCount = ProductListPagingService.listCount();

		// limit 값을 걸어놓은 만큼 범위에 해당하는 글만 가져오는 방법
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		// 한 페이지에 3개 씩 보여줄 때 1페이지에 보여줘야 하는 글 번호(RN 기준)
		// 시작 글은 1번 마지막 글은 3번

		String sValue = null;
		String sType = null;

		if(request.getParameter("searchValue") != null) {
			 sValue = request.getParameter("searchValue");
			 sType = request.getParameter("searchType");
		}


		System.out.println(sValue + " " + sType);
		List<ProductDTO> productList = ProductListPagingService.productList(startRow, endRow, sValue, sType);


		// 페이지 계산을 위한 부분
		// 최대로 필요한 페이지 갯수 계산
		int maxPage = (int) ((double) listCount / limit + 0.9);

		//현재 페이지에 보여줄 시작 페이지 번호
		int startPage = (((int) ((double) page / 10 + 0.9)) -1) * 10 + 1;

		//현재 페이지에 보여줄 끝 페이지 번호(10, 20, 30, 40 ~~~)
		int endPage = startPage + 10 - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}




		PagingDTO paging = new PagingDTO();

		paging.setPage(page);
		paging.setStartPage(startPage);
		paging.setEndPage(endPage);
		paging.setMaxPage(maxPage);
		paging.setListCount(listCount);

		request.setAttribute("paging", paging);

		request.setAttribute("productList", productList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("ProductList.jsp");
		dispatcher.forward(request, response);

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
