package controller.all.sale;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

/*	@RequestMapping(value = "/sale.do", method = RequestMethod.GET)
	public String form() {
		return "redirect:saleForm.do";
	}*/
	
	//직영점 연매출 통계
/*	@RequestMapping(value = "/sale.do", method = RequestMethod.GET)
	public ModelAndView statistic2() {
		ModelAndView mav2 = new ModelAndView();
		// List<Sell_DTO> y1 = saledao.selectList(sell_DTO.getS_type());
		List<HashMap> map = saledao.selectList("직영");
		if (map != null) {
			System.out.println(map.size());
			
			mav2.addObject("list_y1", map);
			mav2.setViewName("test11");

			System.out.println(map.get(1));
		} else {
			mav2.setViewName("test11");
		}
		return mav2;
	}*/

	// 직영+가맹 기간매출 출력
	@RequestMapping("/sale.do")
	public ModelAndView statistic1(Sell_DTO sell_DTO, String from, String to) {
		System.out.println(from);
		System.out.println(to);
		ModelAndView mav = new ModelAndView();
		
		
		List<HashMap> map = saledao.j_list("직영");
		
		if (map != null) {
			System.out.println("y1:" + map.size());
			
			mav.addObject("list_y1", map);
			
			System.out.println("y1:" + map.get(0));
		}
		
		List<HashMap> map2 = saledao.k_list("가맹");
		
		if (map2 != null) {
			System.out.println("y2:" + map2.size());
			
			mav.addObject("list_y2", map2);
			
			System.out.println("y2:" + map2.get(0));
		}
		
		if(from!=null) {//기간설정
			
			List<Sell_DTO> sell = saledao.FT_list(from, to);
			mav.addObject("list", sell);
			mav.addObject("from", from);
			mav.addObject("to", to);
			
		}
		
		mav.setViewName("sale/saleForm");
		
		return mav;
	}
	
	@RequestMapping("/download.do")
	public ModelAndView xml(Timestamp sel_date,String string) {

		ModelAndView mav2 = new ModelAndView();
		
		int all_cost = saledao.all_cost_list(sel_date);
		int j_cost = saledao.j_cost_list(string);
		int k_cost = saledao.k_cost_list(string);
		List<HashMap> name_cost = saledao.name_cost_list(string);
		
		HashMap cost = new HashMap();
		cost.put("all_cost", all_cost);
		cost.put("j_cost", j_cost);
		cost.put("k_cost", k_cost);
		cost.put("name_cost", name_cost);

		
		
		mav2.addObject("cost", cost);
		
		mav2.setViewName("downloads");
		
		return mav2;
		
	}
}
