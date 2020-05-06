package controller;

import java.io.IOException;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MemberDTO;
import service.JoinMemberService;

@WebServlet("/memberServer")
public class JoinMemberController extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	public JoinMemberController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int size = 10*1024*1024;
		String savePath="C:/Users/3/Desktop/develoomant/source/servlet/Kfood_Project/WebContent/pfileUpload";
		MultipartRequest multi = new MultipartRequest(
				request,
				savePath,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);

		MemberDTO member = new MemberDTO();
		member.setId(multi.getParameter("id"));
		member.setPw(multi.getParameter("pw"));
		member.setName(multi.getParameter("name"));
		member.setPostcode(multi.getParameter("postcode"));
		member.setRoadAddress(multi.getParameter("roadAddress"));
		member.setJibunAddress(multi.getParameter("jibunAddress"));
		member.setDetailAddress(multi.getParameter("detailAddress"));
		member.setExtraAddress(multi.getParameter("extraAddress"));
		member.setPhone(multi.getParameter("phone"));
		member.setGender(multi.getParameter("gender"));
		member.setProfile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		member.setEmail(multi.getParameter("email"));
//		member.setMember_type(Integer.parseInt(multi.getParameter("member_type")));
//		member.setState(Integer.parseInt(multi.getParameter("state")));




		JoinMemberService JoinMemberService = new JoinMemberService();

		int result = JoinMemberService.join(member);

		if (result == 1) {
			HttpSession session = request.getSession();
			session.setAttribute("id", member.getId());
			response.sendRedirect("Main.jsp");
		} else {
			response.sendRedirect("joinFail.jsp");
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
