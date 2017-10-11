package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.Board_DTO;
import model.Board_Type_DTO;
import model.Notice_DTO;

@Controller
public class Main_Controller {
	
	@Autowired
	Main_DAO dao;
	
	
	
	@RequestMapping("/main_admin.do")
	public String admin(Model model,HttpSession session) {
		List<Notice_DTO> nlist = dao.getNoticeMain();
		List<Board_DTO> blist = dao.getBoardMain();
		
		List<Board_Type_DTO> typeList = dao.selectType();
		session.setAttribute("typelist", typeList);
		int store_1 = dao.getStore_1();
		int store_2 = dao.getStore_2();
		
		model.addAttribute("notice_list",nlist);
		model.addAttribute("board_list",blist);
		model.addAttribute("store1",store_1);
		model.addAttribute("store2",store_2);
		return "main_admin";
	}
	
	@RequestMapping("/main_member.do")
	public String member(Model model, HttpSession session) {
		List<Notice_DTO> nlist = dao.getNoticeMain();
		List<Board_DTO> blist = dao.getBoardMain();
		
		List<Board_Type_DTO> typeList = dao.selectType();
		session.setAttribute("typelist", typeList);
		
		int store_1 = dao.getStore_1();
		int store_2 = dao.getStore_2();
		
		model.addAttribute("notice_list",nlist);
		model.addAttribute("board_list",blist);
		model.addAttribute("store1",store_1);
		model.addAttribute("store2",store_2);
		
		return "main_member";
	}
}
