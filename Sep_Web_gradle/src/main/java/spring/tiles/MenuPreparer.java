package spring.tiles;

import java.util.ArrayList;
import java.util.List;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;
import org.apache.tiles.Attribute;

public class MenuPreparer implements ViewPreparer{

	@Override
	public void execute(Request tilesContext,
			AttributeContext attributeContext) {
		List<String> menuList = new ArrayList<String>();
		menuList.add("<a href='/Sep_Web_gradle/index_tiles.jsp'>홈</a>");
		menuList.add("<a href='/Sep_Web_gradle/tiles/login/login.do'>로그인</a>");
		menuList.add("<a href='/Sep_Web_gradle/tiles/member/regist.do'>회원가입</a>");
		attributeContext.putAttribute("menuList", new Attribute(menuList), true);
		}	
}

