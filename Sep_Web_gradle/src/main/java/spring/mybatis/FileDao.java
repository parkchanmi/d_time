package spring.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class FileDao extends SqlSessionDaoSupport{
	/*SqlSessionFactory를 주입받아 
	getSqlSession()로 SqlSession객체 리턴 */
/*	SqlSession session;

	public void setSession(SqlSession session) {
		this.session = session;
	}*/

	public List<FileDTO> selectAllFile() {
		return getSqlSession().selectList("myFile.selectAll");
		}
	public int insertFile(FileDTO fdto) {
		int x = getSqlSession().insert("myFile.insert",fdto);
		return x;
	}
}
