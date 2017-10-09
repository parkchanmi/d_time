package controller.all.board;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Board_DTO;
import model.Member_DTO;
import model.Notice_DTO;
import model.Review_DTO;


public class Board_Type_DAO extends SqlSessionDaoSupport {

	public List<String> selectType(){
		List<String> type = getSqlSession().selectList("board.selectType");
		return type;
	}

	

}


 



 