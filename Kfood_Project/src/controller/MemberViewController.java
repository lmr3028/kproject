package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import service.MemberViewService;

@WebServlet("/MemberView")
public class MemberViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberViewController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		System.out.println(id);
		MemberViewService ViewService = new MemberViewService();

		MemberDTO View = ViewService.View(id);

		if (View != null) {
			request.setAttribute("View", View);

			RequestDispatcher dispatch = request.getRequestDispatcher("MemberView.jsp");
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
