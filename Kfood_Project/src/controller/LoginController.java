package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginService;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
//		int state = Integer.parseInt(request.getParameter("state"));
		System.out.println(id);
		System.out.println(pw);
//		System.out.println(state);
		LoginService LoginService = new LoginService();
		boolean result = LoginService.memberLogin(id, pw);

		if (result) {
			session.setAttribute("id", id);

			if ("admin".equals(id)) {
				session.setAttribute("type", 2);
			} else if ("owner".equals(id)) {
				session.setAttribute("type", 1);
			} else {
				session.setAttribute("type", 0);
			}

			response.sendRedirect("Main.jsp");
		} else {
			response.sendRedirect("LoginFail.jsp");
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
