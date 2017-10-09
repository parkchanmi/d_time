package model;

import java.sql.Timestamp;
import java.util.Date;

public class Sell_DTO {
	private int sel_no;
	private int s_no;
	private Timestamp sel_date;
	private int sel_cost;
	private String sel_history;
	private String sel_type;
	private int sel_count;
	private String s_type;
	private String s_name;

	public int getSel_no() {
		return sel_no;
	}

	public void setSel_no(int sel_no) {
		this.sel_no = sel_no;
	}

	public int getS_no() {
		return s_no;
	}

	public void setS_no(int s_no) {
		this.s_no = s_no;
	}

	public Timestamp getSel_date() {
		return sel_date;
	}

	public void setSel_date(Timestamp sel_date) {
		this.sel_date = sel_date;
	}

	public int getSel_cost() {
		return sel_cost;
	}

	public void setSel_cost(int sel_cost) {
		this.sel_cost = sel_cost;
	}

	public String getSel_history() {
		return sel_history;
	}

	public void setSel_history(String sel_history) {
		this.sel_history = sel_history;
	}

	public String getSel_type() {
		return sel_type;
	}

	public void setSel_type(String sel_type) {
		this.sel_type = sel_type;
	}

	public int getSel_count() {
		return sel_count;
	}

	public void setSel_count(int sel_count) {
		this.sel_count = sel_count;
	}

	public Sell_DTO() {

	}

	public Sell_DTO(int sel_no, int s_no, Timestamp sel_date, int sel_cost, String sel_history, String sel_type,
			int sel_count) {

		this.sel_no = sel_no;
		this.s_no = s_no;
		this.sel_date = sel_date;
		this.sel_cost = sel_cost;
		this.sel_history = sel_history;
		this.sel_type = sel_type;
		this.sel_count = sel_count;
	}
	public Sell_DTO( int s_no, Timestamp sel_date, int sel_cost, String sel_history, String sel_type,
			int sel_count) {

		this.sel_no = sel_no;
		this.s_no = s_no;
		this.sel_date = sel_date;
		this.sel_cost = sel_cost;
		this.sel_history = sel_history;
		this.sel_type = sel_type;
		this.sel_count = sel_count;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

}
