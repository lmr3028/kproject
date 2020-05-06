package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import service.MemberViewService;

@WebServlet("/ModifyView")
public class ModifyViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ModifyViewController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

//		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		System.out.println(id);

		MemberViewService ViewService = new MemberViewService();

		MemberDTO View = ViewService.View(id);

		if (View != null) {
			request.setAttribute("View", View);

			RequestDispatcher dispatch = request.getRequestDispatcher("MemberModify.jsp");
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
