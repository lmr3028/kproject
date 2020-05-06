package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.BoardDTO;
import service.WriteReviewService;

@WebServlet("/WriteReview")
public class WriteReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WriteReviewController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
//		int size = 10*1024*1024;
//		String savePath = "C:/Users/3/Desktop/Kfood_Project/Kfood_Project/WebContent/BoardUpload";
//
//    	MultipartRequest multi = new MultipartRequest(
//				request,
//				savePath,
//				size,
//				"UTF-8",
//				new DefaultFileRenamePolicy()
//				);
		String title = request.getParameter("title");
		String id = request.getParameter("id");
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String contents = request.getParameter("contents");
    	
    	BoardDTO boardDTO = new BoardDTO();
    	
    	boardDTO.setTitle(title);
    	boardDTO.setId(id);
    	boardDTO.setProduct_no(product_no);
    	boardDTO.setContents(contents);
    	
//    	
//		boardDTO.setTitle(multi.getParameter("title"));
//		boardDTO.setId(multi.getParameter("id"));
//		boardDTO.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
//		boardDTO.setContents(multi.getParameter("contents"));
//		boardDTO.setBfile(multi.getOriginalFileName(
//					(String)multi.getFileNames().nextElement()));
    	
		WriteReviewService writeReviewService = new WriteReviewService();
    	int writeResult = writeReviewService.WriteReview(boardDTO);
		
    	if(writeResult > 0) {
    		response.sendRedirect("BoardListPaging");
    	} else {
    		response.sendRedirect("WriteFail.jsp");
    	}
		
    	
		
	}
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doProcess(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
