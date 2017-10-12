package controller.all.sale;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.Sell_DTO;

@Controller
public class Sale_Mem_Controller {
	
	@Autowired
	SaleMemDAO saleMemDao;

	public SaleMemDAO getSaleMemDao() {
		return saleMemDao;
	}

	public void setSaleMemDao(SaleMemDAO saleMemDao) {
		this.saleMemDao = saleMemDao;
	}

	@RequestMapping(value="/saleMem.do")
	public ModelAndView statistic2(Sell_DTO sell_DTO, String s_no, String from, String to) {		
		
		ModelAndView mav2 = new ModelAndView();
		
		//기간별 매출
		if(from!=null) {
		
			List<Sell_DTO> sell_mem = saleMemDao.selectFT(s_no,from, to);
			
			mav2.addObject("list_mem", sell_mem);
			mav2.addObject("from", from);
			mav2.addObject("to", to);
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
			
		//	System.out.println("from :::::" + from);
		//	System.out.println("to :::::" + to);
			//from = "2017-10-01";
			//to = "2017-10-31";
			
			List<Sell_DTO> sell_mem = saleMemDao.selectFT(s_no,from, to);//saleMemDao.selectFT2(s_no);
			
			mav2.addObject("list_mem", sell_mem);
			mav2.addObject("from", from);
			mav2.addObject("to", to);
		}

		//기간별 매출 상세
		List<Sell_DTO> sell_list = saleMemDao.selectDetail(s_no, from, to);
		mav2.addObject("detail_mem", sell_list);

		//연매출 그래프
		List<HashMap> map_mem = saleMemDao.selectYear(s_no);
		if (map_mem != null) {
			
			mav2.addObject("list_y_mem", map_mem);
			
			System.out.println(" Mem 연매출:::: " + map_mem.size());
		}
		
		//파이그래프
		List<HashMap> pie_mem = new ArrayList<HashMap>();
		
		if (from == null) {
			pie_mem = saleMemDao.selectPie(s_no);
		}else {
			pie_mem = saleMemDao.selectPie2(s_no, from, to);
		}
		if (map_mem != null) {
			mav2.addObject("pie_mem", pie_mem);
			
		}
		mav2.setViewName("sale/saleForm_mem");
		return mav2;
	}
	@RequestMapping("/downloadMem.do")
	public ModelAndView file(String s_no, String from, String to) {
		ModelAndView mav_file = new ModelAndView();

		//연매출
		List<HashMap> month = saleMemDao.selectMonCost(s_no);
		//타입별 매출
		List<HashMap> type = saleMemDao.selectType(s_no,from,to);
		//매출리스트
		List<HashMap> all = saleMemDao.selectAll(s_no,from,to);
		
		
		HashMap mem_cost = new HashMap();
		mem_cost.put("month", month);
		mem_cost.put("type", type);
		mem_cost.put("all", all);
		mem_cost.put("from", from);
		mem_cost.put("to", to);
		
		mav_file.addObject("mem_cost", mem_cost);
		mav_file.setViewName("downloadsMem");
		
		return mav_file;
		
	}
	
}
