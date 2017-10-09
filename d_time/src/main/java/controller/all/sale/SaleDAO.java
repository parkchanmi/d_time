package controller.all.sale;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Sell_DTO;

public class SaleDAO extends SqlSessionDaoSupport {

	public List<Sell_DTO> FT_list(String from, String to) {
		HashMap map = new HashMap();
		map.put("from", from);
		map.put("to", to);
		List<Sell_DTO> sell = getSqlSession().selectList("sale.selectList", map);

		return sell;
	}

	public List<HashMap> j_list(String string) {

		List<HashMap> map = getSqlSession().selectList("sale.selectYear1", string);

		return map;
	}
	
	public List<HashMap> k_list(String string) {

		List<HashMap> map2 = getSqlSession().selectList("sale.selectYear2", string);

		return map2;
	}


	public int all_cost_list(Timestamp sel_date) {

		int all_cost = getSqlSession().selectOne("sale.all_cost",sel_date);
		
	 	return all_cost;
	}

	public int j_cost_list(String string) {
		int j_cost = getSqlSession().selectOne("sale.j_cost", string);
		return j_cost;
	}

	public int k_cost_list(String string) {
		int k_cost = getSqlSession().selectOne("sale.k_cost", string);
		return k_cost;
	}

	public List<HashMap> name_cost_list(String string) {
		List<HashMap> name_cost = getSqlSession().selectList("sale.name_cost", string);
		return name_cost;
	}
	
}
