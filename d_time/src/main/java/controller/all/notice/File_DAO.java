package controller.all.notice;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.File_DTO;
import model.Notice_DTO;


public class File_DAO extends SqlSessionDaoSupport{
	
	
	public int insertFile(File_DTO fdto) {
		int x = getSqlSession().insert("notice_db.upload_file",fdto);
		if(x!=1) return x;
		else x=selectF_no(fdto.getF_path());
		return x;
	}
	
	public int selectF_no(String f_path) {
		int f_no = getSqlSession().selectOne("notice_db.upload_fno",f_path);
		return f_no;
	}

	public String getFilePath(int f_no) {
		String file_path = getSqlSession().selectOne("notice_db.get_filePath",f_no);
		return file_path;
	}

	public String getFileName(int f_no) {
		String file_name = getSqlSession().selectOne("notice_db.get_fileName",f_no);
		return file_name;
	}

}
