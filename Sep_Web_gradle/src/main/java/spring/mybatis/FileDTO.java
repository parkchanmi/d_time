package spring.mybatis;

public class FileDTO {
	private int num;
	private String o_name;
	private String r_name;
	
	public FileDTO(){}
	public FileDTO(String o_name,String r_name){
		this.o_name = o_name;
		this.r_name = r_name;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	
	@Override
	public String toString() {
		return "파일번호:"+num+"\t파일이름:"+o_name+"\t경로이름:"+r_name;
	}

}
