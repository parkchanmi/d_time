package controller;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Board_DTO;
import model.Board_Type_DTO;
import model.Member_DTO;
import model.Notice_DTO;
import model.Orders_DTO;
import model.Review_DTO;
import model.Sell_DTO;


public class Main_DAO extends SqlSessionDaoSupport {
	
	public List<Notice_DTO> getNoticeMain() {
		List<Notice_DTO> nlist = getSqlSession().selectList("main.notice_main");
		return nlist;
		
	}
	
	public List<Board_DTO> getBoardMain() {
		List<Board_DTO> blist = getSqlSession().selectList("main.board_main");
		return blist;
		
	}
	
	public List<Board_Type_DTO> selectType(){
		List<Board_Type_DTO> type = getSqlSession().selectList("main.selectType");
		return type;
	}
	
	public int getStore_1() { //직영
		String count = getSqlSession().selectOne("main.store_1");
		if(count==null) 
			return 0;
		return Integer.parseInt(count);
		
	}
	public int getStore_2() { //가맹
		String count = getSqlSession().selectOne("main.store_2");
		if(count==null) 
			return 0;
		return Integer.parseInt(count);
	}

	public List<Sell_DTO> FT_list(String from, String to) {//베스트 지점 3위
		HashMap map = new HashMap();
		map.put("from", from);
		map.put("to", to);
		List<Sell_DTO> sell = getSqlSession().selectList("main.selectList", map);

		return sell;
	}
	
	public List<Orders_DTO> orders_list(){
		List<Orders_DTO> olist = getSqlSession().selectList("main.ordersList");
		return olist;
	}
	
	public List<Sell_DTO> sale_list(int s_no){
		List<Sell_DTO> slist = getSqlSession().selectList("main.saleList",s_no);
		return slist;
	}

   
	 

}


 



 