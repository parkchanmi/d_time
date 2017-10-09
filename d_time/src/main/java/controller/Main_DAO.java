package controller;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Board_DTO;
import model.Member_DTO;
import model.Notice_DTO;
import model.Review_DTO;


public class Main_DAO extends SqlSessionDaoSupport {
	
	public List<Notice_DTO> getNoticeMain() {
		List<Notice_DTO> nlist = getSqlSession().selectList("main.notice_main");
		return nlist;
		
	}
	
	public List<Board_DTO> getBoardMain() {
		List<Board_DTO> blist = getSqlSession().selectList("main.board_main");
		return blist;
		
	}
	
	public int getStore_1() { //직영
		int count = getSqlSession().selectOne("main.store_1");
		return count;
		
	}
	public int getStore_2() { //가맹
		int count = getSqlSession().selectOne("main.store_2");
		return count;
	}



   
	 

}


 



 