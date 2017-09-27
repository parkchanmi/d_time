package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main_Controller {
	@RequestMapping("/main_admin.do")
	public String admin() {
		//return "product_list";
		return "main_admin";
	}
	
	@RequestMapping("/main_member.do")
	public String member() {
		//return "product_list";
		return "main_member";
	}
}
