package controller.all.sale;

import java.sql.Timestamp;
import java.util.ArrayList;
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
		
		//湲곌컙蹂� 留ㅼ텧
		if(from!=null) {
			List<Sell_DTO> sell_mem = saleMemDao.selectFT(s_no,from, to);
			
			mav2.addObject("list_mem", sell_mem);
			mav2.addObject("from", from);
			mav2.addObject("to", to);			
	}
		//吏��젏 �뿰留ㅼ텧
		List<HashMap> map_mem = saleMemDao.selectYear(s_no);
		if (map_mem != null) {
			
			mav2.addObject("list_y_mem", map_mem);
			
			System.out.println("吏��젏而⑦듃濡ㅻ윭�뿰留ㅼ텧 :::: " + map_mem.size());
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
			
			System.out.println("�뙆�씠洹몃옒�봽::::" + pie_mem.size());

		}
		mav2.setViewName("sale/saleForm_mem");
		return mav2;
	}
	@RequestMapping("/downloadMem.do")
	public ModelAndView file(String s_no, String string) {
		ModelAndView mav_file = new ModelAndView();
		
		//�썡留ㅼ텧
		List<HashMap> month = saleMemDao.selectMonCost(s_no);
		//�긽�뭹蹂�
		List<HashMap> type = saleMemDao.selectType(s_no);
		
		HashMap mem_cost = new HashMap();
		mem_cost.put("month", month);
		mem_cost.put("type", type);
		
		mav_file.addObject("mem_cost", mem_cost);
		mav_file.setViewName("downloadsMem");
		
		return mav_file;
		
	}
	
}
