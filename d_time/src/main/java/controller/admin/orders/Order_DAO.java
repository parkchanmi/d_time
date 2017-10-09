package controller.admin.orders;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Orders_DTO;
import model.Store_DTO;

public class Order_DAO extends SqlSessionDaoSupport {

	public List<Orders_DTO> orderslist() { 

		List<Orders_DTO> ordslist = getSqlSession().selectList("store.selectOrdersList");
		return ordslist;
	}

	public List<Orders_DTO> orderone(int s_no) {

		List<Orders_DTO> ordersdto = getSqlSession().selectList("store.selectOrderStoreOne", s_no);

		return ordersdto;
	}
	
	public List<Orders_DTO> orderone_con(int o_no) {

		List<Orders_DTO> ordersdto = getSqlSession().selectList("store.selectOrderStoreOne", o_no);

		return ordersdto;
	}

	
	public Orders_DTO orderdtoone(int o_no) {
		Orders_DTO order = getSqlSession().selectOne("store.selectOrderStoreOne", o_no);

		return order;
	}

	public int orderstateupdate(int o_no) {
/*
		HashMap orderstate = new HashMap();

		//int o_state = Integer.parseInt(orstate);
		orderstate.put("o_no", o_no);
		orderstate.put("o_state", orstate);*/

		int x = getSqlSession().update("store.updateorder", o_no);

		return x;
	}

}
