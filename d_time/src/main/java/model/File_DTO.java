package model;

public class File_DTO {
	private int f_no;
	private String f_path;
	private String f_name;
	private long f_size;

	public File_DTO() {}
	public File_DTO(String f_path,String f_name, long f_size) {
		this.f_path=f_path;
		this.f_name=f_name;
		this.f_size=f_size;
	}
	
	public long getF_size() {
		return f_size;
	}
	public void setF_size(long f_size) {
		this.f_size = f_size;
	}
	public int getF_no() {
		return f_no;
	}

	public void setF_no(int f_no) {
		this.f_no = f_no;
	}

	public String getF_path() {
		return f_path;
	}

	public void setF_path(String f_path) {
		this.f_path = f_path;
	}

	public String getF_name() {
		return f_name;
	}

	public void setF_name(String f_name) {
		this.f_name = f_name;
	}

	

	
}
