package model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Notice_DTO {
	
	private int n_no;
	private String n_title;
	private String n_content;
	private Date  n_date;
	private int n_count;
	private int f_no;
	
	private MultipartFile n_file;
	
	public MultipartFile getN_file() {
		return n_file;
	}
	public void setN_file(MultipartFile n_file) {
		this.n_file = n_file;
	}
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public Date getN_date() {
		return n_date;
	}
	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}
	public int getN_count() {
		return n_count;
	}
	public void setN_count(int n_count) {
		this.n_count = n_count;
	}
	public int getF_no() {
		return f_no;
	}
	public void setF_no(int f_no) {
		this.f_no = f_no;
	}
	
	public Notice_DTO() {
		
	}
	
	

}
