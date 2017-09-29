package controller.member;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Member_DTO;

@Controller
public class Join_Controller {
	
	@Autowired
	Member_DAO dao;

	public Member_DAO getDao() {
		return dao;
	}

	public void setDao(Member_DAO dao) {
		this.dao = dao;
	}
	/*회원가입*/
	@RequestMapping(value="joinForm.do", method = RequestMethod.GET)
	public String form() {
		return "join/joinForm";
	}
	
	@RequestMapping(value="index.do", method = RequestMethod.POST)
	public String submit(Member_DTO memberDto) {
		System.out.println("mem_id_insert:"+ memberDto.getMem_id());
		dao.insertMem(memberDto);
		return "redirect:index.jsp";
		
	}
	/*id 중복확인*/
	@RequestMapping(value = "/confirmid.do")
	public String overlapTest(String mem_id, Model model){
		System.out.println("mem_id"+mem_id);
		String memberId = dao.selectId(mem_id);
		
		int check =0;
		if(memberId == null) {
			check = 0;
		}
		//db에서 중복확인
		else if(memberId != null) {
			check = 1;
		}
		
		model.addAttribute("check", check); //중복
		model.addAttribute("mem_id", mem_id);
		return "confirmid";
		
	}

	//지점명코드확인
	@RequestMapping(value = "/confirm_code.do")
	public String overlapTest2(String s_code, Model model){
		System.out.println("s_code"+s_code);
		HashMap map = dao.selectcode(s_code);
		
		int check =0;
		if(map == null) {
			check = 1;
		}
		//db에서 중복확인
		else if(map != null) {
			check = 0;
		}
		
		model.addAttribute("check", check); //중복
		model.addAttribute("storeinfo", map);
		return "confirm_code";
		
	}

}

