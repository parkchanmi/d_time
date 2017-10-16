package controller.admin.orders;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.If;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import controller.admin.product.Product_DAO;
import controller.admin.stock.Stock_DAO;
import controller.admin.store.Store_DAO;
import controller.member.stock.Member_Stock_DAO;
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
	Member_Stock_DAO stock;
	@Autowired
	Stock_DAO stockdao;

	public Stock_DAO getStockdao() {
		return stockdao;
	}

	public void setStockdao(Stock_DAO stockdao) {
		this.stockdao = stockdao;
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
	   public ModelAndView orderlist(ModelAndView mav, HttpSession session, String s_no, Orders_DTO orderdto,
	         HttpServletRequest request) {

	      String pageNum = request.getParameter("pageNum");
	      if (pageNum == null) {
	         pageNum = "1";
	      }
	      int count = 0;
	      int pageSize = 10;
	      int currentPage = Integer.parseInt(pageNum);
	      int startRow = (currentPage - 1) * pageSize + 1;
	      int endRow = currentPage * pageSize;

	      if (s_no == null) { // 발주현황

	         List<Store_DTO> stlist = stdao.storelist();
	         stlist.remove(0);
	         mav.addObject("storelist", stlist);

	         Member_DTO session_member = (Member_DTO) session.getAttribute("login");
	         if (session_member == null) {
	            mav.setViewName("redirect:index.jsp");
	            return mav;
	         }
	         count = ordao.ordercount();
	         int s_no1 = session_member.getS_no();

	         HashMap map = new HashMap();
	         map.put("s_no", s_no1);
	         map.put("startRow", startRow);
	         map.put("endRow", endRow);

	         List<Orders_DTO> list = ordao.orderslist(map);
	         mav.addObject("list", list);
	      }

	      else {

	         int sno = Integer.parseInt(s_no);
	         count = ordao.ordercountOne(sno);
	         
	         HashMap map = new HashMap();
	         map.put("s_no", sno);
	         map.put("startRow", startRow);
	         map.put("endRow", endRow);
	         
	         List<Orders_DTO> ordslist = ordao.orderone(map);
	         mav.addObject("list", ordslist);

	         List<Store_DTO> stlist = stdao.storelist();
	         stlist.remove(0);
	         mav.addObject("storelist", stlist);

	         Store_DTO store = stdao.storeone(sno);
	         mav.addObject("storedto", store);
	         mav.addObject("s_no", s_no);

	      }

	      int number = 0;
	      number = count - (currentPage - 1) * pageSize;

	      session.setAttribute("pageNum", new Integer(pageNum));

	      mav.addObject("currentPage", new Integer(currentPage));
	      mav.addObject("count", count);
	      mav.addObject("startRow", new Integer(startRow));
	      mav.addObject("endRow", new Integer(endRow));
	      mav.addObject("number", new Integer(number));
	      mav.addObject("pageSize", new Integer(pageSize));

	      mav.setViewName("admin/orders/order_list");
	      return mav;
	   }

	@RequestMapping("now_stock.do")
	public String stock_status(int s_no, Model model) {

		List<Stock_DTO> list = stock.selectList(s_no);
		String sname = stdao.storeName(s_no);

		model.addAttribute("list", list);
		model.addAttribute("storeName", sname);
		return "now_stock/stock_status";
	}

	@RequestMapping(value = "/order_detail.do", method = RequestMethod.GET)
	public ModelAndView orderdetail(ModelAndView mav, int o_no) {

		// System.out.println(o_no);

		Orders_DTO order = ordao.orderdtoone(o_no);
		mav.addObject("orderdto", order);
		int sno = order.getS_no();

		String storename = stdao.storeName(sno);
		mav.addObject("storename", storename);

		// System.out.println("sno="+sno);

		List<HashMap> ordrink = stockdao.odrink(o_no, sno);
		mav.addObject("ordrink", ordrink);
		if (ordrink != null)
			mav.addObject("dsize", ordrink.size());

		List<HashMap> orfood = stockdao.orfood(o_no, sno);
		mav.addObject("orfood", orfood);
		if (orfood != null)
			mav.addObject("fsize", orfood.size());

		List<HashMap> orproduct = stockdao.orproduct(o_no, sno);
		mav.addObject("orproduct", orproduct);
		if (orproduct != null)
			mav.addObject("psize", orproduct.size());

		List<HashMap> orthing = stockdao.orthing(o_no, sno);
		mav.addObject("orthing", orthing);
		if (orthing != null)
			mav.addObject("tsize", orthing.size());

		mav.setViewName("admin/orders/order_detail");

		return mav;
	}

	@RequestMapping(value = "/store_confirm.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView orderconfirm(ModelAndView mav, int o_no) {

		ordao.orderstateupdate(o_no);

		Orders_DTO order = ordao.orderdtoone(o_no);
		mav.addObject("orderdto", order);
		int sno = order.getS_no();

		List<Stock_DTO> stockdto = stockdao.stocklist(sno);
		mav.addObject("stockdto", stockdto);

		// String receipe= order.getO_drink();
		// 재고 업데이트 메서드 호출하기.

		stockdao.stock_cofmadd(o_no, sno);

		List<Store_DTO> stlist = stdao.storelist();
		mav.addObject("storelist", stlist);

		mav.setViewName("redirect:/store_order.do");
		return mav;
	}

}
