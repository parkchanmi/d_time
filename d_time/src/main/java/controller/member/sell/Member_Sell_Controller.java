package controller.member.sell;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import controller.admin.menu.Admin_Menu_DAO;
import model.Member_DTO;
import model.Menu_DTO;
import model.Sell_DTO;

@Controller
public class Member_Sell_Controller {

	@Autowired
	private Member_Sell_DAO sdao;
	@Autowired
	private Admin_Menu_DAO mdao;
	
	public Member_Sell_DAO getSdao() {
		return sdao;
	}

	public void setSdao(Member_Sell_DAO sdao) {
		this.sdao = sdao;
	}
	
	@RequestMapping("/sell/menu_recipe.do")
	public String menu_recipe(Model model) {
		List<Menu_DTO> mlist = mdao.getMenuList();
		if (mlist != null)
			model.addAttribute("mlist", mlist);
		return "mem/menu_recipe";
	}	
		
	@RequestMapping("/sell/sell_main.do")
	public String sell_main(Model model,HttpSession session) {
		List<Menu_DTO> mlist = sdao.getMenuList();
		List<Boolean> blist = new ArrayList<Boolean>();
		Member_DTO session_member=(Member_DTO) session.getAttribute("login"); 
		if(session_member==null) { //
			return "redirect:index.jsp";
		}
		
		int s_no = session_member.getS_no();
		
		if(mlist!=null) {
			for(int i=0;i<mlist.size();i++) {
				boolean stock_ok = sdao.stock_confirm(mlist.get(i).getM_no(),1,s_no);
				blist.add(stock_ok);
			}
			
		}
		
		if (mlist != null) {
			model.addAttribute("mlist", mlist);
			model.addAttribute("blist", blist);
		}
		return "sell/main";
	}

	@RequestMapping("/sell/sell_sale.do")
	public String sell_submit(HttpSession session, Model model, String m_type[], String m_name[], int m_count[], int m_cost[], int m_no[]) {
		String menu_history="";
		int menu_count=0;
		int menu_cost=0;
		ArrayList<Sell_DTO> sell_list = new ArrayList<Sell_DTO>();
		Member_DTO session_member=(Member_DTO) session.getAttribute("login"); 
		if(session_member==null) { //
			return "redirect:index.jsp";
		}
		
		int s_no = session_member.getS_no();
		boolean stock_ok = sdao.stock_confirm(m_no,m_count,s_no);
		
		if(!stock_ok) {
			System.out.println("재고부족");
			model.addAttribute("confirm",stock_ok);
			return "sell/sell_sale_do";
		}
		
		if(stock_ok) 
			System.out.println("판매가능");
		
		for (int i = 0; i < m_name.length; i++) { // 음료 주문 만들기
			if(i==0) { //초기화
				menu_history="";
				menu_count=0;
				menu_cost=0;
			}
			if (m_type[i].equals("음료")) {
				menu_history+=","+m_name[i]+","+m_count[i];
				menu_count+=m_count[i];
				menu_cost+=m_cost[i]*m_count[i];
			}
			if(i==m_name.length-1 && menu_cost!=0) { //for문 다 돌았을 때 가격이 0이 아닐경우 == 주문정보가 있는경우
				   
				menu_history=menu_history.substring(1, menu_history.length());
				
				Timestamp time = new Timestamp(System.currentTimeMillis());

				Sell_DTO drink_sell = new  Sell_DTO(s_no, time, menu_cost, menu_history, "음료",menu_count);
				sell_list.add(drink_sell);
				
				System.out.println(menu_history+"수량:"+menu_count+"금액:"+menu_cost+"현재시간:"+time);
			}
		}
		for (int i = 0; i < m_name.length; i++) { // 식품 주문 만들기
			if(i==0) { //초기화
				menu_history="";
				menu_count=0;
				menu_cost=0;
			}
			if (m_type[i].equals("식품")) {
				menu_history+=","+m_name[i]+","+m_count[i];
				menu_count+=m_count[i];
				menu_cost+=m_cost[i]*m_count[i];
			}
			if(i==m_name.length-1 && menu_cost!=0) { //for문 다 돌았을 때 가격이 0이 아닐경우 == 주문정보가 있는경우
				menu_history=menu_history.substring(1, menu_history.length());
				
				Timestamp time = new Timestamp(System.currentTimeMillis());

				Sell_DTO food_sell = new  Sell_DTO(s_no, time, menu_cost, menu_history, "식품",menu_count);
				sell_list.add(food_sell);
				
				System.out.println(menu_history+"수량:"+menu_count+"금액:"+menu_cost);
			}
		}
		for (int i = 0; i < m_name.length; i++) { // 상품 주문 만들기
			if(i==0) { //초기화
				menu_history="";
				menu_count=0;
				menu_cost=0;
			}
			if (m_type[i].equals("상품")) {
				menu_history+=","+m_name[i]+","+m_count[i];
				menu_count+=m_count[i];
				menu_cost+=m_cost[i]*m_count[i];
			}
			if(i==m_name.length-1 && menu_cost!=0) { //for문 다 돌았을 때 가격이 0이 아닐경우 == 주문정보가 있는경우
				
				menu_history=menu_history.substring(1, menu_history.length());

				
				Timestamp time = new Timestamp(System.currentTimeMillis());
				
				Sell_DTO product_sell = new  Sell_DTO(s_no, time, menu_cost, menu_history, "상품",menu_count);
				sell_list.add(product_sell);
				
				System.out.println(menu_history+"수량:"+menu_count+"금액:"+menu_cost);
			}
		}
		int result = 0;
		//db에 저장
		if(!sell_list.isEmpty())
			result = sdao.sell_exe(sell_list);
		
		if(result!=sell_list.size()) {//에러
			model.addAttribute("dberr",false);
		}
		
		model.addAttribute("confirm",stock_ok);
		
		return "sell/sell_sale_do";
	}

}
