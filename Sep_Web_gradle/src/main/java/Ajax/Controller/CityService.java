package Ajax.Controller;

import java.util.List;
import java.util.Map;

public interface CityService {
	public List<String> listSido();
	public List<Map<String,Object>> listCity(String city);
}
