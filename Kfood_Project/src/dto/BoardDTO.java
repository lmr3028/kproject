package dto;

public class BoardDTO extends ProductDTO{
	private int boardno;
	private String title;
	private String id;
	private int product_no;
	private String contents;
	private String bdate;
	private int hits;
	private String bfile;


	public int getBoardno() {
		return boardno;
	}


	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public String getContents() {
		return contents;
	}


	public void setContents(String contents) {
		this.contents = contents;
	}


	public String getBdate() {
		return bdate;
	}


	public void setBdate(String bdate) {
		this.bdate = bdate;
	}


	public int getHits() {
		return hits;
	}


	public void setHits(int hits) {
		this.hits = hits;
	}


	public String getBfile() {
		return bfile;
	}


	public void setBfile(String bfile) {
		this.bfile = bfile;
	}


	@Override
	public String toString() {
		return "BoardDTO [boardno=" + boardno + ", title=" + title + ", id=" + id + ", product_no=" + product_no
				+ ", contents=" + contents + ", bdate=" + bdate + ", hits=" + hits + ", bfile=" + bfile + "]";
	}


}
