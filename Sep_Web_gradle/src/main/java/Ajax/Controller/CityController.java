package Ajax.Controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import Ajax.Controller.CityService;

@Controller
public class CityController {
	public CityService getService() {
		return service;
	}

	public void setService(CityService service) {
		this.service = service;
	}

	@Autowired
	private CityService service;
	
	@RequestMapping(value = "/city/city.do")
	public String city() throws Exception {
		return "ajax/city";
	}
	
	@RequestMapping(value="/city/sidoList.do", method=RequestMethod.POST)
	public void sidoList(HttpServletResponse resp) throws Exception{ //결과 view가 없고 응답정보를 매개변수로 받아서 저장한다.
		List<String> list = service.listSido();
	//	System.out.println(list.get(0));
		JSONObject jso = new JSONObject();
		jso.put("data", list);
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter(); //stream연결
		out.println(jso.toString());		//요청했던페이지로 내용출력
	}
	@RequestMapping(value = "/city/cityList.do", method = RequestMethod.POST, produces="text/plain;charset=UTF-8") //ResponseBody 요청보낼때 한글을 처리하기 위함
	@ResponseBody
	public String cityList(HttpServletResponse resp, @RequestParam("snum")String city) throws Exception{
		resp.setContentType("text/html;charset=UTF-8");//한글처리
		List<Map<String,Object>> list = service.listCity(city);
	//	System.out.println(list);
		JSONObject jso = new JSONObject(); //객체 -> string
		jso.put("data1", list);
		return jso.toString();
	}
}
