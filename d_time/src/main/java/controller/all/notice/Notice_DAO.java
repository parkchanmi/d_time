package controller.all.notice;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Notice_DTO;


public class Notice_DAO extends SqlSessionDaoSupport{
	
	

	public List<Notice_DTO> getNoticeList(HashMap map) {
		List<Notice_DTO> nlist = getSqlSession().selectList("notice_db.notice_all",map);
		return nlist; 
		 
	}

	public Notice_DTO getNoticeOne(int n_no) {
		Notice_DTO ndto = getSqlSession().selectOne("notice_db.notice_one",n_no);
		getSqlSession().update("notice_db.notice_countUp",n_no);
		return ndto;
	}

	public int write_notice(Notice_DTO ndto) {
		int x = getSqlSession().insert("notice_db.write_notice",ndto);
		return x;
	}
	public int write_notice_file(Notice_DTO ndto) {
		int x = getSqlSession().insert("notice_db.write_notice_file",ndto);
		return x;
	}

	public int modify_notice(Notice_DTO ndto) {
		int x = getSqlSession().update("notice_db.modify_notice",ndto);
		return x;
	}

	public int delete_notice(int n_no) {
		int x = getSqlSession().delete("notice_db.delete_notice",n_no);
		return x;
	}

	public int Notice_Count() {
		int x = getSqlSession().selectOne("notice_db.count_notice");
		return x;
	}

}
