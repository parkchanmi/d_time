package controller.all.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import model.Board_DTO;
import model.Member_DTO;
import model.Review_DTO;


@Controller
public class Board_Type_Controller {
	@Autowired
	Board_Type_DAO bdao;
	
	public Board_Type_DAO  getB_dao() {
		return bdao;
	}

	public void setB_dao(Board_Type_DAO  b_dao) {
		this.bdao = b_dao;
	}
	
	public String board_manage(Model model) {
		List<String> typeList = bdao.selectType();
		model.addAttribute("typelist", typeList);
		return "admin/board_manage";
	}


}
