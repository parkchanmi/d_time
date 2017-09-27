package model;

import java.sql.Date;

public class Message_DTO {
	
	private int msg_no;
	private String msg_title;
	private String msg_content;
	private Date msg_date;
	private int msg_state;
	private int msg_sender;
	private int msg_receiver;
	
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	public int getMsg_state() {
		return msg_state;
	}
	public void setMsg_state(int msg_state) {
		this.msg_state = msg_state;
	}
	public int getMsg_sender() {
		return msg_sender;
	}
	public void setMsg_sender(int msg_sender) {
		this.msg_sender = msg_sender;
	}
	public int getMsg_receiver() {
		return msg_receiver;
	}
	public void setMsg_receiver(int msg_receiver) {
		this.msg_receiver = msg_receiver;
	}
	
	public Message_DTO() {
		
	}
	
	
	
	

}
