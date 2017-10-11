package controller.all.member;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;


import model.Member_DTO;

public class Member_DAO extends SqlSessionDaoSupport {
	
	//회원가입
	public int insertMem(Member_DTO memberDto) {
		int x=getSqlSession().insert("mem.insertMem", memberDto);
		return x;
	}
	
	//id중복확인
	public String selectId(String mem_id) {
		String x=getSqlSession().selectOne("mem.selectId", mem_id);
		return x;
	}
	
	//로그인
	public Member_DTO loginMem(Member_DTO memberDTO) {
		Member_DTO x=getSqlSession().selectOne("mem.loginMem", memberDTO);
		return x;
	}

	//지점코드 유무확인
	public HashMap selectcode(String s_code) {
		HashMap x=getSqlSession().selectOne("mem.selectcode", s_code);
		return x;
	}
	
	public Member_DTO selectsno(int s_no) {
		Member_DTO x=getSqlSession().selectOne("mem.selectsno", s_no);
		return x;
	} 
	
	//수정전 비번확인
	public String selectMem(String mem_id, String mem_pwd) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("mem_id", mem_id);
		map.put("mem_pwd",mem_pwd);
	
		String user_pwd=getSqlSession().selectOne("mem.selectPwd", map);
		return user_pwd;
	}
	
	public int updateinfo(Member_DTO memberDTO) {
		int x=getSqlSession().update("mem.updateinfo",memberDTO);
		return x;
	
	}
	
	
	//세영
	public Member_DTO mem_info(int s_no) {

		Member_DTO meminfo = getSqlSession().selectOne("store.selectmem", s_no);
		return meminfo;

	}
	//세영
	public List<Member_DTO> memlist() {

		List<Member_DTO> memlist = getSqlSession().selectList("store.selectMemList");
		return memlist;
	}
/*	//마이페이지
	public Member_DTO myinfo(Member_DTO memberDTO) {
		Member_DTO x=getSqlSession().selectOne("mem.myinfo", memberDTO);
		return x;
	}*/
	
	/*//마이페이지
	public HashMap selectinfo(String mem_pwd, String mem_name, String mem_hp) {
		HashMap <String, String> map = new HashMap<String, String>();
		map.put("mem_pwd", mem_pwd);
		map.put("mem_name", mem_name);
		map.put("mem_hp", mem_hp);

		String user_pwd = getSqlSession().selectOne("mem.selectinfo",map);
		String user_name = getSqlSession().selectOne("mem.selectinfo",map);
		String user_hp = getSqlSession().selectOne("mem.selectinfo",map);
		return map;
		
	}

		
	
	}*/
	//비밀번호찾기
		public Member_DTO pwfind(Member_DTO member_DTO) {
			Member_DTO x=getSqlSession().selectOne("mem.pwfind", member_DTO);
			return x;
		}

		public int pwchange(Member_DTO member_DTO) {
			int x=getSqlSession().update("mem.pwchange",member_DTO);
			return x;
		
		}
}