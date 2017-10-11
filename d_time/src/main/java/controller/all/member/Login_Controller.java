package controller.all.member;


import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import controller.all.member.Member_DAO;
import model.Member_DTO;
import validator.Authenticator;
import validator.AuthenticationException;
import validator.LoginCommandValidator;

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
	
	@Autowired
	private Authenticator authenticator;
	public void setAuthenticator(Authenticator loginService) {
		this.authenticator = loginService;
	}

	@ModelAttribute
	public Member_DTO formBacking() {
		return new Member_DTO(); //클래스명을 모델명으로 사용
	}
	
	
	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String login() {
		return "redirect:login.jsp";
	}
	@RequestMapping(value="login_check.do", method = RequestMethod.POST)
    public String loginCheck(@Valid Member_DTO memberDto,BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("empty_login", 1);
			System.out.println("비어있는값!");
			return "index"; //비어있는값
		}
		System.out.println(memberDto.getMem_id());
		Member_DTO member=dao.loginMem(memberDto);
	/*	if(member==null) {
			return "redirect:index.jsp";
		}
		System.out.println("로그인성공"+member.getMem_id());
		
		session.setAttribute("login", member);
		session.setAttribute("mem_id", memberDto.getMem_id()); //id만 따로 담아서 가져오는것
		
		if(member.getMem_type().equals("관리자")) {
			return "redirect:main_admin.do";
		}
		else {
			return "redirect:main_member.do";
		}*/
		
		
		try {
			authenticator.authenticate(member); // 아이디와 비밀번호가 다르면 에러발생 -> catch 

			//문제없을시
			System.out.println("로그인성공"+member.getMem_id());
			
			session.setAttribute("login", member);
			session.setAttribute("mem_id", memberDto.getMem_id()); //id만 따로 담아서 가져오는것
			
			if(member.getMem_type().equals("관리자")) {
				return "redirect:main_admin.do";
			}
			else {
				return "redirect:main_member.do";
			}
			//return "redirect:/index.jsp";
		}catch(AuthenticationException e) {
			result.reject("invalidIdOrPassword",new Object[] {member},null); 
			//reject:예외코드 추가(글로벌에러코드)  rejectValue : 필드에러
			//0번인덱스에 값을 받아서 에러메시지에 사용
			return "redirect:/index.jsp";
		}
		
		
		
		
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) { //초기화시점에 실행
		binder.setValidator(new LoginCommandValidator());
	}
	
	
	//로그아웃
	@RequestMapping(value="logout.do")
    public String loginout(HttpSession session) {
		session.invalidate(); //session없애기
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="pwfindForm.do",method=RequestMethod.GET)
	public String pwfind() {
			return "pwfindForm";
		}
	@RequestMapping(value="pwfindForm.do", method=RequestMethod.POST)
	public String pwfindForm(Member_DTO member_DTO , HttpSession session) {
		System.out.println("member_DTO?먮뒗 "+ member_DTO.getMem_id());
		Member_DTO member=dao.pwfind(member_DTO);
		if(member==null) {
			return "redirect:pwfindForm.jsp";
		}
		System.out.println("member?먮뒗 "+ member.getMem_id());
		
		session.setAttribute("mem_id", member_DTO.getMem_id()); 
		session.setAttribute("s_code", member_DTO.getS_code());
		return "pwchange"; 
	}		
	
	
	
	@RequestMapping(value="pwchange.do", method=RequestMethod.GET)
	public String pwchange() {
		return "pwchange";
	}
	@RequestMapping(value="pwchanged.do",method=RequestMethod.POST)
	public String newpwd(String mem_pwd, HttpSession session ,Model model) {
		String id = (String) session.getAttribute("mem_id"); 
		
		Member_DTO member_DTO = new Member_DTO(); 
		member_DTO.setMem_id(id);
		member_DTO.setMem_pwd(mem_pwd); 
		
		int check= dao.pwchange(member_DTO);

	//	session.setAttribute("login", member_DTO);

		
		model.addAttribute("check", check); 
		
		
			return "index";
		}

	
	
}