package model;

import java.sql.Date;
import java.sql.Timestamp;

public class Orders_DTO {
	
	private int o_no;
	private int s_no;
	private Timestamp o_date;
	private String o_drink;
	private String o_food;
	private String o_product;
	private String o_thing;
	private String o_state;
	private int r;

	public Orders_DTO(String o_drink, String o_food, String o_product, String o_thing) {
		this.o_drink = o_drink;
		this.o_food = o_food;
		this.o_product = o_product;
		this.o_thing = o_thing;
	}
	
	public int getR() {
		return r;
	}

	public void setR(int r) {
		this.r = r;
	}
	
	public Timestamp getO_date() {
		return o_date;
	}

	public void setO_date(Timestamp o_date) {
		this.o_date = o_date;
	}
	
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	
	public String getO_drink() {
		return o_drink;
	}
	public void setO_drink(String o_drink) {
		this.o_drink = o_drink;
	}
	public String getO_food() {
		return o_food;
	}
	public void setO_food(String o_food) {
		this.o_food = o_food;
	}
	public String getO_product() {
		return o_product;
	}
	public void setO_product(String o_product) {
		this.o_product = o_product;
	}
	public String getO_thing() {
		return o_thing;
	}
	public void setO_thing(String o_thing) {
		this.o_thing = o_thing;
	}
	public String getO_state() {
		return o_state;
	}
	public void setO_state(String o_state) {
		this.o_state = o_state;
	}

	public Orders_DTO() {
		
	}
	
	
}
