package controller.all.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Board_DTO;
import model.Board_Type_DTO;
import model.Member_DTO;
import model.Review_DTO;


@Controller
public class Board_Type_Controller {
	@Autowired
	Board_Type_DAO bdao;
	
	public Board_Type_DAO  getB_dao() {
		return bdao;
	}

	public void setB_dao(Board_Type_DAO  b_dao) {
		this.bdao = b_dao;
	}
	
	@RequestMapping("admin/board_manage.do")
	public String board_manage(Model model,HttpSession session) {
		List<Board_Type_DTO> typeList = bdao.selectType();
		
		session.removeAttribute("typelist");
		session.setAttribute("typelist", typeList);
		
		List<Integer> countList = bdao.selectCount();
		model.addAttribute("countlist", countList);
		
		return "admin/board_manage";
	}
	
	
	@RequestMapping("admin/btype_add.do")
	public String btype_add(String new_type,Model model) {
		int x = bdao.add_type(new_type);
		if(x==3) //이미존재
		{
			model.addAttribute("result", "이미 존재하는 게시판입니다.");
		}
		if(x==0) {//추가오류
			model.addAttribute("result", "추가실패");
		}
		return "redirect:/admin/board_manage.do";
	}
	
	@RequestMapping("admin/board_type/updateIndex.do")
	public String update_index(String[] b_type) {
		for(int i=0;i<b_type.length;i++) {
			System.out.println("순서"+i+b_type[i]);
		}
		bdao.update_index(b_type);
		return "redirect:/admin/board_manage.do";
	}
	
	
	@RequestMapping("admin/board/temp_delete.do")
	public String type_temp_delete(String type,int index) {
		int result=bdao.delete_temp(type,index);
		System.out.println(type+"삭제결과:"+result);
	
		return "redirect:/admin/board_manage.do";
	}
		
	@RequestMapping("admin/board/cor_delete.do")
	public String type_cor_delete(String type,int index) {
		bdao.delete_temp(type,index);
		
		int result=bdao.delete_cor(type); //게시판제거
		System.out.println(type+"삭제결과:"+result);
		return "redirect:/admin/board_manage.do";
	}


}
