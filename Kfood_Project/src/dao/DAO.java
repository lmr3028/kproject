package dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.BoardDTO;
import dto.CartDTO;
import dto.MemberDTO;
import dto.OrderDTO;
import dto.ProductDTO;

public class DAO {
	private static DAO dao;
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

	public static DAO getInstance() {
		if (dao == null) {
			dao = new DAO();
		}
		return dao;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public int singup(MemberDTO member) {
		String sql = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,?,?,?,0,0)";
		int result = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPostcode());
			pstmt.setString(5, member.getRoadAddress());
			pstmt.setString(6, member.getJibunAddress());
			pstmt.setString(7, member.getDetailAddress());
			pstmt.setString(8, member.getExtraAddress());
			pstmt.setString(9, member.getPhone());
			pstmt.setString(10, member.getGender());
			pstmt.setString(11, member.getProfile());
			pstmt.setString(12, member.getEmail());
//			pstmt.setInt(13, member.getMember_type());
//			pstmt.setInt(14, member.getState());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public boolean Login(String id, String pw) {
		String sql = "SELECT * FROM MEMBER WHERE ID = ? AND PW = ? AND STATE = 0";
		boolean result = false;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
//			pstmt.setInt(3, state);
//			System.out.println(state);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return result;
	}

	public List<MemberDTO> MemberListDB() {
		String sql = "SELECT * FROM MEMBER";

		List<MemberDTO> MemberList = new ArrayList<MemberDTO>();
		MemberDTO member = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new MemberDTO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPhone(rs.getString("phone"));
				member.setEmail(rs.getString("email"));
				member.setState(Integer.parseInt(rs.getString("state")));
				MemberList.add(member);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return MemberList;
	}

	public MemberDTO View(String id) {
		String sql = "SELECT * FROM MEMBER WHERE ID = ?";

		MemberDTO View = new MemberDTO();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			System.out.println(id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				View.setId(rs.getString("id"));
				View.setPw(rs.getString("pw"));
				View.setName(rs.getString("name"));
				View.setPostcode(rs.getString("postcode"));
				View.setRoadAddress(rs.getString("roadAddress"));
				View.setJibunAddress(rs.getString("jibunAddress"));
				View.setDetailAddress(rs.getString("detailAddress"));
				View.setExtraAddress(rs.getString("extraAddress"));
				View.setPhone(rs.getString("phone"));
				View.setGender(rs.getString("gender"));
				View.setProfile(rs.getString("profile"));
				View.setEmail(rs.getString("email"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		System.out.println(View.toString());
		return View;
	}

	public int MemberModifyDB(MemberDTO dto) {
		String sql = "UPDATE MEMBER SET PW = ?, NAME = ?, POSTCODE = ?, ROADADDRESS = ?, JIBUNADDRESS = ?, DETAILADDRESS = ?, EXTRAADDRESS = ?, PHONE = ?, PROFILE = ?, EMAIL = ?  WHERE ID = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPostcode());
			pstmt.setString(4, dto.getRoadAddress());
			pstmt.setString(5, dto.getJibunAddress());
			pstmt.setString(6, dto.getDetailAddress());
			pstmt.setString(7, dto.getExtraAddress());
			pstmt.setString(8, dto.getPhone());
			pstmt.setString(9, dto.getProfile());
			pstmt.setString(10, dto.getEmail());
			pstmt.setString(11, dto.getId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int DeleteDB(String id) {
		String sql = "DELETE MEMBER WHERE ID = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int blackDB(String id) {
		String sql = "UPDATE MEMBER SET STATE = 1 WHERE ID = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int unblackDB(String id) {
		String sql = "UPDATE MEMBER SET STATE = 0 WHERE ID = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int RegistrationDB(ProductDTO productDTO) {
		String sql = "INSERT INTO PRODUCT VALUES(?,?,?,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, productDTO.getProduct_no());
			pstmt.setString(2, productDTO.getName());
			pstmt.setInt(3, productDTO.getPprice());
			pstmt.setString(4, productDTO.getPex());
			pstmt.setString(5, productDTO.getPfile());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int listCount() {
		String sql = "SELECT COUNT(*) FROM PRODUCT";
		int listCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("글 갯수 오류 : " + e);
		} finally {
			close(pstmt);
			close(rs);
		}

		return listCount;
	}

	public List<ProductDTO> productList(int startRow, int endRow) {
		String sql = "select * from(select PRODUCT_NO ,NAME,PPRICE ,PEX ,PFILE ,rownum rnum from PRODUCT order by product_no desc)where rnum between ? and ?";
		ProductDTO product = null;
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new ProductDTO();
				product.setProduct_no(rs.getInt("product_no"));
				product.setName(rs.getString("name"));
				product.setPprice(rs.getInt("pprice"));
				product.setPex(rs.getString("pex"));
				product.setPfile(rs.getString("pfile"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return productList;
	}

	public int listCountAsc() {
		int listCount = 0;
		String sql = "SELECT COUNT(*) FROM PRODUCT";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("글갯수 오류" + e);
		} finally {
			close(pstmt);
			close(rs);
		}
		return listCount;
	}

	public List<ProductDTO> productListAscDB(int startRow, int endRow) {
		String sql = "SELECT * FROM PRODUCT WHERE ROWNUM BETWEEN ? AND ? ORDER BY PPRICE ASC";
		ProductDTO product = null;
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new ProductDTO();
				product.setProduct_no(rs.getInt("product_no"));
				product.setName(rs.getString("name"));
				product.setPprice(rs.getInt("pprice"));
				product.setPex(rs.getString("pex"));
				product.setPfile(rs.getString("pfile"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return productList;
	}

	public ProductDTO productModifyDB(int product_no) {
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_NO = ?";
		ProductDTO productView = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				productView = new ProductDTO();
				productView.setProduct_no(rs.getInt("product_no"));
				productView.setName(rs.getString("name"));
				productView.setPprice(rs.getInt("pprice"));
				productView.setPex(rs.getString("pex"));
				productView.setPfile(rs.getString("pfile"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return productView;
	}

	public int ModifyUpdateDB(ProductDTO product) {
		String sql = "UPDATE PRODUCT SET NAME = ?, PPRICE = ?, PEX = ?, PFILE = ? WHERE PRODUCT_NO = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, product.getName());
			pstmt.setInt(2, product.getPprice());
			pstmt.setString(3, product.getPex());
			pstmt.setString(4, product.getPfile());
			pstmt.setInt(5, product.getProduct_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ProductDTO ProductViewDB(int product_no) {
		String sql = "SELECT * FROM PRODUCT WHERE PRODUCT_NO =?";

		ProductDTO ProductView = new ProductDTO();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_no);
			System.out.println(product_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				ProductView.setProduct_no(rs.getInt("product_no"));
				ProductView.setName(rs.getString("name"));
				ProductView.setPprice(rs.getInt("pprice"));
				ProductView.setPex(rs.getString("pex"));
				ProductView.setPfile(rs.getString("pfile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return ProductView;
	}

	public List<ProductDTO> ProdutcListDesc(int startRow, int endRow) {
		String sql = "SELECT * FROM PRODUCT WHERE ROWNUM BETWEEN ? AND ? ORDER BY NAME ASC";
		ProductDTO Product = null;
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product = new ProductDTO();
				Product.setProduct_no(rs.getInt("product_no"));
				Product.setName(rs.getString("name"));
				Product.setPprice(rs.getInt("pprice"));
				Product.setPex(rs.getString("pex"));
				Product.setPfile(rs.getString("pfile"));
				productList.add(Product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return productList;
	}

	public int ProductDeleteDB(int product_no) {
		String sql = "DELETE PRODUCT WHERE PRODUCT_NO = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, product_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<ProductDTO> productListSearchName(int startRow, int endRow, String sValue) {
		String sql = "select * from(select PRODUCT_NO ,NAME,PPRICE ,PEX ,PFILE ,rownum rnum from PRODUCT where NAME = ? order by product_no desc)where rnum between ? and ?";
		ProductDTO product = null;
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sValue);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new ProductDTO();
				product.setProduct_no(rs.getInt("product_no"));
				product.setName(rs.getString("name"));
				product.setPprice(rs.getInt("pprice"));
				product.setPex(rs.getString("pex"));
				product.setPfile(rs.getString("pfile"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return productList;
	}

	public List<ProductDTO> productListSearchPprice(int startRow, int endRow, String sValue) {
		String sql = "select * from(select PRODUCT_NO ,NAME,PPRICE ,PEX ,PFILE ,rownum rnum from PRODUCT where PPRICE = ? order by product_no desc)where rnum between ? and ?";
		ProductDTO product = null;
		List<ProductDTO> productList = new ArrayList<ProductDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sValue);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				product = new ProductDTO();
				product.setProduct_no(rs.getInt("product_no"));
				product.setName(rs.getString("name"));
				product.setPprice(rs.getInt("pprice"));
				product.setPex(rs.getString("pex"));
				product.setPfile(rs.getString("pfile"));
				productList.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return productList;
	}

	public int cartaddDB(CartDTO cartDTO) {
		String sql = "INSERT INTO CART(CART_NO,PRODUCT_NO,ID,QTY) VALUES(CART_SEQ.NEXTVAL,?,?,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartDTO.getProduct_no());
			pstmt.setString(2, cartDTO.getId());
			pstmt.setInt(3, cartDTO.getQty());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<CartDTO> cartList(String id) {
		String sql = "SELECT * FROM product p JOIN cart c ON p.product_no = c.product_no where id = ? AND APPROVAL = 0";
		CartDTO cart = null;
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cart = new CartDTO();
				cart.setId(rs.getString("id"));
				cart.setCart_no(rs.getInt("cart_no"));
				cart.setProduct_no(rs.getInt("product_no"));
				cart.setName(rs.getString("name"));
				cart.setPprice(rs.getInt("pprice"));
				cart.setPex(rs.getString("pex"));
				cart.setPfile(rs.getString("pfile"));
				cart.setQty(rs.getInt("qty"));
				cartList.add(cart);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return cartList;
	}

	public int CartDeleteDB(int cart_no) {
		String sql = "DELETE CART WHERE CART_NO = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cart_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int CartModifyDB(int cart_no, int qty) {
		String sql = "UPDATE CART SET qty = ? WHERE CART_NO = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qty);
			pstmt.setInt(2, cart_no);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<OrderDTO> ordersDB(String id) {
		String sql = "SELECT * FROM product p JOIN cart c ON p.product_no = c.product_no JOIN ORDERS o ON c.cart_no = o.cart_no where id = ?";
		OrderDTO orders = null;
		List<OrderDTO> ordersList = new ArrayList<OrderDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orders = new OrderDTO();
				orders.setId(rs.getString("id"));
				orders.setOrder_no(rs.getInt("order_no"));
				orders.setCart_no(rs.getInt("cart_no"));
				orders.setProduct_no(rs.getInt("product_no"));
				orders.setName(rs.getString("name"));
				orders.setPprice(rs.getInt("pprice"));
				orders.setPex(rs.getString("pex"));
				orders.setPfile(rs.getString("pfile"));
				orders.setQty(rs.getInt("qty"));
				orders.setApproval(rs.getInt("approval"));
				ordersList.add(orders);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return ordersList;
	}

	public int ordersaddDB(CartDTO cartDTO) {
		String sql = "INSERT INTO ORDERS VALUES(ORDERS_SEQ.NEXTVAL, ?, ?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cartDTO.getCart_no());
			pstmt.setInt(2, 0); // TODO:
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int cartUpdate(CartDTO cartDTO) {
		String sql = "UPDATE CART SET APPROVAL = 1 WHERE ID = ? AND CART_NO = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cartDTO.getId());
			pstmt.setInt(2, cartDTO.getCart_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<OrderDTO> ordersListDB() {
		String sql = "SELECT * FROM product p JOIN cart c ON p.product_no = c.product_no JOIN ORDERS o ON c.cart_no = o.cart_no where c.approval = 1 order by c.approval desc ,c.id ";
		OrderDTO orders = null;
		List<OrderDTO> ordersList = new ArrayList<OrderDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orders = new OrderDTO();
				orders.setId(rs.getString("id"));
				orders.setOrder_no(rs.getInt("order_no"));
				orders.setCart_no(rs.getInt("cart_no"));
				orders.setProduct_no(rs.getInt("product_no"));
				orders.setName(rs.getString("name"));
				orders.setPprice(rs.getInt("pprice"));
				orders.setPex(rs.getString("pex"));
				orders.setPfile(rs.getString("pfile"));
				orders.setQty(rs.getInt("qty"));
				orders.setApproval(rs.getInt("approval"));
				ordersList.add(orders);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return ordersList;
	}

	public OrderDTO orderConfirmSelect(String orderNo) {

		String sql = "	SELECT * FROM product p " + "JOIN cart c ON p.product_no = c.product_no "
				+ "JOIN ORDERS o ON c.cart_no = o.cart_no " + "where c.approval = 1 AND o.order_no = ?";
		OrderDTO orders = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, orderNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				orders = new OrderDTO();
				orders.setId(rs.getString("id"));
				orders.setOrder_no(rs.getInt("order_no"));
				orders.setCart_no(rs.getInt("cart_no"));
				orders.setProduct_no(rs.getInt("product_no"));
				orders.setName(rs.getString("name"));
				orders.setPprice(rs.getInt("pprice"));
				orders.setPex(rs.getString("pex"));
				orders.setPfile(rs.getString("pfile"));
				orders.setQty(rs.getInt("qty"));
				orders.setApproval(rs.getInt("approval"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return orders;

	}

	public int orderUpdateDB(OrderDTO orderDTO) {
		String sql = "UPDATE CART SET APPROVAL = 2 WHERE cart_no = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, orderDTO.getCart_no());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<BoardDTO> boardListDB() {
		String sql = "SELECT * FROM BOARD ORDER BY BOARDNO ASC";

		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		BoardDTO board = null;
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				board = new BoardDTO();
				board.setBoardno(rs.getInt("boardno"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setBdate(rs.getString("bdate"));
				board.setHits(rs.getInt("hits"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return boardList;
	}

	public int boardListCount() {
		String sql = "SELECT COUNT(*) FROM BOARD";
		int listCount = 0;

		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("글 갯수 오류 : " + e);
		} finally {
			close(pstmt);
			close(rs);
		}

		return listCount;
	}

	public List<BoardDTO> boardListSearchName(int startRow, int endRow, String sValue) {
		String sql = "select * from ( select BOARDNO ,TITLE,ID,BDATE,HITS, rownum rnum, name, pfile from BOARD B JOIN PRODUCT P ON B.product_no = p.product_no where name = ? order by boardno desc) where rnum between ? and ?";
		BoardDTO board = null;
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sValue);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				board = new BoardDTO();
				board.setBoardno(rs.getInt("boardno"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setBdate(rs.getString("bdate"));
				board.setHits(rs.getInt("hits"));
				board.setName(rs.getString("name"));
				board.setPfile(rs.getString("pfile"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return boardList;
	}

	public List<BoardDTO> boardListSearchHits(int startRow, int endRow) {
		String sql = "select * from ( select BOARDNO ,TITLE,ID,BDATE,HITS, rownum rnum, name, pfile from BOARD B JOIN PRODUCT P ON B.product_no = p.product_no order by hits asc) where rnum between ? and ?";
		BoardDTO board = null;
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				board = new BoardDTO();
				board.setBoardno(rs.getInt("boardno"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setBdate(rs.getString("bdate"));
				board.setHits(rs.getInt("hits"));
				board.setName(rs.getString("name"));
				board.setPfile(rs.getString("pfile"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return boardList;
	}

	public List<BoardDTO> boardList(int startRow, int endRow) {
		String sql = "select * from (select BOARDNO ,TITLE,ID,BDATE,HITS, rownum rnum, name, pfile from BOARD B JOIN PRODUCT P ON B.product_no = P.product_no order by B.boardno desc) where rnum between ? and ?";
		BoardDTO board = null;
		List<BoardDTO> boardList = new ArrayList<BoardDTO>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				board = new BoardDTO();
				board.setBoardno(rs.getInt("boardno"));
				board.setTitle(rs.getString("title"));
				board.setId(rs.getString("id"));
				board.setBdate(rs.getString("bdate"));
				board.setHits(rs.getInt("hits"));
				board.setName(rs.getString("name"));
				board.setPfile(rs.getString("pfile"));
				boardList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return boardList;
	}

	public BoardDTO boardViewdb(int boardno) {
		String sql = "SELECT * FROM BOARD WHERE BOARDNO = ?";

		BoardDTO View = new BoardDTO();

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				View.setTitle(rs.getString("title"));
				View.setId(rs.getString("id"));
				View.setContents(rs.getString("contents"));
				View.setBdate(rs.getString("bdate"));
				View.setBfile(rs.getString("bfile"));
				View.setHits(rs.getInt("hits"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return View;
	}

	public int WriteReviewDB(BoardDTO boardDTO) {
		String sql = "INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL,?,?,?,?,SYSDATE,0,?)";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getTitle());
			pstmt.setString(2, boardDTO.getId());
			pstmt.setInt(3, boardDTO.getProduct_no());
			pstmt.setString(4, boardDTO.getContents());
			pstmt.setString(5, boardDTO.getBfile());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int setHit(int boardno) {
		String sql = "UPDATE BOARD SET HIT = HITS+1 WHERE BOARDNO =?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int BoardDeleteDB(int boardno) {
		String sql = "DELETE BOARD WHERE BOARDNO = ?";
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
