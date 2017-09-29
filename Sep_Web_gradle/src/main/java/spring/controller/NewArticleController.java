package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.service.ArticleService;
import spring.service.NewArticleCommand;

@Controller
@RequestMapping("/article/newArticle.do")
public class NewArticleController {
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String form() {
		// @RequestMapping 메서드의 리턴 타입이 String => return값을 viewname으로 사용
		return "article/newArticleForm";
	}
	@RequestMapping(method = RequestMethod.POST)
								//모델추가, key:command
	public String submit(@ModelAttribute("command") NewArticleCommand command)
							//dispatcher servlet이 매개변수 객체를 만들고
							//파라미터 이름과 프로퍼티가 동일하면 자동저장
	{
		articleService.writeArticle(command);
		return "article/newArticleSubmit";
	}
	public void setArticleService(ArticleService articleService) {
		this.articleService = articleService;
	}
	
}
