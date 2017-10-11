package controller.member.message;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Member_DTO;
import model.Message_DTO;

public class Msg_DAO extends SqlSessionDaoSupport{
	
	/*����������*/
	public List<Message_DTO> select_rcvList(int mem_no){
		List<Message_DTO> x = getSqlSession().selectList("message.selectMsgRcv",mem_no);
		for(int i=0;i<x.size();i++) {
			int r_mno=x.get(i).getMsg_receiver();
			int s_mno=x.get(i).getMsg_sender();
			
			String rcv_sname = getSqlSession().selectOne("message.selectRcvname",r_mno);
			String sen_sname = getSqlSession().selectOne("message.selectSendname",s_mno);
			x.get(i).setRcv_sname(rcv_sname);
			x.get(i).setSen_sname(sen_sname);
		}
		return x;
	}
	/*����������*/
	public List<Message_DTO> select_senList(int mem_no){
		List<Message_DTO> x = getSqlSession().selectList("message.selectMsgSen",mem_no);
		for(int i=0;i<x.size();i++) {
			int r_mno=x.get(i).getMsg_receiver();
			int s_mno=x.get(i).getMsg_sender();
			
			String rcv_sname = getSqlSession().selectOne("message.selectRcvname",r_mno);
			String sen_sname = getSqlSession().selectOne("message.selectSendname",s_mno);
			x.get(i).setRcv_sname(rcv_sname);
			x.get(i).setSen_sname(sen_sname);		
		}
		return x;
	}
	/*��������*/
	public Message_DTO select_datail(int msg_no) {
		Message_DTO x=getSqlSession().selectOne("message.selectDetail", msg_no);
		int r_mno=x.getMsg_receiver();
		int s_mno=x.getMsg_sender();
		
		String rcv_sname = getSqlSession().selectOne("message.selectRcvname",r_mno);
		String sen_sname = getSqlSession().selectOne("message.selectSendname",s_mno);
		x.setRcv_sname(rcv_sname);
		x.setSen_sname(sen_sname);
		
		return x;
	}


	/*��������*/
	public int msg_write(Message_DTO message_DTO) {
		int x = getSqlSession().insert("message.msgWrite", message_DTO);
		return x;	
	}
	
	/*�����������������ϱ�*/
	public List<HashMap> msgselect() {
		List<HashMap> map= getSqlSession().selectList("message.selectMsg");
		return map;
	}
	
	//쪽지 삭제
	public int deleteMsg(int msg_no) {
		int x = getSqlSession().delete("message.deleteMsg",msg_no);
		return x;
	}
}
