package controller.all.sale;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Sell_DTO;

public class SaleMemDAO extends SqlSessionDaoSupport {

	public List<Sell_DTO> selectFT(String s_no, String from, String to) {
		
		HashMap map2 = new HashMap();
		map2.put("s_no", s_no);
		map2.put("to", to);
		map2.put("from", from);
		List<Sell_DTO> sell2 = getSqlSession().selectList("saleMem.selectList", map2);
		
		return sell2;
	}
	
	public List<Sell_DTO> selectDetail(String s_no, String from, String to) {

		HashMap mapD = new HashMap();
		mapD.put("s_no", s_no);
		mapD.put("to", to);
		mapD.put("from", from);
		List<Sell_DTO> sell3 = getSqlSession().selectList("saleMem.selectDetail", mapD);		

		return sell3;
	}

	public List<HashMap> selectYear(String s_no) {
		
		List<HashMap> map_mem = getSqlSession().selectList("saleMem.selectMemYear", s_no);
				
		return map_mem;
	}

	public List<HashMap> selectPie(String s_no) {
		
		List<HashMap> pie_mem = getSqlSession().selectList("saleMem.selectPie", s_no);
		
		return pie_mem;
	}

	public List<HashMap> selectPie2(String s_no, String from, String to) {
		
		HashMap pie_map = new HashMap();
		pie_map.put("s_no", s_no);
		pie_map.put("to", to);
		pie_map.put("from", from);
		List<HashMap> pie_mem = getSqlSession().selectList("saleMem.selectPie2", pie_map);
		
		return pie_mem;
	}

	public List<HashMap> selectMonCost(String s_no) {
		List<HashMap> month = getSqlSession().selectList("saleMem.selectMonth", s_no);
				
		return month;
	}

	public List<HashMap> selectType(String s_no,String from, String to) {
		HashMap down_map = new HashMap();
		down_map.put("s_no", s_no);
		down_map.put("from", from);
		down_map.put("to", to);
		List<HashMap> type = getSqlSession().selectList("saleMem.selectType", down_map);
		
		return type;
	}

	public List<HashMap> selectAll(String s_no, String from, String to) {
		HashMap all_map = new HashMap();
		all_map.put("s_no", s_no);
		all_map.put("from", from);
		all_map.put("to", to);
		List<HashMap> all = getSqlSession().selectList("saleMem.selectAll", all_map);
		
		return all;
	}

}
