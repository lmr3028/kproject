package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.ProductDTO;
import service.RegistrationService;

@WebServlet("/Registration")
public class RegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegistrationController() {
		super();
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int size = 10*1024*1024;
		String savePath="C:/Users/3/Desktop/Kfood_Project/Kfood_Project/WebContent/ProductUpload";
		MultipartRequest multi = new MultipartRequest(
				request,
				savePath,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);


		ProductDTO productDTO = new ProductDTO();

		productDTO.setProduct_no(Integer.parseInt(multi.getParameter("product_no")));
		productDTO.setName(multi.getParameter("name"));
		productDTO.setPprice(Integer.parseInt(multi.getParameter("pprice")));
		productDTO.setPex(multi.getParameter("pex"));
		productDTO.setPfile(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));

		RegistrationService registrationService = new RegistrationService();
		int result = registrationService.registration(productDTO);

		if(result > 0) {
    		response.sendRedirect("ProductListPaging");
    	} else {
    		response.sendRedirect("Fail.jsp");
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
