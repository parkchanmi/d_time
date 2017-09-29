package controller.member;

import java.util.HashMap;

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
		System.out.println(x);
		return x;
	}
	
/*	//마이페이지
	public Member_DTO myinfo(Member_DTO memberDTO) {
		Member_DTO x=getSqlSession().selectOne("mem.myinfo", memberDTO);
		return x;
	}*/
	
	//마이페이지
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

	

}
