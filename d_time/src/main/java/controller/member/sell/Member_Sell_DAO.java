package controller.member.sell;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Menu_DTO;
import model.Sell_DTO;


public class Member_Sell_DAO extends SqlSessionDaoSupport {

	public List<Menu_DTO> getMenuList() {
		List<Menu_DTO> mlist= getSqlSession().selectList("member_sell.menu_all");
		return mlist;
	}
	
	public int sell_exe(ArrayList<Sell_DTO> sell_list) { //주문정보가 있을 때만 호출됨
		int x = 0;
		for(int i=0;i<sell_list.size();i++) {
			
			x+=getSqlSession().insert("member_sell.sell_exe",sell_list.get(i));
			if(x==0)
				return x;
		}
		
		return x;
	}

	public boolean stock_confirm(int[] m_no,int[] m_count, int s_no) {
		ArrayList need_stock = new ArrayList();
		for(int i=0;i<m_no.length;i++) { //레시피 구해옴
			String m_recipe = getSqlSession().selectOne("member_sell.recipe_confirm",m_no[i]);
			String[] split_receipe = m_recipe.split(",");
			
			HashMap<String,Integer> map = new HashMap<String,Integer>();
			for(int j=0;j<split_receipe.length;j=j+2) {
				//map.put(split_receipe[j], Integer.parseInt(split_receipe[j+1])*m_count[i]);
				
				int need_sell = Integer.parseInt(split_receipe[j+1])*m_count[i]; //판매에 필요한 재고 갯수
				
				HashMap sno_stname = new HashMap();
				sno_stname.put("s_no", s_no);
				sno_stname.put("st_name", split_receipe[j]);
				sno_stname.put("need_sell", need_sell);
				
				String exist = getSqlSession().selectOne("member_sell.exist_stock",sno_stname);
				if(exist==null) //재고에 해당 물품이 없는경우
					return false; //판매불가
				
				int stock_count = getSqlSession().selectOne("member_sell.get_stock",sno_stname); //매장에 존재하는 재고의 갯수
				if(stock_count<need_sell) { //재고의 갯수가 실제 필요한 양보다 적다면 재고부족!
					return false; // 판매불가
				}
				need_stock.add(sno_stname);
			}
			System.out.println(m_recipe+"수량:"+m_count[i]);
		}
		
		//문제가 없으면 판매가능 -> 재고메서 물품 빼기
		//재고에서 빼자
		for(int i=0;i<need_stock.size();i++) { //필요한 정보들
			int x =getSqlSession().update("member_sell.use_stock",need_stock.get(i));
			if(x!=1) {
				return false; //롤백처리?
			}
		}
		
		return true;
		
		/* 레시피분리
		String[] split_receipe = receipe.split(",");
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		for(int i=0;i<split_receipe.length;i=i+2) {
			map.put(split_receipe[i], Integer.parseInt(split_receipe[i+1]));
		}
		System.out.println(map);	
		*/
		
	}

}
