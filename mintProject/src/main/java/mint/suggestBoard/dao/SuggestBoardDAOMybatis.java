package mint.suggestBoard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mint.suggestBoard.bean.SuggestBoardDTO;

@Repository("suggestBoardDAO")
public class SuggestBoardDAOMybatis implements SuggestBoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void writeSuggestBoard(SuggestBoardDTO suggestBoardDTO) {
		sqlSession.insert("suggestBoardSQL.writeSuggestBoard", suggestBoardDTO);
	}

	@Override
	public List<SuggestBoardDTO> getSuggestBoardList(Map<String, Object> map) {
		return sqlSession.selectList("suggestBoardSQL.getSuggestBoardList", map);		
	}

	@Override
	public int getSuggestBoardTotArticle(String id) {
		return sqlSession.selectOne("suggestBoardSQL.getSuggestBoardTotArticle", id);
	}

	@Override
	public SuggestBoardDTO getSuggestBoard(int seq) {
		return sqlSession.selectOne("suggestBoardSQL.getSuggestBoard", seq);
	}

	@Override
	public void updateSuggestBoard(SuggestBoardDTO suggestBoardDTO) {
		sqlSession.update("suggestBoardSQL.updateSuggestBoard", suggestBoardDTO);
	}

	@Override
	public void deleteSuggestBoard(int seq) {
		sqlSession.delete("suggestBoardSQL.deleteSuggestBoard", seq);
		
	}

}
