package controller.admin.menu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import controller.admin.product.Admin_Product_DAO;
import model.Menu_DTO;
import model.Product_DTO;

@Controller
public class Admin_Menu_Controller {

	@Autowired
	private Admin_Menu_DAO mdao;

	@Autowired
	private Admin_Product_DAO pdao;

	public Admin_Product_DAO getPdao() {
		return pdao;
	}

	public void setPdao(Admin_Product_DAO pdao) {
		this.pdao = pdao;
	}

	public Admin_Menu_DAO getMdao() {
		return mdao;
	}

	public void setMdao(Admin_Menu_DAO mdao) {
		this.mdao = mdao;
	}

	@RequestMapping("/admin/menu/menu_list.do")
	public String menu_list(Model model) {

		List<Menu_DTO> mlist = mdao.getMenuList();

		if (mlist != null)
			model.addAttribute("mlist", mlist);

		return "admin/menu/menu_list";
	}

	@RequestMapping(value = "/admin/menu/menu_add.do", method = RequestMethod.GET)
	public String menu_addForm(Model model) {
		List<Menu_DTO> mlist = mdao.getMenuList();
		if (mlist != null)
			model.addAttribute("mlist", mlist);
		
		List<Product_DTO> plist = pdao.getProductList();
		if (plist != null)
			model.addAttribute("plist", plist);
		return "admin/menu/menu_add";
	}

	@RequestMapping(value = "/admin/menu/menu_add.do", method = RequestMethod.POST)
	public String menu_addSubmit(Menu_DTO mdto, String[] m_recipes, int[] m_num) {

		String recipe = "";

		for (int i = 0; i < m_recipes.length; i++) // 레시피 문자열 만들기
		{
			if (i == m_recipes.length - 1)
				recipe += m_recipes[i] + "," + m_num[i];
			else
				recipe += m_recipes[i] + "," + m_num[i] + ",";
			// System.out.println(mdto.getM_type()+m_recipes[i]+", "+m_num[i]);
		}
		// System.out.println(mdto.getM_name()+" 레시피:"+recipe);
		mdto.setM_recipe(recipe);

		int x = mdao.addMenu(mdto);
		if (x == 0)
			return "/admin/menu/menu_add";

		/*
		 * 레시피분리 String[] split_receipe = receipe.split(","); HashMap<String,Integer>
		 * map = new HashMap<String,Integer>(); for(int
		 * i=0;i<split_receipe.length;i=i+2) { map.put(split_receipe[i],
		 * Integer.parseInt(split_receipe[i+1])); } System.out.println(map);
		 */

		return "redirect:/admin/menu/menu_list.do";
	}

	@RequestMapping(value = "/admin/menu/modify.do", method = RequestMethod.POST)

	public String menu_modify(String[] m_name, int[] m_cost, int[] m_no) {

		for (int i = 0; i < m_name.length; i++) {
			System.out.println(m_name[i]);
		}

		mdao.modifyMenu(m_name, m_cost, m_no);

		return "redirect:/admin/menu/menu_list.do";
	}

	@RequestMapping(value = "/admin/menu/menu_delete.do")
	public String menu_delete(int m_no) {
		int x = mdao.deleteMenu(m_no);

		return "redirect:/admin/menu/menu_list.do";
	}

	/*
	 * @ResponseBody public Object menu_modify(HttpServletRequest
	 * request, @RequestBody Menu_DTO menudto) throws Exception { Map <String,
	 * String> resultMap = new HashMap<String, String>();
	 * 
	 * String result = ""; String resultMsg = "";
	 * 
	 * try {
	 * 
	 * for(Map<String, Object> tList : list) { Menu_DTO mdto= new Menu_DTO() ;
	 * 
	 * mdto.setM_no((Integer)tList.get("m_no"));
	 * mdto.setM_name(tList.get("m_name").toString());
	 * mdto.setM_cost((Integer)tList.get("m_cost"));
	 * System.out.println(tList.get("m_name").toString()); //
	 * authMgmtService.mergeAuthMgmtList(aVO) ; }
	 * 
	 * result = "success"; resultMsg = "성공" ;
	 * 
	 * } catch (Exception e) { result = "failure"; resultMsg = "실패" ; }
	 * 
	 * resultMap.put("result", result); resultMap.put("resultMsg", resultMsg);
	 * 
	 * return resultMap;
	 * 
	 * }
	 */

}
