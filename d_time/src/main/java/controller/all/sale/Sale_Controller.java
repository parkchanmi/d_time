package controller.all.sale;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Sell_DTO;

@Controller
public class Sale_Controller {
	
	@Autowired
	SaleDAO saledao;

	public SaleDAO getSaledao() {
		return saledao;
	}

	public void setSaledao(SaleDAO saledao) {
		this.saledao = saledao;
	}

	// 직영+가맹 기간매출 출력
	@RequestMapping("/sale.do")
	public ModelAndView statistic1(Sell_DTO sell_DTO, String from, String to, String string) {

		ModelAndView mav = new ModelAndView();
		
		
		List<HashMap> map = saledao.j_list("직영");
		
		if (map != null) {
		///	System.out.println("y1:" + map.size());
			
			mav.addObject("list_y1", map);
			
		//	System.out.println("y1:" + map.get(0));
		}
		
		List<HashMap> map2 = saledao.k_list("가맹");
		
		if (map2 != null) {
		//	System.out.println("y2:" + map2.size());
			
			mav.addObject("list_y2", map2);
			
		//	System.out.println("y2:" + map2.get(0));
		}
		
		if(from!=null) {//기간설정
			
			List<Sell_DTO> sell = saledao.FT_list(from, to);
			mav.addObject("list", sell);
			mav.addObject("from", from);
			mav.addObject("to", to);
			
		//	System.out.println("from::::" + from);
			
		}else {
			Calendar cal = Calendar.getInstance();
			String i = String.valueOf(cal.get(Calendar.MONTH)+1);
			
			if (i.length() == 1) {
				i = "0" + i;
			}
			
			String j = String.valueOf(cal.getActualMinimum(Calendar.DAY_OF_MONTH));
			
			if(j.length() ==1) {
				j = "0" + j;
			}
			
			from = String.valueOf(cal.get(Calendar.YEAR)+ "-" + i + "-" + j);
			to = String.valueOf(cal.get(Calendar.YEAR) + "-" + i + "-" + cal.getActualMaximum(Calendar.DAY_OF_MONTH));
			
			List<Sell_DTO> sell = saledao.FT_list(from, to);
			mav.addObject("list", sell);
			mav.addObject("from", from);
			mav.addObject("to", to);
		}
		
		//파이 가맹
		List<HashMap> pie_gm = new ArrayList<HashMap>();
		if(from==null) {
			pie_gm = saledao.selectPie_gm("가맹");
		}else{
			pie_gm = saledao.selectPie_gm2("가맹", from, to);
		}
		mav.addObject("pie_gm", pie_gm);
		
		//파이그래프 직영
		List<HashMap> pie_jy = new ArrayList<HashMap>();
		if (from == null) {
			pie_jy = saledao.selectPie_jy("직영");
		}else {
			pie_jy = saledao.selectPie_jy2("직영", from, to);
		}

		mav.addObject("pie_jy", pie_jy);

		mav.setViewName("sale/saleForm");
		return mav;
	}
	
	@RequestMapping("/download.do")
	public ModelAndView xml(Timestamp sel_date,String from, String to,String string) {

		ModelAndView mav2 = new ModelAndView();
		
		int all_cost = saledao.all_cost_list(sel_date);
		int j_cost = saledao.j_cost_list(string);
		int k_cost = saledao.k_cost_list(string);
		List<HashMap> name_cost = saledao.name_cost_list(from, to);
		
		HashMap cost = new HashMap();
		cost.put("all_cost", all_cost);
		cost.put("j_cost", j_cost);
		cost.put("k_cost", k_cost);
		cost.put("name_cost", name_cost);
		cost.put("from", from);
		cost.put("to", to);		
		
		mav2.addObject("cost", cost);
		mav2.setViewName("downloads");
		
		return mav2;
		
	}
}
