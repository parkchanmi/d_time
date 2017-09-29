package controller.member;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import controller.member.Member_DAO;
import model.Member_DTO;

@Controller
public class Login_Controller {
	
	@Autowired
	Member_DAO dao;

	public Member_DAO getDao() {
		return dao;
	}
	public void setDao(Member_DAO dao) {
		this.dao = dao;
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String login() {
		return "redirect:login.jsp";
	}
	 @RequestMapping(value="/login_check.do", method = RequestMethod.POST)
	    public String loginCheck(Member_DTO memberDto, HttpSession session) {
	   
	      Member_DTO member=dao.loginMem(memberDto);
	      if(member==null) {
	         return "redirect:index.jsp";
	      }
	      System.out.println("로그인성공"+member.getMem_id());
	      
	      session.setAttribute("login", member);
	      session.setAttribute("mem_id", memberDto.getMem_id()); //id만 따로 담아서 가져오는것
	      
	      if(member.getMem_type().equals("관리자")) {
	         return "redirect:/main_admin.do";
	      }
	      else {
	         return "redirect:/main_member.do";
	      }
	      
	   }

	
	//로그아웃
	@RequestMapping(value="logout.do")
    public String loginout(HttpSession session) {
		session.invalidate(); //session없애기
		return "redirect:/index.jsp";
	}
	
	
	
	
}