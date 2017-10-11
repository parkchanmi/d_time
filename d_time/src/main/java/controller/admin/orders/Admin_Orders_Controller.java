package controller.admin.orders;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controller.admin.product.Product_DAO;
import controller.admin.stock.Stock_DAO;
import controller.admin.store.Store_DAO;
import model.Member_DTO;
import model.Orders_DTO;
import model.Product_DTO;
import model.Stock_DTO;
import model.Store_DTO;

@Controller
public class Admin_Orders_Controller {

	@Autowired
	Order_DAO ordao;
	@Autowired
	Store_DAO stdao;
	@Autowired
	Product_DAO prodao;
	@Autowired
	Stock_DAO stockdao;

	public Stock_DAO getStockdao() {
		return stockdao;
	}

	public void setStockdao(Stock_DAO stockdao) {
		this.stockdao = stockdao;
	}

	public Product_DAO getProdao() {
		return prodao;
	}

	public void setProdao(Product_DAO prodao) {
		this.prodao = prodao;
	}

	public Store_DAO getStdao() {
		return stdao;
	}

	public void setStdao(Store_DAO stdao) {
		this.stdao = stdao;
	}

	public Order_DAO getOrdao() {
		return ordao;
	}

	public void setOrdao(Order_DAO ordao) {
		this.ordao = ordao;
	}

	@RequestMapping(value = "/store_order.do", method = RequestMethod.GET)
	public ModelAndView orderlist(ModelAndView mav, HttpSession session, String s_no, Orders_DTO orderdto) {

		if (s_no == null) { // 발주현황

			List<Orders_DTO> ordslist = ordao.orderslist();

			mav.addObject("ordersList", ordslist);

			List<Store_DTO> stlist = stdao.storelist();
			mav.addObject("storelist", stlist);
		} else {

			int sno = Integer.parseInt(s_no);

			List<Orders_DTO> ordslist = ordao.orderone(sno);
			mav.addObject("ordersList", ordslist);

			List<Store_DTO> stlist = stdao.storelist();
			mav.addObject("storelist", stlist);
			
			Store_DTO store = stdao.storeone(sno);
			mav.addObject("storedto", store);
			mav.addObject("s_no",s_no);

		}

		mav.setViewName("admin/orders/order_list");
		return mav;
	}

	@RequestMapping(value = "/order_detail.do", method = RequestMethod.GET)
	public ModelAndView orderdetail(ModelAndView mav, int o_no) {

		
		System.out.println(o_no);
		

		Orders_DTO order = ordao.orderdtoone(o_no);
		mav.addObject("orderdto", order);
		int sno = order.getS_no();
		
		String storename = stdao.storeName(sno);
		mav.addObject("storename", storename);
		
		System.out.println("sno="+sno);
		
		List<HashMap> ordrink = stockdao.odrink(o_no,sno);
		mav.addObject("ordrink",ordrink);
		
		List<HashMap> orfood = stockdao.orfood(o_no,sno);
		mav.addObject("orfood",orfood);
		
		List<HashMap> orproduct = stockdao.orproduct(o_no,sno);
		mav.addObject("orproduct",orproduct);
		
		List<HashMap> orthing = stockdao.orthing(o_no,sno);
		mav.addObject("orthing",orthing);
		
		
		mav.setViewName("admin/orders/order_detail");

		return mav;
	}

	@RequestMapping(value = "/store_confirm.do", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView orderconfirm(ModelAndView mav, int o_no) {

		ordao.orderstateupdate(o_no);
		
		Orders_DTO order = ordao.orderdtoone(o_no);
		mav.addObject("orderdto", order);
		int sno = order.getS_no();
		
		List<Stock_DTO> stockdto = stockdao.stocklist(sno);
		mav.addObject("stockdto", stockdto);
		
		
		//String receipe= order.getO_drink();		
		//재고 업데이트 메서드 호출하기.
			
		stockdao.stock_cofmadd(o_no,sno);
		
		List<Store_DTO> stlist = stdao.storelist();
		mav.addObject("storelist", stlist);

		mav.setViewName("admin/orders/order_list");
		return mav;
	}

}
