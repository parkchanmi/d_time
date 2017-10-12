package controller.all.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Board_DTO;
import model.Member_DTO;
import model.Review_DTO;


public class Board_DAO extends SqlSessionDaoSupport {
	
	
	public List<Board_DTO> selectList(HashMap map){
		List<Board_DTO> b = getSqlSession().selectList("board.selectBoard",map);
		return b;
	}

	public int insertBoard(Board_DTO Board_DTO) {
		int x = getSqlSession().insert("board.insertBoard", Board_DTO);
		return x;
		
	}
	
	public Board_DTO selectBoard_detail(int b_no) { 
		Board_DTO b = getSqlSession().selectOne("board.selectBoard_detail", b_no);
		//System.out.println("b"+b);
		return b;    
		 
	} 
	
	public int insertReview(Review_DTO Review_DTO) {
		int x = getSqlSession().insert("board.insertReview", Review_DTO);
		return x;
		
	}
	
	public List<Review_DTO> selectListR(int b_no){
		List<Review_DTO> r = getSqlSession().selectList("board.selectReview",b_no);
		return r;
	}
 
	public int updateBoard_Count(int b_no) {
		int c = getSqlSession().update("board.updateBoard_count",b_no);
		return c;
	}
	
	public int Board_Count(String b_type) {
		int c = getSqlSession().selectOne("board.selectCount", b_type);
		return c;
	}

	public int deleteBoard(int b_no) {
		int b = getSqlSession().delete("board.deleteBoard",b_no);
		return b;
	}
 
	public int modifyBoard(Board_DTO board_DTO) { 
		int m = getSqlSession().update("board.modifyBoard",board_DTO); 
		return m; 
	}

	public int deleteReview(int r_no) {
		int r = getSqlSession().delete("board.deleteReview",r_no);
		
		return r;
	}

	public List<Board_DTO> searchBoard(String keyword,String b_type,int startRow,int endRow) {
		keyword= "%"+keyword+"%";
		HashMap<Object,Object> map = new HashMap<Object,Object>();
		map.put("keyword", keyword);
		map.put("b_type", b_type);
		map.put("startRow", startRow); 
		map.put("endRow", endRow);
		List<Board_DTO> s = getSqlSession().selectList("board.searchBoard", map); 
		// TODO Auto-generated method stub
		return s;
		
	}

	


   
	 

}


 



 