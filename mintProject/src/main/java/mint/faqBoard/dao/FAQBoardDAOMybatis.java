package mint.faqBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.faqBoard.bean.FAQBoardDTO;

@Transactional
@Repository("faqBoardDAO")
public class FAQBoardDAOMybatis implements FAQBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<FAQBoardDTO> getBoardList(Map<String, Integer> map) {
		return sqlSession.selectList("faqBoardSQL.getFAQBoardList", map);
	}

	@Override
	public int getTotalArticle() {
		return sqlSession.selectOne("faqBoardSQL.getFAQTotalArticle");
	}

	@Override
	public List<FAQBoardDTO> faqBoardSearch(Map<String, Object> map) {
		return sqlSession.selectList("faqBoardSQL.faqBoardSearch", map);
	}

	@Override
	public int getSearchTotalArticle(Map<String, Object> map) {
		return sqlSession.selectOne("faqBoardSQL.getSearchTotalArticle", map);
	}

	@Override
	public void faqBoardWrite(Map<String, String> map) {
		sqlSession.insert("faqBoardSQL.faqBoardWrite", map);		
	}

	@Override
	public FAQBoardDTO getFAQArticle(int seq) {
		return sqlSession.selectOne("faqBoardSQL.getFAQArticle", seq);
	}

	@Override
	public List<FAQBoardDTO> faqCategory(Map<String, Object> map) {
		return sqlSession.selectList("faqBoardSQL.faqCategorySearchList", map);
	}

	@Override
	public int getFAQCategoryTotalArticle(Map<String, Object> map) {
		return sqlSession.selectOne("faqBoardSQL.getFAQCategoryTotalArticle", map);
	}

}
