package controller.member.orders;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Orders_DTO;
import model.Product_DTO;

public class Member_Orders_DAO extends SqlSessionDaoSupport {

	//발주 신청 리스트
	public List<Product_DTO> orders_add(int s_no) {

		List<Product_DTO> x = getSqlSession().selectList("orders.orders_addForm", s_no);
		return x;

	}

	//발주 내역 리스트
	public List<Orders_DTO> order_List(HashMap map) {
		List<Orders_DTO> x = getSqlSession().selectList("orders.orders_list", map);
		return x;
		
	}

	public Orders_DTO orders_content(int o_no) {
		Orders_DTO x = getSqlSession().selectOne("orders.orders_content",o_no);
		return x;
		
	}
	
	public int calc_std(String p_name) {
		int std = getSqlSession().selectOne("orders.calc_std",p_name);
		return std;
		
	}
	
	
	//발주 내역 총 게시글 수 
	public int order_count(int s_no){
		int x = getSqlSession().selectOne("orders.orders_count",s_no); 
		return x;
	
	}

	// 발주 신청
	public int orders_add(Orders_DTO o_dto) {
		int x = getSqlSession().insert("orders.orders_add",o_dto); 
		return x;
	
	}

	public int delete_order(int o_no) {
		int x = getSqlSession().delete("orders.delete_order",o_no);
		return x;
		
	}
	

}
