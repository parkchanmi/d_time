package controller.admin.store;

import java.util.List;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Member_DTO;
import model.Store_DTO;



public class Store_DAO extends SqlSessionDaoSupport{
	public List<Store_DTO> storelist() {

		List<Store_DTO> strlist = getSqlSession().selectList("store.selectStoreList");
		
		return strlist;
	}
	public List<Store_DTO> storelist_J() {

		List<Store_DTO> strlist = getSqlSession().selectList("store.selectStoreList_ver1");
		
		return strlist;
	}
	public List<Store_DTO> storelist_G() {

		List<Store_DTO> strlist = getSqlSession().selectList("store.selectStoreList_ver2");
		
		return strlist;
	}
	
	public Store_DTO storeone(int s_no) {

		Store_DTO store = getSqlSession().selectOne("store.selectStoreOne",s_no);

		return store;
	}
	
	public int storeinsert(Store_DTO storedto) {
		
		 int x = getSqlSession().insert("store.insertstore",storedto);
	     return x;
	}
	
	public int storeupdate(Store_DTO storedto) {
		
		int x = getSqlSession().update("store.updatestore",storedto);
		
		
		return x;
	}
	
	public void storedelete(int s_no) {
		
		int x = getSqlSession().delete("store.deletestore", s_no);
		
	}

	public String storeName(int s_no) {
		
		String name = getSqlSession().selectOne("store.selectStoreName", s_no);
		
		return name;
	}
	
}
