package controller.member.stock;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Stock_DTO;

@Controller
public class Member_Stock_Controller {
	@Autowired
	Member_Stock_DAO stock;

	public Member_Stock_DAO getStock() {
		return stock;
	}

	public void setStock(Member_Stock_DAO stock) {
		this.stock = stock;
	}

	@RequestMapping(value = "stock_status.do", method = RequestMethod.GET)
	public ModelAndView stock_status(ModelAndView mav, Stock_DTO Stock_DTO) {

		List<Stock_DTO> list = stock.selectList(1);

		mav.addObject("list", list);
		mav.setViewName("stock/stock_status");

		return mav;

	}

}
