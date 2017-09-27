package model;

import java.util.Date;

public class Board_DTO {

	private int b_no;
	private int mem_no;
	private String b_type;
	private String b_title;
	private String b_content;
	private Date b_date;
	private int b_count;

	public int getB_no() {
		return b_no;
	}

	public void setB_no(int b_no) {
		this.b_no = b_no;
	}

	public int getMem_no() {
		return mem_no;
	}

	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getb_count() {
		return b_count;
	}

	public void setb_count(int b_count) {
		this.b_count = b_count;
	}

	public Board_DTO() {

	}

}
