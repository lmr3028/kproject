package dto;

public class OrderDTO extends CartDTO {
	private int order_no;
	private int total_price;



	public int getOrder_no() {
		return order_no;
	}



	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}



	public int getTotal_price() {
		return total_price;
	}



	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}



	@Override
	public String toString() {
		return "OrderDTO [order_no=" + order_no + ", total_price=" + total_price + ", getOrder_no()=" + getOrder_no()
				+ ", getTotal_price()=" + getTotal_price() + ", getCart_no()=" + getCart_no() + ", getProduct_no()="
				+ getProduct_no() + ", getId()=" + getId() + ", getQty()=" + getQty() + ", getApproval()="
				+ getApproval() + ", toString()=" + super.toString() + ", getName()=" + getName() + ", getPprice()="
				+ getPprice() + ", getPex()=" + getPex() + ", getPfile()=" + getPfile() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + "]";
	}









}
