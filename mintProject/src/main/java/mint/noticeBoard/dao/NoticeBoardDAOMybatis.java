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
		sqlSession.update("noticeBoardSQL.updateHit", Integer.parseInt(seq));
		return sqlSession.selectOne("noticeBoardSQL.getNoticeBoardView", Integer.parseInt(seq));
	}

	@Override
	public void noticeBoardDelete(Map<String, Object> map) {
		sqlSession.delete("noticeBoardSQL.noticeBoardDelete", map);
	}

	@Override
	public void noticeBoardWrite(Map<String, String> map) {
		sqlSession.insert("noticeBoardSQL.noticeBoardWrite", map);
	}

	@Override
	public NoticeBoardDTO getNoticeBoardArticle(int seq) {
		return sqlSession.selectOne("noticeBoardSQL.getNoticeBoardArticle", seq);
	}

	@Override
	public void noticeBoardModify(Map<String, String> map) {
		sqlSession.update("noticeBoardSQL.noticeBoardModify", map);
	}

}
