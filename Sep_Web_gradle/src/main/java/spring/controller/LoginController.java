package spring.controller;

import javax.validation.Valid;

import spring.service.AuthenticationException;
import spring.service.Authenticator;
import spring.service.LoginCommand;
import spring.validator.LoginCommandValidator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login/login.do")
public class LoginController {
	private String formViewName="login/form";
	
	@Autowired
	private Authenticator authenticator;
	public void setAuthenticator(Authenticator loginService) {
		this.authenticator = loginService;
	}

	@ModelAttribute
	public LoginCommand formBacking() {
		return new LoginCommand(); //클래스명을 모델명으로 사용
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		return formViewName;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String submit(@Valid LoginCommand loginCommand,BindingResult result) {//BindingResult가 에러코드 추가
		//@Valid : 설정된 (init)validate로 검사 -> 비어있으면 에러코드발생
		if(result.hasErrors()) {
			return formViewName; //error정보와 viewname 리턴
		}
		try {
			authenticator.authenticate(loginCommand); // 아이디와 비밀번호가 다르면 에러발생 -> catch 
			return "redirect:/index.jsp";
		}catch(AuthenticationException e) {
			result.reject("invalidIdOrPassword",new Object[] {loginCommand.getUserId()},null); 
			//reject:예외코드 추가(글로벌에러코드)  rejectValue : 필드에러
			//0번인덱스에 값을 받아서 에러메시지에 사용
			return formViewName;
		}
			
	}
	@InitBinder
	protected void initBinder(WebDataBinder binder) { //초기화시점에 실행
		binder.setValidator(new LoginCommandValidator());
	}
	//initBinder : validator지정
	//				데이터 타입 변환 처리
	

}
