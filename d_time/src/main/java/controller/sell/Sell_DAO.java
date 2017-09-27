package controller.sell;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Menu_DTO;
import model.Sell_DTO;


public class Sell_DAO extends SqlSessionDaoSupport {

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

	public int stock_confirm(int[] m_no,int[] m_count) {
		ArrayList recipe = new ArrayList();
		for(int i=0;i<m_no.length;i++) { //레시피 구해옴
			String m_recipe = getSqlSession().selectOne("member_sell.stock_confirm",m_no[i]);
			System.out.println(m_recipe);
			recipe.add(m_recipe);
		}
		
		/* 레시피분리
		String[] split_receipe = receipe.split(",");
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		for(int i=0;i<split_receipe.length;i=i+2) {
			map.put(split_receipe[i], Integer.parseInt(split_receipe[i+1]));
		}
		System.out.println(map);	
		*/
		
		
		return 0;
	}

}
