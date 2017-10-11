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
import model.Board_Type_DTO;
import model.Member_DTO;
import model.Review_DTO;


@Controller
public class Board_Controller {
	@Autowired
	Board_DAO b_dao;
	
	@Autowired
	Board_Type_DAO bt_dao;
	
	public Board_DAO getB_dao() {
		return b_dao;
	}

	public void setB_dao(Board_DAO b_dao) {
		this.b_dao = b_dao;
	}
	
	@RequestMapping("board_list.do")
	public String board_list(String type, Model model,HttpServletRequest request, HttpSession session){
		
		String b_type;
		b_type=type;
		/*if(type ==1) {
			b_type ="건의사항";
		}else {
			b_type="물물교환";
		} */
		//System.out.println("�Խ���Ÿ��:"+type);
		
		
		
		String pageNum = request.getParameter("pageNum"); 
		System.out.println("pageNum1:"+pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum2:"+pageNum);
		int count = b_dao.Board_Count(b_type);  
		int pageSize = 10;
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		HashMap map = new HashMap();
		map.put("b_type", b_type);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		List<Board_DTO> list = b_dao.selectList(map); 
		
		int number = 0;
		number = count - (currentPage - 1) * pageSize;
		session.setAttribute("pageNum", new Integer(pageNum)); 
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("count", count);
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("pageSize",new Integer(pageSize));
		model.addAttribute("list", list);
		model.addAttribute("type", 1);
		/*System.out.println(list);*/
		
		return "board/board_list";
		
		}
/*�۾���*/
	@RequestMapping(value="board_writeForm.do", method = RequestMethod.GET)
	public String boardform(int type, Model model,int pageNum) {
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type", type); 
		
		List<Board_Type_DTO> typeList = bt_dao.selectType();
		model.addAttribute("typelist", typeList);
		
		return "board/board_writeForm"; 
		
		 
	}
	
	/*�۾��⴩���� �ٽø���Ʈ��*/
	@RequestMapping(value="board_writeForm.do", method = RequestMethod.POST)
	public String boardsubmit(Board_DTO Board_DTO,int type, Model model,int pageNum) {
		
		
		//System.out.println("�Խ���Ÿ��:"+type);
		b_dao.insertBoard(Board_DTO) ;
		 // System.out.println("b_type"+Board_DTO.getB_type());
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type", type);
		return "redirect:board_list.do";
	}
	
	/*@RequestMapping(value="board_detail.do", method = RequestMethod.GET)
	public String board(Board_DTO Board_DTO, HttpSession session) {
		Board_DTO board = b_dao.selectBoard_detail(Board_DTO);
	
		          
		session.setAttribute("board", board);
		 
		return "board/board_detail";
	} */  
	
	/*�󼼺���*/
	@RequestMapping(value ="board_detail.do", method = RequestMethod.GET)
	public ModelAndView handleRequest1(ModelAndView mav,int b_no, HttpSession session, Review_DTO review_dto,int type,int pageNum){
		
		/*//Member_DTO session�� ����
		Member_DTO member = b_dao.selectMember();
		session.setAttribute("member", member);*/
		
		Board_DTO board =  b_dao.selectBoard_detail(b_no);  
		List<Review_DTO> reviewlist = b_dao.selectListR(b_no); 
		b_dao.updateBoard_Count(b_no); 
		mav.addObject("pageNum", new Integer(pageNum));
		mav.addObject("reviewlist", reviewlist); 
		mav.addObject("board", board);  
		mav.addObject("type", type);   
		mav.setViewName("board/board_detail");

		//System.out.println("board"+board); 
		return mav;
		
		}

	/*��۵��*/	

	@RequestMapping(value="board_detail.do", method = RequestMethod.POST)
	public String reviewsubmit(Review_DTO Review_DTO,int type,Model model,int pageNum) {
		
		b_dao.insertReview(Review_DTO) ;
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type", type);
		return "redirect:board_detail.do?b_no="+Review_DTO.getB_no();
	}
	 
	/*�ۻ���*/
	
	@RequestMapping(value="board_delete.do", method = RequestMethod.GET)
	public String delete(int b_no,int type,Model model) {
		b_dao.deleteBoard(b_no) ;
		model.addAttribute("type", type);
		return "redirect:board_list.do";
	}
	/*�ۼ���*/
	@RequestMapping(value="board_modifyForm.do", method = RequestMethod.GET)
	public String modify(int type,Model model,int b_no) {
		//b_dao.modifyBoard(b_no); 

		Board_DTO board =  b_dao.selectBoard_detail(b_no); 
		model.addAttribute("board", board); 
		model.addAttribute("type",type); 
		return "board/board_modifyForm";
	}
	
	/*�ۼ��������� �ٽø���Ʈ��*/
	@RequestMapping(value="board_modifyForm.do", method = RequestMethod.POST)
	public String boardupdatesubmit(int b_no,Board_DTO Board_DTO,int type, Model model) {
		
		
		//System.out.println("�Խ���Ÿ��:"+type); 
		b_dao.modifyBoard(Board_DTO); 
		Board_DTO board =  b_dao.selectBoard_detail(b_no);   
		model.addAttribute("board", board);
		model.addAttribute("type", type);
		return "redirect:board_list.do";
	}
	


}
