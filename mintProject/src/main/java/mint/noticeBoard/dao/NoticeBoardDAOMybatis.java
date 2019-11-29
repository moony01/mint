package mint.noticeBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.noticeBoard.bean.NoticeBoardDTO;

@Transactional
@Repository("noticeBoardDAO")
public class NoticeBoardDAOMybatis implements NoticeBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<NoticeBoardDTO> noticeBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("noticeBoardSQL.noticeBoardList", map);
	}

	@Override
	public int getTotalNotice() {
		return sqlSession.selectOne("noticeBoardSQL.getTotalNotice");
	}

	@Override
	public List<NoticeBoardDTO> noticeBoardSearch(Map<String, Object> map) {
		return sqlSession.selectList("noticeBoardSQL.noticeBoardSearch", map);
	}

	@Override
	public int getSearchTotalNotice(Map<String, Object> map) {
		return sqlSession.selectOne("noticeBoardSQL.getSearchTotalNotice", map);
	}

	@Override
	public NoticeBoardDTO getNoticeBoardView(String seq) {
		return sqlSession.selectOne("noticeBoardSQL.getNoticeBoardView", Integer.parseInt(seq));
	}

	@Override
	public void noticeBoardDelete(Map<String, Object> map) {
		sqlSession.delete("noticeBoardSQL.noticeBoardDelete", map);
	}

}
