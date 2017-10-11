package controller.all.member;

import java.util.HashMap;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import model.Member_DTO;

	@Controller
	public class MyInfo_Controller {
		@Autowired
		Member_DAO dao;

		public Member_DAO getDao() {
			return dao;
		}
		public void setDao(Member_DAO dao) {
			this.dao = dao;
		}
		
		@RequestMapping(value="myinfo.do", method=RequestMethod.GET)
		public String myinfo(HttpSession session ,Model model) {		
	
			Member_DTO mdto = (Member_DTO) session.getAttribute("login");

			if(mdto.getMem_type().equals("관리자")) {
				return "admin/myinfo/myinfo";
			}	
			return "mem/myinfo/myinfo";
		}
		
		@RequestMapping(value="myinfo.do", method=RequestMethod.POST)
		public String form(String mem_pwd, HttpSession session, Model model) {

			Member_DTO mdto = (Member_DTO) session.getAttribute("login");
			
	
			if(mdto.getMem_type().equals("관리자")) {
				return "admin/myinfo/myinfo_pwdCheck";
			}
			return "mem/myinfo/myinfo_pwdCheck";
		}
		
		
		@RequestMapping(value="myinfo_pwdCheck.do",method=RequestMethod.GET)
		public String changeinfo(HttpSession session) {
			Member_DTO mdto = (Member_DTO) session.getAttribute("login");
			if(mdto.getMem_type().equals("관리자")) {
				return "admin/myinfo/myinfo_pwdCheck";
			}
			
			return "mem/myinfo/myinfo_pwdCheck";
			}
		@RequestMapping(value="myinfo_pwdCheck.do", method=RequestMethod.POST)
		public String Changeinfo(String mem_pwd, HttpSession session) {
			
			Member_DTO session_member=(Member_DTO) session.getAttribute("login"); 
			String login_id = session_member.getMem_id();
			
			String user_pwd=dao.selectMem(login_id,mem_pwd);
			
			Member_DTO mdto = (Member_DTO) session.getAttribute("login");
			
			if(user_pwd==null) {
				if(mdto.getMem_type().equals("관리자")) {
					return "admin/myinfo/myinfo_pwdCheck";
				}
				else{return "mem/myinfo/myinfo_pwdCheck";
				}
			}	
			else {
				if(mdto.getMem_type().equals("관리자")) {
					return "admin/myinfo/myinfo_modifyForm";
				}
				else{return "mem/myinfo/myinfo_modifyForm";
				
				}
			}
	
		}
		//정보수정

		@RequestMapping(value="myinfo_modifyForm.do", method=RequestMethod.GET)
		public String pwd(HttpSession session) {
			Member_DTO mdto = (Member_DTO) session.getAttribute("login");
			if(mdto.getMem_type().equals("관리자")) {
				return "admin/myinfo/myinfo_modifyForm";
			}
			
			return "mem/myinfo/myinfo_modifyForm";
		}
		@RequestMapping(value="myinfo_update.do",method=RequestMethod.POST)
		public String newinfo(Member_DTO new_mem, HttpSession session) {
		
			dao.updateinfo(new_mem);

			session.setAttribute("login", new_mem);
			
			System.out.println("new_mem의 type은 "+new_mem.getMem_type());
			
			if(new_mem.getMem_type().equals( "관리자")) {
				return "main_admin";
			}
			else {
				return "main_member";
			}
	}	
}
		
		
		
		
		
		
		
		
		
