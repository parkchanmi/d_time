package model;

import java.util.List;

public class Menu_DTO {

	private int m_no;
	private String m_type;
	private String m_name;
	private String m_recipe;
	private int m_cost;
	
	private List<Menu_DTO> mdto;

	public int getM_no() {
		return m_no;
	}

	public List<Menu_DTO> getMdto() {
		return mdto;
	}

	public void setMdto(List<Menu_DTO> mdto) {
		this.mdto = mdto;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_type() {
		return m_type;
	}

	public void setM_type(String m_type) {
		this.m_type = m_type;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_recipe() {
		return m_recipe;
	}

	public void setM_recipe(String m_recipe) {
		this.m_recipe = m_recipe;
	}

	public int getM_cost() {
		return m_cost;
	}

	public void setM_cost(int m_cost) {
		this.m_cost = m_cost;
	}

	public Menu_DTO() {

	}

}
