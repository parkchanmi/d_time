package Ajax.Controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Component
public class CityServiceImpl implements CityService{
	@Autowired
	private CityDAO dao;

	public CityDAO getDao() {
		return dao;
	}

	public void setDao(CityDAO dao) {
		this.dao = dao;
	}
	
	public List<String > listSido(){
		List<String> list = null;
		try {
			list = dao.getListData("city.listSido");
		}catch(Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	public List<Map<String,Object>> listCity(String city) {
		List<Map<String,Object>> list = null;

		try {
			list = dao.getListData("city.listCity", city);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}
}
