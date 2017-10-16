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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Board_DTO;
import model.Member_DTO;
import model.Review_DTO;


@Controller
public class Board_Controller {
	@Autowired
	Board_DAO b_dao;
	
	public Board_DAO getB_dao() {
		return b_dao;
	}

	public void setB_dao(Board_DAO b_dao) {
		this.b_dao = b_dao;
	}
	
	@RequestMapping(value="board_list.do", method = RequestMethod.GET)
	public String board_list(String type, Model model,HttpServletRequest request, HttpSession session,
			@RequestParam(defaultValue="title")String searchOption, @RequestParam(defaultValue="")String keyword){
		String b_type=type;
		System.out.println("게시판타입1:"+b_type);
		System.out.println("게시판타입:"+type);
		
		
		
		String pageNum = request.getParameter("pageNum"); 
		//System.out.println("pageNum1:"+pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
		//System.out.println("pageNum2:"+pageNum);
		int count = b_dao.Board_Count(b_type);  
		int pageSize = 10;
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
	
		HashMap<Object,Object> map = new HashMap<Object,Object>();
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
		model.addAttribute("type", type);
		/*System.out.println(list);*/ 
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		
		
		if(mdto.getMem_type().equals("관리자")) {
			return "admin/board/board_list";
		}
		return "board/board_list";
		
		}
	
/*글쓰기*/
	@RequestMapping(value="board_writeForm.do", method = RequestMethod.GET)
	public String boardform(String type, Model model,int pageNum,HttpSession session) {
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type", type); 
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		
		if(mdto.getMem_type().equals("관리자")) {
			return "admin/board/board_writeForm";
		}
		return "board/board_writeForm"; 
		
		 
	}
	
	/*글쓰기누르면 다시리스트로*/
	@RequestMapping(value="board_writeForm.do", method = RequestMethod.POST)
	public String boardsubmit(Board_DTO Board_DTO,String type, Model model,int pageNum) {
		
		
		//System.out.println("게시판타입:"+type);
		b_dao.insertBoard(Board_DTO) ;
		 // System.out.println("b_type"+Board_DTO.getB_type());
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type", type);
		return "redirect:board_list.do";
	}
	
	
	
/*상세보기*/
	@RequestMapping(value ="board_detail.do", method = RequestMethod.GET)
	public ModelAndView handleRequest1(ModelAndView mav,int b_no, HttpSession session, Review_DTO review_dto,String type,int pageNum){
		
		/*//Member_DTO session에 저장
		Member_DTO member = b_dao.selectMember();
		session.setAttribute("member", member);*/
		
		Board_DTO board =  b_dao.selectBoard_detail(b_no);  
		
		List<Review_DTO> reviewlist = b_dao.selectListR(b_no); 
		b_dao.updateBoard_Count(b_no); 
		mav.addObject("pageNum", new Integer(pageNum));
		mav.addObject("reviewlist", reviewlist); 
		mav.addObject("board", board);  
		mav.addObject("type", type);   
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		
		if(mdto.getMem_type().equals("관리자")) {
			mav.setViewName("admin/board/board_detail");
		}else {
			mav.setViewName("board/board_detail");
		}
		
		
		//System.out.println("board"+board); 
		return mav;
		
		}

	/*댓글등록*/	

	@RequestMapping(value="board_detail.do", method = RequestMethod.POST)
	public String reviewsubmit(Review_DTO Review_DTO,String type,Model model,int pageNum) {
		
		b_dao.insertReview(Review_DTO) ;
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type", type);
		return "redirect:board_detail.do?b_no="+Review_DTO.getB_no();
	}
	 
/*글삭제*/	
	@RequestMapping(value="board_delete.do", method = RequestMethod.GET)
	public String delete(int b_no,String type,Model model) {
		b_dao.deleteBoard(b_no) ;

		
		model.addAttribute("type", type);
		return "redirect:board_list.do";
	}
	
	/*리뷰삭제*/
	
	@RequestMapping(value="board_deletereview.do", method = RequestMethod.GET)
	public String delete2(int r_no,Model model,int b_no,String type,int pageNum) {
		
		 
		b_dao.deleteReview(r_no);
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type", type);
		model.addAttribute("b_no", b_no);
		
	
		return "redirect:board_detail.do";
	}
	
	/*글수정*/
	@RequestMapping(value="board_modifyForm.do", method = RequestMethod.GET)
	public String modify(String type,Model model,int b_no,HttpSession session) {
		//b_dao.modifyBoard(b_no); 

		Board_DTO board =  b_dao.selectBoard_detail(b_no); 
		model.addAttribute("board", board); 
		model.addAttribute("type",type); 
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		
		if(mdto.getMem_type().equals("관리자")) {
			return "admin/board/board_modifyForm";
		}	
		return "board/board_modifyForm";
	}
	
	/*글수정누르면 다시상세보기로*/
	@RequestMapping(value="board_modifyForm.do", method = RequestMethod.POST)
	public String boardupdatesubmit(int b_no,Board_DTO Board_DTO,String type, Model model,int pageNum) {
		
		Board_DTO board =  b_dao.selectBoard_detail(b_no);
		//System.out.println("게시판타입:"+type); 
		b_dao.modifyBoard(Board_DTO);
		model.addAttribute("board", board);
		model.addAttribute("pageNum", new Integer(pageNum));
		model.addAttribute("type",type); 
		return "redirect:board_detail.do?b_no="+Board_DTO.getB_no();
	}
	
	/*검색*/
	@RequestMapping(value="board_search.do", method = RequestMethod.POST)
	public String search(Model model,String keyword,String searchOption,HttpServletRequest request,String type,HttpSession session) {
		//System.out.println("type3"+type);
		/*String b_type;
		if(type ==1) {
			b_type ="건의사항";
		}else {
			b_type="물품교환";
		} */
		//System.out.println("b2"+b_type);
		
		String b_type=type;
		
		System.out.println("type1:"+type);
	
		
		String pageNum = request.getParameter("pageNum"); 
		//System.out.println("pageNum1:"+pageNum);
		if (pageNum == null) {
			pageNum = "1";
		}
	System.out.println("pageNum2:"+pageNum);
		int count = b_dao.Board_Count(b_type);  
		int pageSize = 10;
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		//System.out.println("size"+pageSize);
		//System.out.println("currentpage"+currentPage);
		int endRow = currentPage * pageSize;
		
		List<Board_DTO> blist = b_dao.searchBoard(searchOption,keyword,b_type,startRow,endRow); 
		if(blist!=null) {
			//System.out.println("검색결과:"+blist.size());
			count = blist.size();
		}
		
		int number = 0;
		number = count - (currentPage - 1) * pageSize;
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("currentPage", 1);
		model.addAttribute("count", count);
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("number", new Integer(number));
		model.addAttribute("pageSize",new Integer(pageSize));
		model.addAttribute("list", blist);
		model.addAttribute("type", b_type);
		System.out.println("type2:"+type);
		
		
		
		
		Member_DTO mdto = (Member_DTO) session.getAttribute("login");
		
		
		if(mdto.getMem_type().equals("관리자")) {
			return "admin/board/board_list";
		}
		return "board/board_list";
		
		
	}


}
