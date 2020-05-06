package dto;

public class CartDTO extends ProductDTO {
	private int cart_no;
	private int product_no;
	private String id;
	private int qty;
	private int approval;
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getApproval() {
		return approval;
	}
	public void setApproval(int approval) {
		this.approval = approval;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_no=" + cart_no + ", product_no=" + product_no + ", id=" + id + ", qty=" + qty
				+ ", approval=" + approval + "]";
	}


}
