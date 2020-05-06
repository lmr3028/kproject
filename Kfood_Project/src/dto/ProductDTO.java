package dto;

public class ProductDTO {
	private int product_no;
	private String name;
	private int pprice;
	private String pex;
	private String pfile;
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPprice() {
		return pprice;
	}
	public void setPprice(int pprice) {
		this.pprice = pprice;
	}
	public String getPex() {
		return pex;
	}
	public void setPex(String pex) {
		this.pex = pex;
	}
	public String getPfile() {
		return pfile;
	}
	public void setPfile(String pfile) {
		this.pfile = pfile;
	}
	@Override
	public String toString() {
		return "ProductDTO [product_no=" + product_no + ", name=" + name + ", pprice=" + pprice + ", pex=" + pex
				+ ", pfile=" + pfile + "]";
	}
	
	
	
}
