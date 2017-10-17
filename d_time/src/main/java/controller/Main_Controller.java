package controller;

import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import model.Board_DTO;
import model.Board_Type_DTO;
import model.Member_DTO;
import model.Notice_DTO;
import model.Orders_DTO;
import model.Sell_DTO;

@Controller
public class Main_Controller {
	
	@Autowired
	Main_DAO dao;
	

	
	@RequestMapping("/main_admin.do")
	public String admin(Model model,HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		
		Locale locale = new Locale("ko");
		LocaleResolver localeResolver = RequestContextUtils
				.getLocaleResolver(request);
		localeResolver.setLocale(request, response, locale);
		
		
		List<Notice_DTO> nlist = dao.getNoticeMain();
		List<Board_DTO> blist = dao.getBoardMain();
		
		List<Board_Type_DTO> typeList = dao.selectType();
		session.setAttribute("typelist", typeList);
		int store_1 = dao.getStore_1();
		int store_2 = dao.getStore_2();
		
		model.addAttribute("notice_list",nlist);
		model.addAttribute("board_list",blist);
		model.addAttribute("store1",store_1);
		model.addAttribute("store2",store_2);
		
		//최근발주내역 10개
		List<Orders_DTO> olist = dao.orders_list();
		model.addAttribute("orders",olist);
		
		
		Calendar cal = Calendar.getInstance();
		String i = String.valueOf(cal.get(Calendar.MONTH)+1);
		
		if (i.length() == 1) {
			i = "0" + i;
		}
		
		String j = String.valueOf(cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		
		if(j.length() ==1) {
			j = "0" + j;
		}
		
		String from = String.valueOf(cal.get(Calendar.YEAR)+ "-" + i + "-" + j);
		String to = String.valueOf(cal.get(Calendar.YEAR) + "-" + i + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		List<Sell_DTO> sell = dao.FT_list(from, to);
		model.addAttribute("best_store", sell);
		
		return "main_admin";
	}
	
	
	
	@RequestMapping("/main_member.do")
	public String member(Model model, HttpSession session,HttpServletRequest request, HttpServletResponse response) {
		Locale locale = new Locale("ko");
		LocaleResolver localeResolver = RequestContextUtils
				.getLocaleResolver(request);
		localeResolver.setLocale(request, response, locale);
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		if(mdto==null)
			return "redirect:logout.jsp";
		
		List<Notice_DTO> nlist = dao.getNoticeMain();
		List<Board_DTO> blist = dao.getBoardMain();
		
		List<Board_Type_DTO> typeList = dao.selectType();
		session.setAttribute("typelist", typeList);
		
		int store_1 = dao.getStore_1();
		int store_2 = dao.getStore_2();
		
		model.addAttribute("notice_list",nlist);
		model.addAttribute("board_list",blist);
		model.addAttribute("store1",store_1);
		model.addAttribute("store2",store_2);
		
		//최근판매내역
		List<Sell_DTO> slist = dao.sale_list(mdto.getS_no());
		model.addAttribute("sale_list",slist);
		
		
		Calendar cal = Calendar.getInstance();
		String i = String.valueOf(cal.get(Calendar.MONTH)+1);
		
		if (i.length() == 1) {
			i = "0" + i;
		}
		
		String j = String.valueOf(cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		
		if(j.length() ==1) {
			j = "0" + j;
		}
		
		String from = String.valueOf(cal.get(Calendar.YEAR)+ "-" + i + "-" + j);
		String to = String.valueOf(cal.get(Calendar.YEAR) + "-" + i + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		
		List<Sell_DTO> sell = dao.FT_list(from, to);
		model.addAttribute("best_store", sell);
		
		return "main_member";
	}
}
