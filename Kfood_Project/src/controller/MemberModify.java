package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.MemberDTO;
import service.MemberModifyService;



@WebServlet("/MemberModify")
public class MemberModify extends HttpServlet {
	private static final long serialVersionUID = 1L;


    public MemberModify() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("MEMBER MODIFY");

		int size = 10*1024*1024;
		String savePath="C:/Users/3/Desktop/develoomant/source/servlet/Kfood_Project/WebContent/pfileUpload";

		MultipartRequest multi = new MultipartRequest(
				request,
				savePath,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
//		String address = multi.getParameter("postcode") + " " + multi.getParameter("roadAddress") + " " + multi.getParameter("jibunAddress") + " "
//				+ multi.getParameter("detailAddress") + " " + multi.getParameter("extraAddress") ;
//		System.out.println(address);



		MemberDTO dto = new MemberDTO();



		dto.setId(multi.getParameter("id"));
		dto.setPw(multi.getParameter("pw"));
		dto.setName(multi.getParameter("name"));
		dto.setPostcode(multi.getParameter("postcode"));
		dto.setRoadAddress(multi.getParameter("roadAddress"));
		dto.setJibunAddress(multi.getParameter("jibunAddress"));
		dto.setDetailAddress(multi.getParameter("detailAddress"));
		dto.setExtraAddress(multi.getParameter("extraAddress"));
		dto.setPhone(multi.getParameter("phone"));
		dto.setProfile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));
		dto.setEmail(multi.getParameter("email"));


		MemberModifyService ModifyService = new MemberModifyService();
		System.out.println(dto.toString());
		int result = ModifyService.MemberModify(dto);
		System.out.println(result);
		if (result == 1) { // 수정 성공
			response.sendRedirect("Main.jsp");
		} else { // 수정 실패
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
