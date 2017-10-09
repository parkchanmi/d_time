package controller.member.stock;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Stock_DTO;


public class Member_Stock_DAO extends SqlSessionDaoSupport{
	
	public List<Stock_DTO> selectList(int s_no) {
		
		List<Stock_DTO> x = getSqlSession().selectList("stock.stock_list",s_no);
		return x;
	
	}


}

