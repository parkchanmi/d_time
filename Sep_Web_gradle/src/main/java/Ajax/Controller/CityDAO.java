package Ajax.Controller;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class CityDAO extends SqlSessionDaoSupport{

	public List<String> getListData(String string) {
		List<String> sido = getSqlSession().selectList(string);
		return sido;
	}

	public List<Map<String,Object>> getListData(String string, String city) {
		List<Map<String,Object>> selectcity = getSqlSession().selectList(string, city);
		return selectcity;
	}

}