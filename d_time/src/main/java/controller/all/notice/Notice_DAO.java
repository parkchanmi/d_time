package controller.all.notice;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Notice_DTO;


public class Notice_DAO extends SqlSessionDaoSupport{
	
	
	public List<Notice_DTO> getNoticeList() {
		List<Notice_DTO> nlist = getSqlSession().selectList("notice_db.notice_all");
		return nlist;
		
	}

}
