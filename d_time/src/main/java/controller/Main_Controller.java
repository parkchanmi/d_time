package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import controller.all.notice.Notice_DAO;
import model.Notice_DTO;

@Controller
public class Main_Controller {
	
	@Autowired
	Notice_DAO ndao;
	
	
	@RequestMapping("/main_admin.do")
	public String admin(Model model) {
		List<Notice_DTO> nlist = ndao.getNoticeMain();
		System.out.println(nlist.size());
		model.addAttribute("notice_list",nlist);
		
		return "main_admin";
	}
	
	@RequestMapping("/main_member.do")
	public String member(Model model) {
		List<Notice_DTO> nlist = ndao.getNoticeMain();
		System.out.println(nlist.size());
		model.addAttribute("notice_list",nlist);
		
		return "main_member";
	}
}
