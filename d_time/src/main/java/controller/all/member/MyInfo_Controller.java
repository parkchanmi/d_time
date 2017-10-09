package controller.all.member;

import java.util.HashMap;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		public String myinfo() {
			//s_no -> db(dao)
			return "myinfo/myinfo";
		}
		
		@RequestMapping(value="myinfo.do", method=RequestMethod.POST)
		public String form(String mem_pwd, HttpSession session) {

			return "myinfo/myinfo_pwdCheck";
		}
		
		
		@RequestMapping(value="myinfo_pwdCheck.do",method=RequestMethod.GET)
		public String changeinfo() {
				return "myinfo/myinfo_pwdCheck";
			}
		@RequestMapping(value="myinfo_pwdCheck.do", method=RequestMethod.POST)
		public String Changeinfo(String mem_pwd, HttpSession session) {
			
			Member_DTO session_member=(Member_DTO) session.getAttribute("login"); 
			String login_id = session_member.getMem_id();
			
			String user_pwd=dao.selectMem(login_id,mem_pwd);
			if(user_pwd==null) {
				return "myinfo/myinfo_pwdCheck";
			}
			//새 비밀번호 입력 폼
			/*return "login/changePwdForm";*/
			return "myinfo/myinfo_modifyForm"; //redirect로 해야바로갈수있음.위에 코딩으로하면 url안바뀜
		}		
		
		
		//정보수정

		@RequestMapping(value="myinfo_modifyForm.do", method=RequestMethod.GET)
		public String pwd() {
			return "myinfo/myinfo_modifyForm";
		}
		@RequestMapping(value="myinfo_update.do",method=RequestMethod.POST)
		public String newinfo(String mem_pwd,String mem_name,String mem_hp, HttpSession session) {
			String id = (String) session.getAttribute("mem_id"); //위에서 담아온 id를 가져옴
			String type= (String) session.getAttribute("mem_type"); //추가
			
			Member_DTO memberDTO = new Member_DTO(); 
			memberDTO.setMem_id(id);
			memberDTO.setMem_pwd(mem_pwd); 
			memberDTO.setMem_name(mem_name); 
			memberDTO.setMem_hp(mem_hp); 
			memberDTO.setMem_type(type); //추가
			dao.updateinfo(memberDTO);

			/*return "main_member";*/
			
			session.setAttribute("login", memberDTO);
			
			
			if(type == "관리자") {
				return "main_admin";
			}
			else {
				return "main_member";
			}
	}	
}
		
		
		
		
		
		
		
		
		
		
		
		
		/*@RequestMapping(value="myinfo.do", method=RequestMethod.POST)
		public String myinfo(String mem_pwd, String mem_name, String mem_hp, HttpSession session) {
			Member_DTO member=(Member_DTO)session.getAttribute("login");
			String pwd = member.getMem_pwd();
			String name = member.getMem_name();
			String hp = member.getMem_hp();
			
			HashMap map = dao.selectinfo(pwd, name, hp);
				
			return "redirect:myinfo_modifyForm.do";
		}
		
		
		@RequestMapping(value="myinfo_modifyForm.do", method=RequestMethod.GET)
		public String info() {
			return "myinfo_modifyForm";
		}
		@RequestMapping(value="changePwdComplete.do", method=RequestMethod.POST)
		public String newinfo(String mem_pwd, String mem_name, String mem_hp, HttpSession session) {
			
			Member_DTO memberDTO=new Member_DTO();
			memberDTO.setMem_pwd(mem_pwd);
			memberDTO.setMem_name(mem_name);
			memberDTO.setMem_hp(mem_hp);
			System.out.println("update확인:"+ mem_name);
			
			dao.updateinfo(memberDTO);
			return "changePwdComplete";
			
		}*/
		
