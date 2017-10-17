package controller.admin.store;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import controller.all.member.Member_DAO;
import model.Member_DTO;
import model.Store_DTO;

@Controller
public class Store_Controller {

	@Autowired
	Store_DAO stdao;
	
	@Autowired
	Member_DAO memdao;

	public Member_DAO getMemdao() {
		return memdao;
	}

	public void setMemdao(Member_DAO memdao) {
		this.memdao = memdao;
	}

	public Store_DAO getStdao() {
		return stdao;
	}

	public void setStdao(Store_DAO stdao) {
		this.stdao = stdao;
	}

	@RequestMapping(value = "/store_list.do", method = RequestMethod.GET)
	public ModelAndView storelist(String type,ModelAndView mav, HttpSession session) {
		if(type==null)
			type="all";
		if(type.equals("all")||type==null) {
			List<Store_DTO> stlist = stdao.storelist();
			mav.addObject("storelist", stlist);
		}
		if(type.equals("zik")) {
			List<Store_DTO> stlist = stdao.storelist_J();
			mav.addObject("storelist", stlist);
		}
		if(type.equals("ga")) {
			List<Store_DTO> stlist = stdao.storelist_G();
			mav.addObject("storelist", stlist);
		}
		
		List<Member_DTO> memlist = memdao.memlist();

		session.setAttribute("memlist", memlist);
		mav.addObject("type",type);
		mav.setViewName("admin/store/store_list");

		return mav;
	}

	@RequestMapping(value = "/store_info.do", method = RequestMethod.GET)
	public ModelAndView storeinfo(ModelAndView mav, int s_no) {

		Store_DTO store = stdao.storeone(s_no);
		mav.addObject("storedto", store);

		Member_DTO mdto = memdao.mem_info(s_no);
		mav.addObject("memdto", mdto);

		mav.setViewName("admin/store/store_info");

		return mav;
	}

	@RequestMapping(value = "/store_regist.do", method = RequestMethod.GET)
	public ModelAndView storereg(ModelAndView mav, Store_DTO storedto) {

		List<Store_DTO> stlist = stdao.storelist();

		mav.addObject("storelist", stlist);
		
		mav.setViewName("admin/store/store_reg");

		return mav;
	}

	@RequestMapping(value = "/store_regist.do", method = RequestMethod.POST)
	public ModelAndView storesubmit(ModelAndView mav, Store_DTO storedto) {

		stdao.storeinsert(storedto);

		List<Store_DTO> stlist = stdao.storelist(); // 메서드 실행

		mav.addObject("storelist", stlist);
		mav.setViewName("redirect:/store_list.do");

		return mav;
	}

	@RequestMapping(value = "/store_modify.do", method = RequestMethod.GET)
	public ModelAndView storemodify(ModelAndView mav, int s_no) {

		Store_DTO store = stdao.storeone(s_no);
		mav.addObject("storedto", store);

		mav.setViewName("admin/store/store_modify");

		return mav;
	}

	@RequestMapping(value = "/store_modify.do", method = RequestMethod.POST)
	public ModelAndView storemodifyComplete(ModelAndView mav, Store_DTO storedto, int s_no) {

		// stdao.storeinsert(storedto);

		stdao.storeupdate(storedto); //정보수정
		memdao.memupdate(s_no,storedto.getS_type());
		
		
		Store_DTO store = stdao.storeone(s_no);

		mav.addObject("storedto", store);

		Member_DTO mdto = memdao.mem_info(s_no);
		mav.addObject("memdto", mdto);

		mav.setViewName("admin/store/store_info");

		return mav;
	}

	@RequestMapping(value = "/store_delete.do", method = RequestMethod.GET)
	public ModelAndView storedelete(ModelAndView mav, int s_no,Store_DTO storedto) {

		
		stdao.storedelete(s_no);

		List<Store_DTO> stlist = stdao.storelist(); // 메서드 실행

		mav.addObject("storelist", stlist);
		mav.setViewName("admin/store/store_list");

		return mav;
	}

}
