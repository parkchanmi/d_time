package controller.all.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.Board_DTO;
import model.Board_Type_DTO;
import model.Member_DTO;
import model.Notice_DTO;
import model.Review_DTO;


public class Board_Type_DAO extends SqlSessionDaoSupport {

	public List<Board_Type_DTO> selectType(){
		List<Board_Type_DTO> type = getSqlSession().selectList("admin_btype.selectType");
		return type;
	}
	
	public List<Integer> selectCount(){
		List<Board_Type_DTO> type = getSqlSession().selectList("admin_btype.selectType");
		List<Integer> b_count = new ArrayList<Integer>();
		
		for(int i=0;i<type.size();i++) {
			Board_Type_DTO b_type=type.get(i);
			
			String exist = getSqlSession().selectOne("admin_btype.exist_board",b_type.getBoard_type());
			if(exist==null) {//게시글갯수 0
				b_count.add(0);
			}else {
				int count = getSqlSession().selectOne("admin_btype.select_b_count",b_type.getBoard_type());
				b_count.add(count);
			}
			
		}
		return b_count;
	}
	
	public int delete_temp(String type,int index) {//임시제거
		getSqlSession().update("admin_btype.sortIndex",index);
		int x= getSqlSession().delete("admin_btype.tempDelete",type);
		return x;
	}
	public int delete_cor(String type) {//완전제거
		int x= getSqlSession().delete("admin_btype.corDelete",type);
		return x;
	}
	
	public int add_type(String type) {
		//존재하는지 check 
		String exist = getSqlSession().selectOne("admin_btype.existType",type);
		if(exist!=null) return 3; //이미 존재함 
		Board_Type_DTO bdto = new Board_Type_DTO();
		bdto.setBoard_type(type);
		int index = getSqlSession().selectOne("admin_btype.maxIndex");
		bdto.setRow_index(index+1);
		int x= getSqlSession().insert("admin_btype.add_type",bdto);
		return x;
	}

	public void update_index(String[] b_type) {
		for(int i=0;i<b_type.length;i++) {
			HashMap map = new HashMap();
			map.put("type", b_type[i]);
			map.put("index", i+1);
			getSqlSession().update("admin_btype.updateIndex",map);
		}
		
	}

	

}


 



 