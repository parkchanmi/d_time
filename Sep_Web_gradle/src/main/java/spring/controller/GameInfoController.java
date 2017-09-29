package spring.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GameInfoController {
	
	@RequestMapping("/game/info")
	public ModelAndView gameInfo(@RequestParam("p") String userId) {//파라미터로 넘긴 값을 받기만하고 모델로 만들지는 못한다.
		System.out.println("userid="+userId);
		ModelAndView m =new ModelAndView("game/users/info","p",userId);
		
		return m;
	}
	
	@RequestMapping("/game/list")
	public String gameList() {
		return "game/list";
	}

}
