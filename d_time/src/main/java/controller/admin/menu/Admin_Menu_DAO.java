package controller.admin.menu;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Menu_DTO;


public class Admin_Menu_DAO extends SqlSessionDaoSupport{

	
	public List<Menu_DTO> getMenuList() {
		List<Menu_DTO> mlist= getSqlSession().selectList("admin_menu.menu_all");
		return mlist;
	}
	
	public int addMenu(Menu_DTO mdto) {
		int x = getSqlSession().insert("admin_menu.add_menu",mdto);
		return x;
	}

	

	public int modifyMenu(String[] m_name, int[] m_cost, int[] m_no) {
		int result=0;
		for(int i=0;i<m_name.length;i++) {
			HashMap map = new HashMap();
			map.put("m_name", m_name[i]);
			map.put("m_cost", m_cost[i]);
			map.put("m_no", m_no[i]);
			result = getSqlSession().update("admin_menu.modify_menu", map);
			if(result==0) {
				return 0;
			}
			
		}
		return result;
	}

	public int deleteMenu(int m_no) {
		int x = getSqlSession().delete("admin_menu.delete_menu",m_no);
		return x;
	}
}
