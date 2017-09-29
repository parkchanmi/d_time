package spring.controller;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SimpleConverterController {

	@RequestMapping(value="/test/simpleTest.do",method=RequestMethod.GET)
	public String simpleTestForm() {
		return "test/simpleTestForm";
	}
	
	@RequestMapping(value="/test/simpleTest.do",method=RequestMethod.POST)
	@ResponseBody
	public String simpleTest(@RequestBody String body) {
		return body;
	}
	
	@RequestMapping(value="/test/simpleTest1.do", method=RequestMethod.GET)
	public String simpleTestForm1() {
		return "test/simpleTestForm";
	}
	@RequestMapping(value="/test/simpleTest1.do",method=RequestMethod.POST)
	@ResponseBody
	public byte[] simpleTest1(@RequestBody byte[] body) {
		return body;
	}
	@RequestMapping(value = "/test/simpleTest2.do", method = RequestMethod.GET)
	public String simpleTestForm2() {
		return "test/simpleTestForm";
	}

	@RequestMapping(value = "/test/simpleTest2.do", method = RequestMethod.POST)
	@ResponseBody
	public String simpleTest2(@RequestBody MultiValueMap<String, String> body) {
		return body.toString();
	}
	//@RequestBody : 매개변수에 사용해서 request의 몸체를 자바 객체로 변환시킨다.
	//@ResponseBody : 메서드 위에 사용해서 메서드의 리턴타입을 response에 담아 바로 사용자에게 보여준다.
	//String / byte[] / MultiValueMap
}
